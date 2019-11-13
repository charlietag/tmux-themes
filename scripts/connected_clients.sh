#!/bin/bash

main() {
  local connected_clients="$(tmux list-clients -F '#{line}' | wc -l)"
  if [[ $connected_clients -ne 1 ]]; then
    echo -n " Clients ▶▶▶ ${connected_clients} "
  fi
}
main
