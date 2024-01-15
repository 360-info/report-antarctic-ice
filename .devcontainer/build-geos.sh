#!/usr/bin/env bash
# download, build + install geos 3.11 (we need its concave hull support!)
wget https://download.osgeo.org/geos/geos-3.11.3.tar.bz2
tar xvfj geos-3.11.3.tar.bz2
cd geos-3.11.3
mkdir _build
cd _build
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  ..
ctest
make install

# _then_ install {sf} and {terra}
Rscript -e 'install.packages(c("sf", "terra"))'
