# Chapel GRPlot
Chapel wrapper for the [GR Framework](https://gr-framework.org). 
GR provides fast visualisation/plotting tools for 2D/3d visualisation. It is based on an implementation of a Graphical Kernel System (GKS) and OpenGL

# Example
To compile example:
1. Download and extract pre built binaries from [here](https://gr-framework.org/c.html#installation) into folder ```third-party```
2. ```export GRDIR=$GRPlot_dir_root$/third-party/gr```
3. compile myPackageExample in example using ```chpl myPackageExample.chpl -I${GRDIR}/include -L${GRDIR}/lib --ldflags "-rpath ${GRDIR}/lib" -lGR ```
