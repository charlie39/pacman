#!/usr/bin/bash
#
#   strip.sh - Confirm presence of strip binary
#
#   Copyright (c) 2011-2019 Pacman Development Team <pacman-dev@archlinux.org>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

[[ -n "$LIBMAKEPKG_EXECUTABLE_STRIP_SH" ]] && return
LIBMAKEPKG_EXECUTABLE_STRIP_SH=1

LIBRARY=${LIBRARY:-'/home/charlie/repos/pacman-5.2.1/pacman-5.2.1/pacman-5.2.1/_inst/share/makepkg'}

source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/option.sh"

executable_functions+=('executable_strip')

executable_strip() {
	if check_option "strip" "y"; then
		if ! type -p strip >/dev/null; then
			error "$(gettext "Cannot find the %s binary required for object file stripping.")" "strip"
			return 1
		fi
	fi
}
