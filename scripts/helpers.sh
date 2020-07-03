# --------------------- bind key ---------------------
# Toggle feature is not Fully Compatible with "split-status-bar" "tmux-cpu-model"
# you'd better use config "theme-dark-mode" then, do a tmux RELOAD (<prefix> R) instead

theme_dark_mode_bind_key() {
  # unbind all tmux-split-statusbar related
  tmux list-keys |grep tmux-themes | awk '{print $2" "$3" "$4}' | xargs -i bash -c "tmux unbind-key {}"

  # Define bind key for status bar togle
  local bind_key="$(tmux show-option -gqv "@theme-dard-mode-bindkey")"
  [[ -z "${bind_key}" ]] && bind_key="T"
  tmux bind-key ${bind_key} run-shell '~/.tmux/plugins/tmux-themes/theme.tmux toggle'

}


# --------------------- Env Var ---------------------
theme_env_setup() {
  local status_right_length="$(hostname | wc -c)"
  local status_right_length="$((100 + ${status_right_length}))"
  local whoami="$(whoami)"
  tmux set -g @whoami "${whoami}"

  local os_ver="$(lsb_release -irs | cut -d'.' -f-2)"
  tmux set -g @os_ver "${os_ver}"

  #--- This way will cause ---> value is invalid: #{@status-right-length} ---
  #tmux set -g @status-right-length "${status_right_length}"   

  tmux set -g status-right-length "${status_right_length}"
}

# --------------------- Dark Mode ---------------------
theme_dark_mode_on() {
  local theme_file="${CURRENT_DIR}/src/main_dark.theme"
  tmux source-file ${theme_file}

}

theme_dark_mode_off() {
  local theme_file="${CURRENT_DIR}/src/main.theme"
  tmux source-file ${theme_file}

}

theme_dark_mode_toggle() {
  if [[ "${theme_dark_mode_setto}" = "off" ]]; then
    theme_dark_mode_on
    tmux set -g @theme-dark-mode-setto 'on'
  else
    theme_dark_mode_off
    tmux set -g @theme-dark-mode-setto 'off'
  fi


  # --- For support tmux-cpu-model (set -ga status-left) ---
  local check_plugin_status="$(cat ~/.tmux.conf |awk '/^[ \t]*set(-option)? +-g +@plugin/ { gsub(/'\''/,""); gsub(/'\"'/,""); print $4 }' | grep 'charlietag/tmux-cpu-model')"

  if [[ -n "${check_plugin_status}" ]]; then
		local plugin_script="$(readlink -m ~/.tmux/plugins/tmux-cpu-model/cpu-model.tmux)"
    if [[ -f "${plugin_script}" ]]; then
      if [[ "${theme_dark_mode_setto}" = "off" ]]; then
        # dark-on set to on , because of dark_mode_toggle
        ${plugin_script} dark-on no-reload
      else
        # dark-on set to off , because of dark_mode_toggle
        ${plugin_script} dark-off no-reload
      fi
    fi
  fi

  # --- For support tmux-coninuum ---
  local check_plugin_status="$(cat ~/.tmux.conf |awk '/^[ \t]*set(-option)? +-g +@plugin/ { gsub(/'\''/,""); gsub(/'\"'/,""); print $4 }' | grep 'tmux-plugins/tmux-continuum')"

  if [[ -n "${check_plugin_status}" ]]; then
		local plugin_script="$(readlink -m ~/.tmux/plugins/tmux-continuum/continuum.tmux)"
    if [[ -f "${plugin_script}" ]]; then
      ${plugin_script} >/dev/null 2>/dev/null
    fi

  fi

  # --- For support tmux-split-statusbar ---
  local check_plugin_status="$(cat ~/.tmux.conf |awk '/^[ \t]*set(-option)? +-g +@plugin/ { gsub(/'\''/,""); gsub(/'\"'/,""); print $4 }' | grep 'charlietag/tmux-split-statusbar')"

  if [[ -n "${check_plugin_status}" ]]; then
		local plugin_script="$(readlink -m ~/.tmux/plugins/tmux-split-statusbar/tmux-split-statusbar.tmux)"
    if [[ -f "${plugin_script}" ]]; then
      ${plugin_script} reload
    fi
  fi

}

