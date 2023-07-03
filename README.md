# docker-gentoo-nano-ycmd

This is a container contains nano-ycmd.

The image used is based on Gentoo's stage3, but it can work on major operating
systems and distros.

This requires the Docker package to use.

1. Install docker
2. `git clone https://github.com/orsonteodoro/docker-gentoo-nano-ycmd.git`
3. `cd docker-gentoo-nano-ycmd`
4. `chmod +x compile.sh run.sh`
5. `./compile.sh`
7. `./run.sh`

##### 

### Configuring

Before compiling, you can change add-use-flags.sh to support completion for a
language you want.

Also change add-envars.sh and edit-make_conf.sh to adjust the number of CPU
cores.

### FAQ

How do I let the container see the host filesystem?

This will be disclosed later but it you need to modify run.sh to mount a folder
or device.

### Bugs

N/A

### Test history

* Jul 3, 2023, docker-gentoo-nano-ycmd (6fe7290), ycmd 47 (3392251), nano-ycmd (1d09284),  interactive test, PASSED

### License

The some of the files in this repository licensed under either MIT or GPL2.

Trademarks and copyrights referenced belong to their respective owners.

Software pulled by this container are not in the scope of this license.

