# docker-gentoo-nano-ycmd

This is a container contains
[nano-ycmd](https://github.com/orsonteodoro/nano-ycmd).

The image used is based on Gentoo's stage3, but it can work on major operating
systems and distros.

### Building the Docker image and running it

1. Install docker
2. `git clone https://github.com/orsonteodoro/docker-gentoo-nano-ycmd.git`
3. `cd docker-gentoo-nano-ycmd`
4. `chmod +x compile.sh run.sh`
5. `./compile.sh`
6. `./run.sh`

* Windows users can use Cygwin for bash support or manually run the commands.
* The following USE flags and packages are needed:
```
emerge -1vuDN \
app-containers/containerd[seccomp] \
app-containers/docker[seccomp] \
app-containers/docker-buildx \
app-containers/docker-cli \
app-containers/runc[seccomp]
```
* Custom kernel users need the following kernel settings:
https://wiki.gentoo.org/wiki/Docker#Kernel
* The user needs to be added the docker group.
* The daemon service needs to be started.

##### 

### Configuring

Before compiling, you can change add-use-flags.sh to support completion for a
language you want.

Also change add-envars.sh and edit-make_conf.sh to adjust the number of CPU
cores.

### FAQ

#### How do I update the container?

Re-run `compile.sh`.

#### How do I access files on the host OS?

Modify `./run.sh` and add -v path1:path2, where path1 is the host path, and
path2 is the container path.

Example:

```
docker run \
	-v /home/johndoe:/home/johndoe \
	-v /mnt/usb:/mnt/usb \
	...
```

Use `Ctrl+r` then `Ctrl+t` to point to the path of the file inside nano-ycmd.

or

Pass the path as args to `run.sh`.

Example:

```
YNANO_CHDIR="/home/johndoe" ./run.sh hello.py world.py
```

#### When I build it, it gets stuck with the message "[output clipped, log limit 2MiB reached]".  How do I fix it?

```
docker ps -a --no-trunc
docker rm <CONTAINER ID>
```

Remove all `CONTAINER ID`s with `IMAGE=docker-gentoo-nano-ycmd`.

### Bugs

N/A

### Test history

* Jul 3, 2023, docker-gentoo-nano-ycmd (03c8e6f), ycmd 47 (3392251), nano-ycmd (a4e39ed),  interactive test, PASSED

### License

The some of the files in this repository licensed under either MIT or GPL2.

Trademarks and copyrights referenced belong to their respective owners.

Software pulled by this container are not in the scope of this license.

