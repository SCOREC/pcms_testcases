SOURCE_DIR=$1
BUILD_DIR=$2

cd $SOURCE_DIR

git clone git@github.com:jacobmerson/redev.git

cmake -S $SOURCE_DIR/redev -B $BUILD_DIR/redev \
	-DCMAKE_INSTALL_PREFIX=$BUILD_DIR/redev/install/ \
	-DCMAKE_CXX_COMPILER=CC \
	-DMPIEXEC_EXECUTABLE=`which srun` \
	-DBUILD_TYPE=Release #\
	#-DBUILD_SHARED_LIBS=OFF


cmake --build $BUILD_DIR/redev/ -j8 --target install
