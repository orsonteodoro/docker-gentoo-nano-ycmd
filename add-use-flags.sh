#!/bin/sh
# gentoo-nano-ycmd - nano-ycmd on Gentoo Docker image
# Copyright (C) 2018  Orson Teodoro <orsonteodoro@hotmail.com>
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

mkdir -p /etc/portage/package.use

cat <<EOF > /etc/portage/package.use/openssh
dev-libs/openssl bindist
EOF

cat <<EOF > /etc/portage/package.use/nano-ycmd
app-editors/nano-ycmd openssl -debug ycmd_python2_7
EOF

cat <<EOF > /etc/portage/package.use/ycm-generator
dev-util/ycm-generator python_targets_python2_7 -python_targets_python3_5 -python_targets_python3_5
EOF

cat <<EOF > /etc/portage/package.use/ycmd
dev-util/ycmd net45 system-clang c c++ objc objc++ -rust python_targets_python3_5 -python_targets_python3_4  python_targets_python2_7 -csharp -debug go -javascript -net46 -netcore10 -omnisharp-roslyn -omnisharp-server python -system-boost -tests
dev-libs/boost python
dev-lang/rust ycmd
media-libs/libjpeg-turbo jpeg8
x11-libs/cairo X
EOF
