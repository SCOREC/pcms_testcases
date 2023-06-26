cmake -S $HOME/coupler-sources/redev -B $SCRATCH/coupler-build/redev \
	-DCMAKE_INSTALL_PREFIX=$SCRATCH/coupler-build/redev/install/ \
	-DCMAKE_CXX_COMPILER=CC \
	-DMPIEXEC_EXECUTABLE=`which srun` \
	-DBUILD_TYPE=Release #\
	#-DBUILD_SHARED_LIBS=OFF


cmake --build $SCRATCH/coupler-build/redev/ -j8 --target install
