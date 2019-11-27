#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  local theme_file="${CURRENT_DIR}/src/main.theme"
  local whoami="$(whoami)"
  local status_right_length="$(hostname | wc -c)"
  local status_right_length="$((40+${status_right_length}))"
  tmux set -g @whoami "${whoami}"
  tmux set -g @status_right_length "${status_right_length}"
  tmux source-file ${theme_file}
}
main

