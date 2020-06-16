#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  local theme_file="${CURRENT_DIR}/src/main.theme"
  local status_right_length="$(hostname | wc -c)"
  local status_right_length="$((100 + ${status_right_length}))"
  local whoami="$(whoami)"
  tmux set -g @whoami "${whoami}"

  local os_ver="$(lsb_release -irs | cut -d'.' -f-2)"
  tmux set -g @os_ver "${os_ver}"

  #--- This way will cause ---> value is invalid: #{@status-right-length} ---
  #tmux set -g @status-right-length "${status_right_length}"   

  tmux set -g status-right-length "${status_right_length}"
  tmux source-file ${theme_file}
}
main

