MYDEPS=$SCRATCH/coupler-build/
cmake -S $HOME/coupler-sources/pcms -B $SCRATCH/coupler-build/pcms \
	-DCMAKE_INSTALL_PREFIX=$SCRATCH/coupler-build/pcms/install \
	-DCMAKE_CXX_COMPILER=CC \
	-DCMAKE_C_COMPILER=cc \
	-DCMAKE_Fortran_COMPILER=ftn \
	-DMPIEXEC_EXECUTABLE=`which srun` \
	-DCMAKE_BUILD_TYPE=Release \
	-DCatch2_DIR=$MYDEPS/Catch2/install/lib64/cmake/Catch2/ \
	-DOmega_h_DIR=$MYDEPS/omega_h/install/lib/cmake/Omega_h/ \
	-Dredev_DIR=$MYDEPS/redev/install/lib64/cmake/redev/ \
	-Dflcl_DIR=$MYDEPS/flcl/install/lib64/cmake/flcl/ \
	-DWDMCPL_TEST_DATA_DIR=$SCRATCH/wdmapp_testcases \
	-DMPIEXEC_EXECUTABLE=`which srun` \
	-DBUILD_TESTING=ON

cmake --build $SCRATCH/coupler-build/pcms/ -j8 --target install
