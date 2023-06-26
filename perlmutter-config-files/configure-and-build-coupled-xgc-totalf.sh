MYDEPS=$SCRATCH/coupler-build/
cmake -S $HOME/coupler-sources/XGC-Devel -B $SCRATCH/coupler-build/xgc-total-f \
 -DDELTAF_CONV=OFF \
 -DXGC1=ON \
 -DCMAKE_BUILD_TYPE=Release \
 -DXGC_USE_WDMCPL_N0=ON \
 -Dwdmcpl_DIR=$MYDEPS/pcms/install/lib64/cmake/wdmcpl

cmake --build $SCRATCH/coupler-build/xgc-total-f -j8 --target xgc-es-cpp-gpu
