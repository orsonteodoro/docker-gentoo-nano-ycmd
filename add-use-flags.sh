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
app-editors/nano-ycmd openssl -debug
# Uncomment if you want less dependencies without pulling llvm, but may affect if it returns GUI documentation or function completion details
dev-java/icedtea-bin -gtk headless-awt
# required by icedtea-bin[gtk], mutually exclusive with the above line
#x11-libs/cairo X
EOF

cat <<EOF > /etc/portage/package.use/ycm-generator
dev-util/ycm-generator
EOF

# You can enable or disable USE flags to support completion for certain languages.  The tradeoff is the compile time cost.
cat <<EOF > /etc/portage/package.use/ycmd
dev-util/ycmd -c -clangd -csharp -cuda -cxx -go -java -javascript libclang -net472 -objc -objc++ python regex -rust -typescript
dev-libs/boost python
EOF
