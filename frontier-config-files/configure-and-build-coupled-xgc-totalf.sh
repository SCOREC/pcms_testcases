SOURCE_DIR=$1
BUILD_DIR=$2
MYDEPS=$BUILD_DIR

CURDIR=$PWD
cd $SOURCE_DIR

cmake -S $SOURCE_DIR/XGC-Devel -B $BUILD_DIR/xgc-total-f \
 -DDELTAF_CONV=OFF \
 -DXGC1=ON \
 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
 -DXGC_USE_WDMCPL_N0=ON \
 -Dwdmcpl_DIR=$MYDEPS/pcms/install/lib64/cmake/wdmcpl \
 -DCMAKE_CXX_COMPILER=CC \
 -DCMAKE_C_COMPILER=cc \
 -DCMAKE_Fortran_COMPILER=ftn\
 -DUSE_GPU_AWARE_MPI=ON \
 -DADIOS2_DIR=$BUILD_DIR/adios2/install/lib64/cmake/adios2 \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DCabana_DIR=$BUILD_DIR/cabana/install/lib64/cmake/Cabana/ \
 -DPETSC_DIR=$BUILD_DIR/petsc/install \
 -DPETSC_DIR=$BUILD_DIR/petsc \
 -DPETSC_ARCH=arch-linux-c-opt \
 -DCMAKE_PETSC_DEBUG=ON

cmake --build $BUILD_DIR/xgc-total-f --target xgc-es-cpp-gpu -j 1
cd $CURDIR
