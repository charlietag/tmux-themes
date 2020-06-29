# --------------------- bind key ---------------------
# Toggle will conflicts with split-status-bar

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
  tmux set -g @theme-dark-mode 'on'
  tmux source-file ${theme_file}

}

theme_dark_mode_off() {
  local theme_file="${CURRENT_DIR}/src/main.theme"
  tmux set -g @theme-dark-mode 'off'
  tmux source-file ${theme_file}

}

theme_dark_mode_toggle() {
	local theme_dark_mode="$1"
  if [[ "${theme_dark_mode}" = "off" ]]; then
    theme_dark_mode_on
  else
    theme_dark_mode_off
  fi
}

