#!/bin/bash
# gentoo-nano-ycmd - nano-ycmd on Gentoo Docker image
# Copyright (C) 2018-2020  Orson Teodoro <orsonteodoro@hotmail.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

if [[ -n "${YNANO_CHDIR}" ]] ; then
	cd "${YNANO_CHDIR}" || exit 1
fi

shift

# Uncomment the line below to debug in interactive bash then run compile.sh.
# No commands following start-nano-ycmd.sh in Dockerfile should exist for this to work.
#bash -i "$@"

ynano "$@" 2>/tmp/debug.log
