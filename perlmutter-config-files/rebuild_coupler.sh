cmake --build /pscratch/sd/j/jmerson/coupler-build/pcms --target xgc_n0_server wdmcpl_fortranapi &&
cmake --install /pscratch/sd/j/jmerson/coupler-build/pcms &&
cmake --build /pscratch/sd/j/jmerson/coupler-build/xgc-delta-f --target xgc-es-cpp-gpu -j 8 &&
cmake --build /pscratch/sd/j/jmerson/coupler-build/xgc-total-f --target xgc-es-cpp-gpu -j 8
