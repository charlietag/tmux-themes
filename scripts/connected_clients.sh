#!/bin/bash
# Logged On (pty , tty) who - show who is logged on (tty/pts) (terminal / ssh)
logged_on_session() {
  local logged_on_session="$(who | wc -l)"
  local logged_on_msg="(LoggedOn: ${logged_on_session})"

  [[ "${logged_on_session}" -ne 1 ]] && echo -n " ${logged_on_msg} "
}


connected_clients() {
  local connected_clients="$(tmux list-clients -F '#{line}' | wc -l)"

  [[ $connected_clients -ne 1 ]] && echo -n " Clients ▶▶▶ ${connected_clients} "
}

main() {
  logged_on_session
  connected_clients
}
main
