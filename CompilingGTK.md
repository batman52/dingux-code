Here is explained how to compile GTK binaries for dingux.
Thanks to vimrc, whithout whom this wouldn't be possible.

# Details #

In order to build all, just run as root ./script/build-all.

Root access is needed only if you are not allowed to write
in your /opt folder.

In the script folder are also provided scripts to compile
every single library needed, each named build-LIBRARY,
where LIBRARY is the library name.

It is assumed that the toolchain path is /opt/mipsel-linux-uclibc,
otherwise you will need to change the prefix path into the script.

To run GTK applications on dingoo, you need to use a rootfs with the
GTK libraries, that is available in the download section.