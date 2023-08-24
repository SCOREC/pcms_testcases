cmake -S redev -B /gpfs/alpine/scratch/jmerson/fus123/buildRedev/ -DCMAKE_INSTALL_PREFIX=/gpfs/alpine/scratch/jmerson/fus123/buildRedev/install/ -DCMAKE_CXX_STANDARD=17 \
 -DCMAKE_BUILD_TYPE=Debug \
 -DMPIEXEC_EXECUTABLE=/sw/summit/xalt/1.2.1/bin/jsrun
 #-DCMAKE_BUILD_TYPE=RelWithDebInfo
