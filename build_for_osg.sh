#! /bin/bash

brew install automake
make

OSG_ROOT=../osg-wasm
OSG_3RDPARTY=${OSG_ROOT}/3rdParty/WebAssembly

mkdir -p ${OSG_3RDPARTY}/lib
cp gdal/libgdal.a ${OSG_3RDPARTY}/lib
cp proj4/src/.libs/libproj.a ${OSG_3RDPARTY}/lib

mkdir -p ${OSG_3RDPARTY}/share/gdal
cp gdal/data/pcs.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/gcs.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/gcs.override.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/prime_meridian.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/unit_of_measure.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/ellipsoid.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/coordinate_axis.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/vertcs.override.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/vertcs.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/compdcs.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/geoccs.csv ${OSG_3RDPARTY}/share/gdal
cp gdal/data/stateplane.csv ${OSG_3RDPARTY}/share/gdal

cd gdal
make install DESTDIR=$PWD/install-root

mkdir -p ${OSG_3RDPARTY}/include/gdal
cp -pR install-root/usr/local/include/ ${OSG_3RDPARTY}/include/gdal
