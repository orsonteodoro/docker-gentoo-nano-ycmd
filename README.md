# docker-arch-spotify-PaXmarked

[![Build Status](https://travis-ci.org/orsonteodoro/docker-arch-spotify-PaXmarked.svg?branch=master)](https://travis-ci.org/orsonteodoro/docker-arch-spotify-PaXmarked)

This is a container containing Spotify.  It works with ALSA but can be configured or altered for PulseAudio.

It should work with hardened kernels with grsecurity.

Since it uses ALSA, you may only be able to use it in the container once your host releases the sound card.

It was tested on a host with Alpine Linux.

This requires the Docker package to use.

1. `git clone https://github.com/orsonteodoro/docker-arch-spotify.git`
2. `cd docker-arch-spotify`
3. `chmod +x compile.sh`
4. `./compile.sh`
5. `chmod +x run.sh`
6. `./run.sh`
7.  If you use Facebook, you can use your Facebook user name and password to logon.

### Bugs

It causes a black screen from time-to-time.

### License

The files in this repository alone are licensed under MIT.

Trademarks and copyrights referenced belong to their respective owners.

Software pulled by this container are not in the scope of this license.
# gentoo-nano-ycmd
