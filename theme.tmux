#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"


main() {
  local toggle_flag="$1"

  local theme_dark_mode="$(tmux show-option -gqv "@theme-dark-mode")"
  [[ "${theme_dark_mode}" != "on" ]] && theme_dark_mode="off"

  local theme_dark_mode_setto="$(tmux show-option -gqv "@theme-dark-mode-setto")"


  if [[ "${toggle_flag}" = "toggle" ]]; then

    # ---- theme should have been initialized (existing tmux themes instance) ---
    theme_dark_mode_toggle
    # ---- theme should have been initialized (existing tmux themes instance) ---

  else

    # ---- Initialize theme.tmux instance---
    theme_dark_mode_bind_key
    theme_env_setup


    if [[ "${theme_dark_mode_setto}" = "on" ]]; then
      theme_dark_mode_on
      tmux set -g @theme-dark-mode-setto 'on'
    elif [[ "${theme_dark_mode_setto}" = "off" ]]; then
      theme_dark_mode_off
      tmux set -g @theme-dark-mode-setto 'off'
    else
      if [[ "${theme_dark_mode}" = "on" ]]; then
        theme_dark_mode_on
        tmux set -g @theme-dark-mode-setto 'on'
      else
        theme_dark_mode_off
        tmux set -g @theme-dark-mode-setto 'off'
      fi
    fi
    # ---- Initialize theme.tmux instance---
  fi
}

main "$1"

