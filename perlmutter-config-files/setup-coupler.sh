source loads.sh

DIR=$PWD
mkdir $HOME/coupler-sources
cd $HOME/coupler-sources

PKG_ROOT=/global/common/software/m499/perlmutter/install
export CMAKE_PREFIX_PATH=$PKG_ROOT/kokkos/current/gcc:$PKG_ROOT/adios2/current/gcc:$CMAKE_PREFIX_PATH


git clone -b v2.13.8 https://github.com/catchorg/Catch2
git clone git@github.com:SCOREC/omega_h.git
git clone git@github.com:jacobmerson/redev.git
git clone git@github.com:jacobmerson/pcms.git
git clone -b wdmcpl-rebase git@github.com:jacobmerson/XGC-Devel.git
git clone git@github.com:kokkos/kokkos-fortran-interop.git



source $DIR/configure-and-build-catch2.sh
source $DIR/configure-and-build-omega-h.sh
source $DIR/configure-and-build-redev.sh
source $DIR/configure-and-build-flcl.sh
source $DIR/configure-and-build-pcms.sh
source $DIR/configure-and-build-coupled-xgc-deltaf.sh
source $DIR/configure-and-build-coupled-xgc-totalf.sh

cd $DIR
