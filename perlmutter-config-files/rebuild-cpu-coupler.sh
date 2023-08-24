source /pscratch/sd/j/jmerson/wdmapp_testcases/perlmutter-config-files/loads-cpu.sh
cmake --build /pscratch/sd/j/jmerson/coupler-build-cpu/pcms --target xgc_n0_server wdmcpl_fortranapi &&
cmake --install /pscratch/sd/j/jmerson/coupler-build-cpu/pcms &&
cmake --build /pscratch/sd/j/jmerson/coupler-build-cpu/xgc-delta-f --target xgc-es-cpp -j 8 &&
cmake --build /pscratch/sd/j/jmerson/coupler-build-cpu/xgc-total-f --target xgc-es-cpp -j 8
