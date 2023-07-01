DIR=$PWD

source $DIR/loads.sh

SOURCE_DIR=$HOME/coupler-sources
BUILD_DIR=$MEMBERWORK/phy122/coupler-build-frontier

mkdir $SOURCE_DIR
cd $SOURCE_DIR


PKG_ROOT="/lustre/orion/world-shared/phy122/xgc-deps-frontier/amd_rocm_5.2.0_mpich_8.1.23"
export CMAKE_PREFIX_PATH=$PKG_ROOT/kokkos/:$PKG_ROOT/${ADIOS2}:/opt/cray/pe/fftw/3.3.8.13/x86_trento:$CMAKE_PREFIX_PATH

source $DIR/configure-and-build-catch2.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-omega-h.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-redev.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-flcl.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-pcms.sh $SOURCE_DIR $BUILD_DIR


git clone -b wdmcpl-rebase git@github.com:jacobmerson/XGC-Devel.git
source $DIR/configure-and-build-coupled-xgc-deltaf.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-coupled-xgc-deltaf.sh $SOURCE_DIR $BUILD_DIR


cd $DIR
