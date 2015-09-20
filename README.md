# veltos-iso
The VeltOS Live ISO config and build script, based on the ArchISO releng profile.

# Creating the local package repository
This repository contains everything needed to build the ISO except for some dependent packages, which are located in a local package repository. Since the Arch ISO can only be built as x64_64, this local package repo only needs the x64_86 versions of packages. To build the ISO, create a local package repository named "veltrepo" and set the Server path of "veltrepo" in pacman.conf to point to your repo.

Currently, the package repository contains the following packages, unmodified from the Arch AUR:
package-query    (1.6.2-1-x86_64)
yaourt           (1.6.1-any)
budgie-desktop   (8.8-2-x86_64)

In the future, the repository will contain custom or modified packages. The source for these will be in other git repositories under this GitHub account, and you must download the releases and add them to the package repository.

The current version of the package repository (with all the compiled packages) will be included with each release of veltos-iso.

# Building
1) Properly configure the package repository and the pacman.conf as described above.
2) Make sure that root owns all of the airootfs directory.
3) cd to the veltos-iso folder and run "sudo ./build.sh". The final ISO will be located in ./out/
