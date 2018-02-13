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

FROM gentoo/portage:latest as portage
FROM gentoo/stage3-amd64-nomultilib:latest

COPY --from=portage /usr/portage /usr/portage

MAINTAINER Orson Teodoro <orsonteodoro@hotmail.com>

RUN emerge dev-vcs/git


ADD add-mask.sh /usr/bin/add-mask.sh
RUN chmod +x /usr/bin/add-mask.sh
RUN /usr/bin/add-mask.sh

RUN emerge layman

ADD add-use-flags.sh /usr/bin/add-use-flags.sh
RUN chmod +x /usr/bin/add-use-flags.sh
RUN /usr/bin/add-use-flags.sh

RUN mkdir -p /etc/portage/repos.conf

RUN layman -S
RUN yes | layman -a jm-overlay
RUN yes | layman -a dotnet

#some caching bug with docker
WORKDIR /var/lib/layman/
RUN echo "$RANDOM" && git clone https://github.com/orsonteodoro/oiledmachine-overlay.git /var/lib/layman/oiledmachine-overlay

WORKDIR /var/lib/layman/
RUN ln -s /oiledmachine-overlay oiledmachine-overlay

ADD add-oiledmachine-overlay.sh /usr/bin/add-oiledmachine-overlay.sh
RUN chmod +x /usr/bin/add-oiledmachine-overlay.sh
RUN /usr/bin/add-oiledmachine-overlay.sh

ADD add-keywords.sh /usr/bin/add-keywords.sh
RUN chmod +x /usr/bin/add-keywords.sh
RUN /usr/bin/add-keywords.sh

ADD add-use-dotnet.sh /usr/bin/add-use-dotnet.sh
RUN chmod +x /usr/bin/add-use-dotnet.sh
RUN /usr/bin/add-use-dotnet.sh

ADD add-global-use-flags.sh /usr/bin/add-global-use-flags.sh
RUN chmod +x /usr/bin/add-global-use-flags.sh
RUN /usr/bin/add-global-use-flags.sh

RUN cat /etc/portage/make.conf

RUN touch /etc/portage/categories
RUN echo "dev-rust" >> /etc/portage/categories

RUN emerge nano-ycmd --autounmask --autounmask-write || true
RUN yes | etc-update --automode -3
RUN emerge nano-ycmd || true

ADD start-nano-ycmd.sh /usr/bin/start-nano-ycmd.sh
RUN chmod +x /usr/bin/start-nano-ycmd.sh
ENTRYPOINT "/usr/bin/start-nano-ycmd.sh"


