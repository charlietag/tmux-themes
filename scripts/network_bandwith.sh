#!/bin/bash

THEME_NETWORK_BANDWITH=$(tmux show-option -gqv "@theme-network-bandwith")
[[ "${THEME_NETWORK_BANDWITH}" = "off" ]] && exit

get_bandwidth_for_linux() {
  netstat -ie | awk '
    match($0, /RX([[:space:]]packets[[:space:]][[:digit:]]+)?[[:space:]]+bytes[:[:space:]]([[:digit:]]+)/, rx) { rx_sum+=rx[2]; }
    match($0, /TX([[:space:]]packets[[:space:]][[:digit:]]+)?[[:space:]]+bytes[:[:space:]]([[:digit:]]+)/, tx) { tx_sum+=tx[2]; }
    END { print rx_sum, tx_sum }
  '
}

format_speed() {
  #numfmt --to=iec-i --suffix "B/s" --format "%f" $1
  #numfmt --to=iec --suffix "B/s" --padding=7 $1
  numfmt --to=iec --suffix "B/s" --padding=8 $1
}

# Ref. https://github.com/xamut/tmux-network-bandwidth/blob/master/scripts/network-bandwidth.sh
main() {
  local theme_dark_mode="$(tmux show-option -gqv "@theme-dark-mode-setto")"
  if [[ "${theme_dark_mode}" != "on" ]] ; then
    theme_dark_mode="off"
  fi

  if [[ "${theme_dark_mode}" = "off" ]]; then
    #local network_bandwith_scheme="#[fg=colour233,bg=colour112,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour118,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour100,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour136,bold]"
    local network_bandwith_scheme="#[fg=colour233,bg=colour144,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour172,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour178,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour184,bold]"
    #local network_bandwith_scheme="#[fg=colour233,bg=colour214,bold]"
  else
    local network_bandwith_scheme="#[fg=colour144,bg=black,bold]"
  fi

  local sleep_time=$(tmux show-option -gqv "status-interval")
  #local old_value=$(tmux show-option -gqv "@network-bandwidth-previous-value")

  #if [ -z "$old_value" ]; then
  #  tmux set -g  "@network-bandwidth-previous-value" "-"
  #  echo -n "Please wait..."
  #  return 0
  #else
    
    local first_measure=( $(get_bandwidth_for_linux) )
    sleep $sleep_time
    local second_measure=( $(get_bandwidth_for_linux) )
    local download_speed=$(((${second_measure[0]} - ${first_measure[0]}) / $sleep_time))
    local upload_speed=$(((${second_measure[1]} - ${first_measure[1]}) / $sleep_time))
    local this_result="${network_bandwith_scheme} ↓$(format_speed ${download_speed}) ↑$(format_speed ${upload_speed}) "
    #local this_result="${network_bandwith_scheme} D:$(format_speed ${download_speed}) U:$(format_speed ${upload_speed}) "

    # tmux set will cause mouse-selection goes to unselected mode...!
    #tmux set -g  "@network-bandwidth-previous-value" "${this_result}"
  #fi

  echo -n "${this_result}"
}

main

# -----------------------------------------------------------------------------------------------------------
# My function , not precise if loading is high, use above
#main() {
#  local sleep_time=$(tmux show-option -gqv "status-interval")
#  local last_measure=( $(tmux show-option -gqv "@network-bandwidth-last-measure") )
#  
#  local this_measure=( $(get_bandwidth_for_linux) )
#  tmux set -g @network-bandwidth-last-measure "$(echo ${this_measure[@]})"
#
#
#  if [[ -n "${last_measure}" ]]; then
#    local download_speed=$(((${this_measure[0]} - ${last_measure[0]}) / $sleep_time))
#    local upload_speed=$(((${this_measure[1]} - ${last_measure[1]}) / $sleep_time))
#    local this_result="↓$(format_speed $download_speed) • ↑$(format_speed $upload_speed)"
#    echo "${this_result}"
#  else
#    echo "Fetching data..."
#  fi
#
#  #this_measure="$(echo ${this_measure[@]})"
#  #tmux set -g @network-bandwidth-last-measure "${this_measure}"
#  #echo "${this_measure}"
#  #echo "${last_measure[0]} , ${last_measure[1]}"
#
#}
#
#main
# -----------------------------------------------------------------------------------------------------------
