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
 -DCMAKE_CXX_COMPILER=`which mpicxx` \
 -DCMAKE_C_COMPILER=`which mpicc` \
 -DCMAKE_Fortran_COMPILER=`which mpifort`\
 -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
 -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64" \
 -DUSE_GPU_AWARE_MPI=ON

cmake --build $BUILD_DIR/xgc-total-f --target xgc-es-cpp-gpu
cd $CURDIR
