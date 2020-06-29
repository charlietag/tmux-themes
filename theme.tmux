#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"


main() {
	local toggle_flag="$1"

  local theme_dark_mode="$(tmux show-option -gqv "@theme-dark-mode")"
  [[ "${theme_dark_mode}" != "on" ]] && theme_dark_mode="off"


  if [[ "${toggle_flag}" != "toggle" ]]; then
    # ---- Initialize theme.tmux instance---
    theme_dark_mode_bind_key
    theme_env_setup


    if [[ "${theme_dark_mode}" = "off" ]]; then
      theme_dark_mode_off
    else
      theme_dark_mode_on
    fi
    # ---- Initialize theme.tmux instance---
  else

    # ---- theme must be initialized (existing tmux themes instance) ---
    theme_dark_mode_toggle "${theme_dark_mode}"
    # ---- theme must be initialized (existing tmux themes instance) ---
  fi
}

main "$1"

