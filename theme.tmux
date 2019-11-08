#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  local theme_file="${CURRENT_DIR}/src/main.theme"
  local whoami="$(whoami)"
  tmux set -g @whoami "${whoami}"
  tmux source-file ${theme_file}
}
main

