cmake -S $HOME/coupler-sources/omega_h -B $SCRATCH/coupler-build/omega_h \
	-DCMAKE_INSTALL_PREFIX=$SCRATCH/coupler-build/omega_h/install \
	-DCMAKE_CXX_COMPILER=CC \
	-DOmega_h_USE_MPI=ON \
	-DOmega_h_USE_Kokkos=ON \
	-DBUILD_TESTING=ON \
	-DMPIEXEC_EXECUTABLE=`which srun` \
	-DBUILD_SHARED_LIBS=OFF


cmake --build $SCRATCH/coupler-build/omega_h/ -j8 --target install
