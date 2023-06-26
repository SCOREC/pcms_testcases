DEP_DIR=$SCRATCH/coupler-build/
cmake -S $HOME/coupler-sources/kokkos-fortran-interop -B $SCRATCH/coupler-build/flcl \
	-DCMAKE_INSTALL_PREFIX=$SCRATCH/coupler-build/flcl/install \
	-DCMAKE_CXX_COMPILER=CC \
	-DCMAKE_C_COMPILER=cc \
	-DCMAKE_Fortran_COMPILER=ftn \
	-DBUILD_TYPE=Release \
	-DBUILD_TESTING=OFF \
	-DFLCL_BUILD_TESTS=OFF \
	-DFLCL_BUILD_EXAMPLE=OFF


cmake --build $SCRATCH/coupler-build/flcl/ -j8 --target install
