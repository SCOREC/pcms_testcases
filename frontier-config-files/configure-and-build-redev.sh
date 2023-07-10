SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone git@github.com:jacobmerson/redev.git

cmake -S $SOURCE_DIR/redev -B $BUILD_DIR/redev \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/redev/install/ \
 -DCMAKE_CXX_COMPILER=`which mpicxx` \
 -DMPIEXEC_EXECUTABLE=`which srun` \
 -DCMAKE_BUILD_TYPE=Release \
 -DADIOS2_DIR=$BUILD_DIR/adios2/install/lib64/cmake/adios2 \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
 -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64"
	#-DBUILD_SHARED_LIBS=OFF


cmake --build $BUILD_DIR/redev/ -j8 --target install
cd $CURDIR
