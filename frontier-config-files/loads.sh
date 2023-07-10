module reset
module unload perftools-base
module load cmake
module load PrgEnv-amd
#module swap amd amd/5.2.0
#module swap cray-mpich cray-mpich/8.1.25
module load craype-accel-amd-gfx90a
export CRAYPE_LINK_TYPE=dynamic
#export PATH=${CRAY_MPICH_PREFIX}/bin:${PATH}
#export PATH=${ROCM_COMPILER_PATH}/bin:${PATH}
#export MPICH_SMP_SINGLE_COPY_MODE=NONE
#export MPICH_GPU_SUPPORT_ENABLED=1
#export ROCM_PATH=/opt/rocm-5.2.0
#export OLCF_ROCM_ROOT=/opt/rocm-5.2.0
#export LD_LIBRARY_PATH=$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH
#export MPICH_CXX=${OLCF_ROCM_ROOT}/bin/hipcc
#export LLVM_PATH=${ROCM_PATH}/llvm
#export HIP_CLANG_PATH=${ROCM_PATH}/llvm/bin
#export HSA_PATH=${ROCM_PATH}
#export ROCMINFO_PATH=${ROCM_PATH}
#export DEVICE_LIB_PATH=${ROCM_PATH}/amdgcn/bitcode
#export HIP_DEVICE_LIB_PATH=${ROCM_PATH}/amdgcn/bitcode
#export HIP_PLATFORM=amd
#export HIP_COMPILER=clang
#export HIPCC_COMPILE_FLAGS_APPEND="$HIPCC_COMPILE_FLAGS_APPEND --rocm-path=${ROCM_PATH}"
#export XGC_PLATFORM=generic

