#!/bin/bash

THEME_PERF_LOADING=$(tmux show-option -gqv "@theme-loading-cpu-mem")
[[ "${THEME_PERF_LOADING}" = "off" ]] && exit

#[fg=colour233,bg=colour117,bold] CPU:#(top -bn1 |grep Cpu | awk '{print $2}')% #[fg=colour233,bg=colour177,bold] Mem:#(free | grep -E 'Mem:' | awk '{print 100-$4/$2*100}' | xargs -i printf '%.2f\n' {})% #[fg=colour233,bg=colour136,bold] Swap:#(free | grep -E 'Swap:' | awk '{print $3/$2*100}' | xargs -i printf '%.2f\n' {})%
format_cpu() {
  local load_cpu="$(numfmt --padding=5 ${1})"
  local theme_dark_mode="$2"

  if [[ "${theme_dark_mode}" = "off" ]]; then
    #echo -n "#[fg=colour233,bg=colour10,bold] CPU:${load_cpu}% "
    #echo -n "#[fg=colour233,bg=colour40,bold] CPU:${load_cpu}% "
    #echo -n "#[fg=colour233,bg=colour76,bold] CPU:${load_cpu}% "
    echo -n "#[fg=colour233,bg=colour106,bold] CPU:${load_cpu}% "
  else
    echo -n "#[fg=colour106,bg=black,bold] CPU:${load_cpu}% "
  fi

}

format_mem() {
  local load_mem="$(printf '%.2f' ${1})"
  local theme_dark_mode="$2"

  if [[ "${theme_dark_mode}" = "off" ]]; then
    echo -n "#[fg=colour233,bg=colour142,bold] Mem:${load_mem}% "
    #echo -n "#[fg=colour233,bg=colour214,bold] Mem:${load_mem}% "
  else
    echo -n "#[fg=colour142,bg=black,bold] Mem:${load_mem}% "
  fi
}

format_swap() {
  local load_swap="$(printf '%.2f' ${1})"
  local theme_dark_mode="$2"

  if [[ "${theme_dark_mode}" = "off" ]]; then
    echo -n "#[fg=colour233,bg=colour136,bold] Swap:${load_swap}% "
  else
    echo -n "#[fg=colour136,bg=black,bold] Swap:${load_swap}% "
  fi
}

main() {
  local theme_dark_mode="$(tmux show-option -gqv "@theme-dark-mode")"
  if [[ "${theme_dark_mode}" != "on" ]] ; then
    theme_dark_mode="off"
  fi

  local load_info="$(top -bn1)"

  #local load_cpu="$(echo -e "${load_info}" |grep Cpu | grep -Eo '[[:digit:].,]*'| sed -e ':a;N;$!ba;s/\n//g' | awk -F',' '{print $1"% Sys:"$2"% Total:"100-$4"% IO:"$5 }')"
  local load_cpu="$(echo -e "${load_info}" |grep Cpu | grep -Eo '[[:digit:].,]*'| sed -e ':a;N;$!ba;s/\n//g' | awk -F',' '{print 100-$4 }')"

  local load_ram="$(echo -e "${load_info}" | grep  'Mem' | grep -Eo '[[:digit:].,]*' | sed ':a;N;$!ba;s/\n/ /g' | awk '{print 100-$3/$1*100","$12/$8*100}')"
  local load_mem="$(echo -e "${load_ram}" | cut -d',' -f1)"
  local load_swap="$(echo -e "${load_ram}" | cut -d',' -f2)"

  format_cpu "${load_cpu}" "${theme_dark_mode}"
  format_mem "${load_mem}" "${theme_dark_mode}"
  format_swap "${load_swap}" "${theme_dark_mode}"
}

main
