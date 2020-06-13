#!/bin/bash
#[fg=colour233,bg=colour117,bold] CPU:#(top -bn1 |grep Cpu | awk '{print $2}')% #[fg=colour233,bg=colour177,bold] Mem:#(free | grep -E 'Mem:' | awk '{print 100-$4/$2*100}' | xargs -i printf '%.2f\n' {})% #[fg=colour233,bg=colour136,bold] Swap:#(free | grep -E 'Swap:' | awk '{print $3/$2*100}' | xargs -i printf '%.2f\n' {})%
format_cpu() {
  local load_cpu="$1"
	echo -n "#[fg=colour233,bg=colour117,bold] CPU:${load_cpu}% "

}

format_mem() {
  local load_mem="$(printf '%.2f' ${1})"
	echo -n "#[fg=colour233,bg=colour177,bold] Mem:${load_mem}% "
}

format_swap() {
  local load_swap="$(printf '%.2f' ${1})"
	echo -n "#[fg=colour233,bg=colour136,bold] Swap:${load_swap}% "
}

main() {
  local load_info="$(top -bn1| grep -E "Cpu|Mem|Swap")"

  local load_cpu="$(echo -e "${load_info}" |grep Cpu | awk '{print $2}')"

	local load_ram="$(echo -e "${load_info}" | grep -E "Cpu|Mem|Swap" | grep  'Mem' | grep -Eo '[[:digit:].,]*' | sed ':a;N;$!ba;s/\n/ /g' | awk '{print 100-$3/$1*100","$12/$8*100}')"
  local load_mem="$(echo -e "${load_ram}" | cut -d',' -f1)"
  local load_swap="$(echo -e "${load_ram}" | cut -d',' -f2)"

	format_cpu "${load_cpu}"
	format_mem "${load_mem}"
	format_swap "${load_swap}"
}

main
