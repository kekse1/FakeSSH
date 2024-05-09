#!/usr/bin/env bash

#
real="$(realpath "$0")"
dir="$(dirname "${real}")"
root="$(realpath "${dir}/../")"

#
cd "$root"

_npm="$(which npm 2>/dev/null)"

if [[ -z "$_npm" ]]; then
	echo " >> The \`npm\` couldn't be found!" >&2
	exit 1
fi

eval "'${_npm}' install ssh2"
res=$?

echo -en "\n\n\n ... ($res) \e[1m"
[[ $res -eq 0 ]] && echo -n ":-)" || echo -n ":-("
echo -e "\e[0m"

