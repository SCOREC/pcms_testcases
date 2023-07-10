SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone -b v2.9.0 https://github.com/ornladios/ADIOS2.git adios2

cmake -S $SOURCE_DIR/adios2 -B $BUILD_DIR/adios2 \
 -DCMAKE_CXX_COMPILER=`which mpicxx` \
 -DCMAKE_C_COMPILER=`which mpicc` \
 -DCMAKE_Fortran_COMPILER=`which mpifort` \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/adios2/install \
 -DADIOS2_BUILD_EXAMPLES=OFF \
 -DCMAKE_CXX_FLAGS="-I${OLCF_ROCM_ROOT}/include  -munsafe-fp-atomics" \
 -DCMAKE_EXE_LINKER_FLAGS="-L${OLCF_ROCM_ROOT}/lib -lamdhip64"

cmake --build $BUILD_DIR/adios2 -j 8 --target install

cd $CURDIR
