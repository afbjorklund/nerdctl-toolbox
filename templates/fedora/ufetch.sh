#!/bin/sh
#
# ufetch-fedora - tiny system info for fedora

## INFO

user="${USER:-$(id -un)}"
host="$(hostname)"
os="$(cat /etc/fedora-release)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(dnf list installed | sed '1d' | wc -l)"
shell="$(basename "${SHELL:-$(getent passwd $user | cut -f 7 -d :)}")"

## UI DETECTION

parse_rcs() {
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}

rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

ui='unknown'
uitype='UI'
if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -n "${rcwm}" ]; then
	ui="${rcwm}"
	uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
	ui="${XDG_SESSION_TYPE}"
fi

ui="$(basename "${ui}")"

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold 2> /dev/null)"
	black="$(tput setaf 0 2> /dev/null)"
	red="$(tput setaf 1 2> /dev/null)"
	green="$(tput setaf 2 2> /dev/null)"
	yellow="$(tput setaf 3 2> /dev/null)"
	blue="$(tput setaf 4 2> /dev/null)"
	magenta="$(tput setaf 5 2> /dev/null)"
	cyan="$(tput setaf 6 2> /dev/null)"
	white="$(tput setaf 7 2> /dev/null)"
	reset="$(tput sgr0 2> /dev/null)"
fi

# you can change these
lc="${reset}${bold}${blue}"         # labels
nc="${reset}${bold}${blue}"         # user and hostname
ic="${reset}"                       # info
c0="${reset}${white}"               # first color
c1="${reset}${blue}"                # second color

## OUTPUT

cat <<EOF
${c0}        _____
${c0}       /   __)${c1}\\   ${nc}${user}${ic}@${nc}${host}${reset}
${c0}       |  /  ${c1}\\ \\  ${lc}OS:        ${ic}${os}${reset}
${c1}    __${c0}_|  |_${c1}_/ /  ${lc}KERNEL:    ${ic}${kernel}${reset}
${c1}   / ${c0}(_    _)${c1}_/   ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}  / /  ${c0}|  |       ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1}  \\ \\${c0}__/  |       ${lc}SHELL:     ${ic}${shell}${reset}
${c1}   \\${c0}(_____/       ${lc}${uitype}:        ${ic}${ui}${reset}

EOF
