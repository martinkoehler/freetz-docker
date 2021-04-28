To run the docker image issue
`make`
This might take some time for the first run and results in a shell in the container, that behaves like the freetz(-ng) vm-ware image

From within the running container clone the repo you want to use, e.g.
`git clone https://github.com/Freetz/freetz.git git/freetz`
or
`git clone https://github.com/Freetz-NG/freetz-ng.git git/freetz-ng`
then proceed as described in the freetz(-ng) documentation

The images are directly accessible from the host under `vol/git` (e.g. vol/git/freetz-ng/images`

