SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone https://github.com/ECP-copa/Cabana.git cabana

cmake -S $SOURCE_DIR/cabana -B $BUILD_DIR/cabana \
 -DCMAKE_CXX_COMPILER=CC \
 -DCMAKE_C_COMPILER=cc \
 -DCMAKE_Fortran_COMPILER=ftn \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/cabana/install \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DCabana_ENABLE_CAJITA=OFF \
 -DCabana_ENABLE_TESTING=OFF \
 -DCabana_ENABLE_EXAMPLES=OFF


cmake --build $BUILD_DIR/cabana -j 8 --target install

cd $CURDIR
