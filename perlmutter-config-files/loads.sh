module load cmake/3.24.3
module load cray-fftw

export XGC_PLATFORM=perlmutter_gcc
export CRAYPE_LINK_TYPE=dynamic
export NVCC_WRAPPER_DEFAULT_COMPILER=CC
