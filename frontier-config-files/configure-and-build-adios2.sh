SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone -b v2.9.0 https://github.com/ornladios/ADIOS2.git adios2

cmake -S $SOURCE_DIR/adios2 -B $BUILD_DIR/adios2 \
 -DCMAKE_CXX_COMPILER=CC \
 -DCMAKE_C_COMPILER=cc \
 -DCMAKE_Fortran_COMPILER=ftn \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/adios2/install \
 -DADIOS2_BUILD_EXAMPLES=OFF 

cmake --build $BUILD_DIR/adios2 -j 8 --target install

cd $CURDIR
