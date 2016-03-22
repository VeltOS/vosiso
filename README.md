vosiso
==========

The VeltOS Live ISO config and build script, based on the ArchISO releng profile.

Building
--------

This repository contains everything needed to build the ISO except for some dependent packages, which are located in the vosrepo.velt.io/x86_64 repository. Since VeltOS can only be built as x64_64, our repository only has the x64_86 versions of packages.

To build the ISO,

1) Add vosrepo.velt.io/x86_64 to your pacman repositories, and you'll also need to locally sign our GPG key (E3BB5484, owned by Aidan Shafran <zelbrium@gmail.com>) using pacman-key.

2) Make sure that root owns all of the airootfs directory.

3) cd to the veltos-iso folder and make a directory named "out". Then, run "sudo ./build.sh". The final ISO will be located in ./out/
