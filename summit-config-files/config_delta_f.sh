cmake -S XGC-Devel -B$MEMBERWORK/fus123/xgc_delta_f \
 -DDELTAF_CONV=ON \
 -DXGC1=ON \
 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
 -DXGC_USE_WDMCPL_N0=ON \
 -Dwdmcpl_ROOT=/gpfs/alpine/scratch/jmerson/fus123/buildWDMApp/install
