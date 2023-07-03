#!/bin/sh
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

mkdir -p /etc/portage/package.accept_keywords
cat <<EOF >> /etc/portage/package.accept_keywords/ycmd
=dev-util/ycmd-47*::oiledmachine-overlay ~*
EOF

cat <<EOF >> /etc/portage/package.accept_keywords/nano-ycmd
=app-editors/nano-ycmd-9999::oiledmachine-overlay ~*
dev-libs/nxjson::oiledmachine-overlay ~*
dev-util/bear::oiledmachine-overlay ~*
dev-util/ycm-generator::oiledmachine-overlay ~*
dev-util/compdb::oiledmachine-overlay ~*
EOF
