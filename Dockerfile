#!/bin/sh
# Copyright (c) 2018-2020 Orson Teodoro
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

# Pick whatever is closest to native
# See https://github.com/gentoo/gentoo-docker-images/
FROM gentoo/portage:latest as portage
FROM gentoo/stage3:latest
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

MAINTAINER Orson Teodoro <orsonteodoro@hotmail.com>

ADD make.conf /etc/portage/make.conf

RUN emerge dev-vcs/git

ADD add-mask.sh /usr/bin/add-mask.sh
RUN chmod +x /usr/bin/add-mask.sh
RUN /usr/bin/add-mask.sh

ADD add-use-flags.sh /usr/bin/add-use-flags.sh
RUN chmod +x /usr/bin/add-use-flags.sh
RUN /usr/bin/add-use-flags.sh

#RUN mkdir -p /etc/portage/repos.conf
RUN emerge app-eselect/eselect-repository

RUN eselect repository add "oiledmachine-overlay" "git" "https://github.com/orsonteodoro/oiledmachine-overlay.git"
RUN emaint sync -r oiledmachine-overlay

ADD add-accept_keywords.sh /usr/local/bin/add-accept_keywords.sh
RUN chmod +x /usr/local/bin/add-accept_keywords.sh
RUN /usr/local/bin/add-accept_keywords.sh

ADD add-use-dotnet.sh /usr/local/bin/add-use-dotnet.sh
RUN chmod +x /usr/local/bin/add-use-dotnet.sh
RUN /usr/local/bin/add-use-dotnet.sh

ADD add-global-use-flags.sh /usr/local/bin/add-global-use-flags.sh
RUN chmod +x /usr/local/bin/add-global-use-flags.sh
RUN /usr/local/bin/add-global-use-flags.sh

ADD add-global-mask.sh /usr/local/bin/add-global-mask.sh
RUN chmod +x /usr/local/bin/add-global-mask.sh
RUN /usr/local/bin/add-global-mask.sh

ADD add-unmask.sh /usr/local/bin/add-unmask.sh
RUN chmod +x /usr/local/bin/add-unmask.sh
RUN /usr/local/bin/add-unmask.sh

ADD add-licenses.sh /usr/local/bin/add-licenses.sh
RUN chmod +x /usr/local/bin/add-licenses.sh
RUN /usr/local/bin/add-licenses.sh

ADD add-envars.sh /usr/local/bin/add-envars.sh
RUN chmod +x /usr/local/bin/add-envars.sh
RUN /usr/local/bin/add-envars.sh

ADD edit-make_conf.sh /usr/local/bin/edit-make_conf.sh
RUN chmod +x /usr/local/bin/edit-make_conf.sh
RUN /usr/local/bin/edit-make_conf.sh

RUN emerge nano-ycmd --autounmask --autounmask-write || true
RUN yes | etc-update --automode -3
RUN emerge nano-ycmd || true

ADD start-nano-ycmd.sh /usr/local/bin/start-nano-ycmd.sh
RUN chmod +x /usr/local/bin/start-nano-ycmd.sh
ENTRYPOINT "/usr/local/bin/start-nano-ycmd.sh"

# To go to console shell for debugging, you should edit start-nano-ycmd.sh instead.
