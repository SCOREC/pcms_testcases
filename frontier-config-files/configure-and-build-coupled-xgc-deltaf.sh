SOURCE_DIR=$1
BUILD_DIR=$2
MYDEPS=$BUILD_DIR

CURDIR=$PWD
cd $SOURCE_DIR

cmake -S $SOURCE_DIR/XGC-Devel -B $BUILD_DIR/xgc-delta-f \
 -DDELTAF_CONV=ON \
 -DXGC1=ON \
 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
 -DXGC_USE_WDMCPL_N0=ON \
 -Dwdmcpl_DIR=$MYDEPS/pcms/install/lib64/cmake/wdmcpl \
 -DCMAKE_CXX_COMPILER=`which mpicxx` \
 -DCMAKE_C_COMPILER=`which mpicc` \
 -DCMAKE_Fortran_COMPILER=`which mpifort`\
 -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
 -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64" \
 -DUSE_GPU_AWARE_MPI=ON \
 -DADIOS2_DIR=$BUILD_DIR/adios2/install/lib64/cmake/adios2 \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DCabana_DIR=$BUILD_DIR/cabana/install/lib64/cmake/Cabana/ \
 -DPETSC_DIR=$BUILD_DIR/petsc/install 

cmake --build $BUILD_DIR/xgc-delta-f --target xgc-es-cpp-gpu -j 8
cd $CURDIR
