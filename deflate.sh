#!/bin/sh
# Copyright (c) 2018 Orson Teodoro
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

# This is not ready yet.  Do not use on this image.
# I am migrating this from Arch Linux to Gentoo Linux.

echo "Removing cruft here and security hazards"

sudo emerge -C git

echo "Removing mount and other utils"
sudo rm $(equery f util-linux) 2&>1 > /dev/null || true

echo "Removing shadow"
sudo rm $(equery f shadow) 2&>1 > /dev/null || true

echo "Removing coreutils and other utilities"
sudo rm $(equery f coreutils | grep -v "rm" | grep -v "echo" | grep -v "find" | grep -v "xargs" | grep -v "ls") 2&>1 /dev/null || true

echo "Removing portage"
sudo rm $(equery f pacman) 2&>1 > /dev/null || true

echo "Remove everything in the /usr/bin folder except spotify"
find /usr/bin ! -name "rm" ! -name "find" ! -name "xargs" ! -name "ynano" ! -name "echo" ! -name "sudo" ! \
	-name "sh" ! -name "stat" ! -name "bash" ! -name "pactl" ! -name "start-nano-ycmd.sh" ! -name "aplay" ! -name "grep" ! -name "deflate.sh" ! -name "dbus-daemon" ! -name "dbus-uuidgen" ! -name "groupmod" \
	! -name "mkdir" ! -name "pulseaudio"  \
	-print0 | xargs -0 rm 2&>1 > /dev/null

echo "Removing find, xargs"
rm /usr/bin/find
rm /usr/bin/xargs

echo "Removing programming languages headers"
rm -rf /usr/lib/gcc/*/*/include
rm -rf /usr/include

echo "Removing rm"
sudo echo "" > /bin/rm
