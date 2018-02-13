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

xhost +local:

USER_UID=$(id -u)
AUDIO_GID=$(cat /etc/group | grep audio | cut -d: -f3)
ALSA_CARD="hw:0,0"

USE_CONTAINER_PULSEAUDIO=

docker run -i -e DISPLAY="$DISPLAY" \
	      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	      -v /run/user/$USER_UID/pulse:/run/user/$USER_UID/pulse  \
	      -e USE_CONTAINER_PULSEAUDIO="$USE_CONTAINER_PULSEAUDIO" \
	      -e AUDIO_GID=$AUDIO_GID \
	      -e ALSA_CARD="$ALSA_CARD" \
	      --device /dev/snd \
	      -t docker-gentoo-nano-ycmd bash
