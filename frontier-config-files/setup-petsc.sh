# Petsc needs to be built separately because it hangs if compiling after other things
DIR=$PWD

source $DIR/loads.sh

SOURCE_DIR=$HOME/coupler-sources
BUILD_DIR=$MEMBERWORK/phy122/coupler-build-frontier-all-deps

mkdir $SOURCE_DIR
cd $SOURCE_DIR


export CMAKE_PREFIX_PATH=/opt/cray/pe/fftw/3.3.8.13/x86_trento:$CMAKE_PREFIX_PATH

source $DIR/configure-and-build-petsc.sh $SOURCE_DIR $BUILD_DIR
#
#
#cd $DIR
