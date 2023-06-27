SOURCE_DIR=$1
BUILD_DIR=$2

cd $SOURCE_DIR

git clone -b v2.13.8 https://github.com/catchorg/Catch2

cmake -S $SOURCE_DIR/Catch2 -B $BUILD_DIR/Catch2 \
	-DCMAKE_INSTALL_PREFIX=$BUILD_DIR/Catch2/install \
	-DCMAKE_CXX_COMPILER=CC

cmake --build $BUILD_DIR/Catch2/ -j8 --target install
