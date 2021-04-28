The code in this repo helps building firmware images for the Fritz Boxes using "freetz" or clones therefrom (e.g. freetz-ng).
It behaves like the "official" vmware images (e.g.  e.g. https://www.ip-phone-forum.de/threads/test-neue-buildumgebung.194433/) and is more transparent 
(See https://github.com/martinkoehler/freetz-docker/blob/main/docker/dockerfile_master for the packages and command used to build the image)
The firmware images are directly accessible from the host system - see below and the data is persistently stored in docker volumes.

Prerequisites: You need Docker (https://www.docker.com/) and `make`
For windows the easiest way probably is to use the Windows Linux Subsystem (version 2) and Docker fro windows.

To run the docker image clone this repositorium and issue 
`make`
This might take some time for the first run and results in a shell in the container, that behaves like the freetz(-ng) vm-ware image

From within the running container clone the repo you want to use, e.g.
`git clone https://github.com/Freetz/freetz.git git/freetz`
or
`git clone https://github.com/Freetz-NG/freetz-ng.git git/freetz-ng`
then proceed as described in the freetz(-ng) documentation. 
Note that these files are persistent, so for new versions a `git pull` should be sufficient for an update.

The images are directly accessible from the host under `vol/git` (e.g. vol/git/freetz-ng/images`

