#!/usr/bin/env bash

online_icon="✔"
offline_icon="❌"

online_icon_default() {
  echo "$online_icon"
}

offline_icon_default() {
  echo "$offline_icon"
}

online_status() {
	ping -c 1 -t 5 google.com >/dev/null 2>&1
}

print_icon() {
	if $(online_status); then
		printf "$(online_icon_default)"
	else
		printf "$(offline_icon_default)"
	fi
}

print_icon