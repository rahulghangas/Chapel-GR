# Chapel GRPlot
Chapel wrapper for the [GR Framework](https://gr-framework.org). 
GR provides fast visualisation/plotting tools for 2D/3d visualisation. It is based on an implementation of a Graphical Kernel System (GKS) and OpenGL

# Example
To compile example:
1. ```export GRDIR=$GRPlot_dir_root$/third-party/gr```
2. compile myPackageExample in example using ```chpl chpl myPackageExample.chpl -I${GRDIR}/include -L${GRDIR}/lib --ldflags "-rpath ${GRDIR}/lib" -lGR ```
