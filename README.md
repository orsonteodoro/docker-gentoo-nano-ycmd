# docker-gentoo-nano-ycmd

[![Build Status](https://travis-ci.org/orsonteodoro/docker-gentoo-nano-ycmd.svg?branch=master)](https://travis-ci.org/orsonteodoro/docker-gentoo-nano-ycmd)

This is a container containing nano-ycmd.  It was tested on a host with Alpine Linux.

The image used is based on stage3-amd64-nomultilib but you can use other gentoo images based on your host.

This requires the Docker package to use.

1. `git clone https://github.com/orsonteodoro/docker-gentoo-nano-ycmd.git`
2. `cd docker-gentoo-nano-ycmd`
3. `chmod +x compile.sh`
4. `./compile.sh`
5. `chmod +x run.sh`
6. `./run.sh`

##### 

### Configuring

Before compiling, you can change add-use-flags.sh to support completion for a language you want.

Also change add-envars.sh and edit-make_conf.sh to adjust the number of CPU cores.

### FAQ

How do I let the container see the host filesystem?

This will be disclosed later but it you need to modify run.sh to mount a folder or device.

### Bugs

N/A

### License

The some of the files in this repository licensed under either MIT or GPL2.

Trademarks and copyrights referenced belong to their respective owners.

Software pulled by this container are not in the scope of this license.

