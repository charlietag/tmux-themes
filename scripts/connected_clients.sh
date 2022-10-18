#!/bin/bash
# Logged On (pty , tty) who - show who is logged on (tty/pts) (terminal / ssh)
logged_on_session() {
  local logged_on_session="$(who | grep -Eiv "tmux|s\.[[:digit:]]+" | wc -l)"
  local logged_on_msg="(LoggedOn: ${logged_on_session})"

  [[ "${logged_on_session}" -gt 1 ]] && echo -n " ${logged_on_msg} "
}


connected_clients() {
  local connected_clients="$(tmux list-clients -F '#{line}' | wc -l)"

  [[ $connected_clients -gt 1 ]] && echo -n " Clients ▶▶▶ ${connected_clients} "
}

main() {
  logged_on_session
  connected_clients
}
main
