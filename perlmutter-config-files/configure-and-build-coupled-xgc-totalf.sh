SOURCE_DIR=$1
BUILD_DIR=$2
MYDEPS=$BUILD_DIR

CURDIR=$PWD
cd $SOURCE_DIR

cmake -S $SOURCE_DIR/XGC-Devel -B $BUILD_DIR/xgc-total-f \
 -DDELTAF_CONV=OFF \
 -DXGC1=ON \
 -DCMAKE_BUILD_TYPE=Release \
 -DXGC_USE_WDMCPL_N0=ON \
 -Dwdmcpl_DIR=$MYDEPS/pcms/install/lib64/cmake/wdmcpl

cmake --build $BUILD_DIR/xgc-total-f -j8 --target xgc-es-cpp
cmake --build $BUILD_DIR/xgc-total-f -j8 --target xgc-es-cpp-gpu
cd $CURDIR
