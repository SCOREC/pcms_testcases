cmake -S $HOME/coupler-sources/Catch2 -B $SCRATCH/coupler-build/Catch2 \
	-DCMAKE_INSTALL_PREFIX=$SCRATCH/coupler-build/Catch2/install \
	-DCMAKE_CXX_COMPILER=CC

cmake --build $SCRATCH/coupler-build/Catch2/ -j8 --target install
