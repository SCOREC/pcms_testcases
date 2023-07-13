SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $SOURCE_DIR

git clone -b reducedThrust git@github.com:SCOREC/omega_h.git

cmake -S $SOURCE_DIR/omega_h -B $BUILD_DIR/omega_h \
 -DCMAKE_INSTALL_PREFIX=$BUILD_DIR/omega_h/install \
 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
 -DBUILD_SHARED_LIBS=OFF \
 -DOMega_h_USE_CUDA=OFF \
 -DOmega_h_USE_MPI=ON \
 -DOmega_h_USE_OpenMP=OFF \
 -DCMAKE_CXX_COMPILER=CC \
 -DOmega_h_USE_Kokkos=ON \
 -DBUILD_TESTING=ON \
 -DKokkos_DIR=$BUILD_DIR/kokkos/install/lib64/cmake/Kokkos/ \
 -DMPIEXEC_EXECUTABLE=`which srun`


cmake --build $BUILD_DIR/omega_h/ -j8 --target install
cd $CURDIR
