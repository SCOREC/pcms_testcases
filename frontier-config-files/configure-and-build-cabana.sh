SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone https://github.com/ECP-copa/Cabana.git cabana

cmake -S $SOURCE_DIR/cabana -B $BUILD_DIR/cabana \
 -DCMAKE_CXX_COMPILER=`which mpicxx` \
 -DCMAKE_C_COMPILER=`which mpicc` \
 -DCMAKE_Fortran_COMPILER=`which mpifort` \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/cabana/install \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DCabana_ENABLE_CAJITA=OFF \
 -DCabana_ENABLE_TESTING=OFF \
 -DCabana_ENABLE_EXAMPLES=OFF \
 -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
 -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64"


cmake --build $BUILD_DIR/cabana -j 8 --target install

cd $CURDIR
