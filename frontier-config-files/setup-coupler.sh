DIR=$PWD

source $DIR/loads.sh

SOURCE_DIR=$HOME/coupler-sources
BUILD_DIR=$MEMBERWORK/phy122/coupler-build-frontier-all-deps

mkdir $SOURCE_DIR
cd $SOURCE_DIR


export CMAKE_PREFIX_PATH=/opt/cray/pe/fftw/3.3.8.13/x86_trento:$CMAKE_PREFIX_PATH

##source $DIR/configure-and-build-catch2.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-kokkos.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-cabana.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-petsc.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-adios2.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-omega-h.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-redev.sh $SOURCE_DIR $BUILD_DIR
##source $DIR/configure-and-build-flcl.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-pcms.sh $SOURCE_DIR $BUILD_DIR
#
#
#module list &> loaded_modules.txt
#env &> current_env.txt
git clone -b wdmcpl-rebase git@github.com:jacobmerson/XGC-Devel.git
source $DIR/configure-and-build-coupled-xgc-deltaf.sh $SOURCE_DIR $BUILD_DIR
source $DIR/configure-and-build-coupled-xgc-totalf.sh $SOURCE_DIR $BUILD_DIR
#
#
#cd $DIR
