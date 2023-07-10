SOURCE_DIR=$1
BUILD_DIR=$2
DEP_DIR=$BUILD_DIR

CURDIR=$PWD
cd $SOURCE_DIR

git clone git@github.com:kokkos/kokkos-fortran-interop.git

cmake -S $SOURCE_DIR/kokkos-fortran-interop -B $BUILD_DIR/flcl \
	-DCMAKE_INSTALL_PREFIX=$BUILD_DIR/flcl/install \
	-DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_COMPILER=`which mpicxx` \
  -DCMAKE_C_COMPILER=`which mpicc` \
  -DCMAKE_Fortran_COMPILER=`which mpifort`\
	-DBUILD_TESTING=OFF \
	-DFLCL_BUILD_TESTS=OFF \
	-DFLCL_BUILD_EXAMPLE=OFF \
  -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
  -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64"


cmake --build $BUILD_DIR/flcl/ -j8 --target install
cd $CURDIR
