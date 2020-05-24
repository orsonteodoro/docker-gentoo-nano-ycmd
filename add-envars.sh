#!/bin/sh
# Copyright (c) 2020 Orson Teodoro
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

mkdir -p /etc/portage/env
cat <<EOF >> /etc/portage/env/j1.conf
MAKEOPTS="-j1"
EOF

cat <<EOF >> /etc/portage/env/j2.conf
MAKEOPTS="-j2"
EOF

cat <<EOF >> /etc/portage/env/j3.conf
MAKEOPTS="-j3"
EOF

cat <<EOF >> /etc/portage/env/j4.conf
MAKEOPTS="-j4"
EOF

cat <<EOF >> /etc/portage/env/j5.conf
MAKEOPTS="-j5"
EOF

cat <<EOF >> /etc/portage/env/j6.conf
MAKEOPTS="-j6"
EOF

cat <<EOF >> /etc/portage/env/j7.conf
MAKEOPTS="-j7"
EOF

cat <<EOF >> /etc/portage/env/j8.conf
MAKEOPTS="-j8"
EOF

cat <<EOF >> /etc/portage/env/no-network-sandbox.conf
FEATURES="-network-sandbox"
EOF

cat <<EOF >> /etc/portage/package.env

dev-util/ycmd no-network-sandbox.conf

###############################################################

# Customize to the number of cores on host machine.
# This tries be more multitasking friendly with host system.

# .5 * NCORES
dev-lang/mono j2.conf
dev-util/ycmd j2.conf
net-libs/nodejs j2.conf

# 1 core only
dev-lang/rust j1.conf
media-libs/mesa j1.conf
sys-devel/clang j1.conf
sys-devel/llvm j1.conf
EOF

