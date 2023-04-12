cmake -S wdmapp_coupling -B /gpfs/alpine/scratch/jmerson/fus123/buildWDMApp/ \
 -DCMAKE_INSTALL_PREFIX=/gpfs/alpine/scratch/jmerson/fus123/buildWDMApp/install/ \
 -DCatch2_ROOT=/gpfs/alpine/scratch/jmerson/fus123/buildCatch2/install/ \
 -DOmega_h_ROOT=/gpfs/alpine/scratch/jmerson/fus123/buildOmegaH/install/ \
 -Dredev_ROOT=/gpfs/alpine/scratch/jmerson/fus123/buildRedev/install/ \
 -Dflcl_ROOT=/gpfs/alpine/scratch/jmerson/fus123/buildFlcl/install/ \
 -DWDMCPL_TEST_DATA_DIR=/ccs/home/jmerson/coupling/wdmapp_testcases \
 -DCMAKE_CXX_FLAGS="--expt-relaxed-constexpr" \
 -DCMAKE_CXX_STANDARD=17 \
 -DCMAKE_BUILD_TYPE=Debug \
 -DMPIEXEC_EXECUTABLE=/sw/summit/xalt/1.2.1/bin/jsrun
 #-DCMAKE_BUILD_TYPE=RelWithDebInfo
