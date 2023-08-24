module load nvhpc/21.7
module load spectrum-mpi
module load python
module load netlib-lapack
module load hypre
module load fftw
module load hdf5
module load cmake/3.20.2
module load libfabric/1.12.1-sysrdma
export XGC_PLATFORM=summit
export OMP_NUM_THREADS=14
export FC=mpifort
export CC=mpicc
export NVCC_WRAPPER_DEFAULT_COMPILER=mpiCC
export CXX=/gpfs/alpine/world-shared/phy122/lib/install/summit/kokkos/nvhpc21.7/bin/nvcc_wrapper
export XGC_PLATFORM=summit

# add packages to path for wdmapp_coupling
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/gpfs/alpine/world-shared/phy122/lib/install/summit/adios2/devel/nvhpc:/sw/summit/spack-envs/base/opt/linux-rhel8-ppc64le/nvhpc-21.7/fftw-3.3.9-bzi7deue27ijd7xm4zn7pt22u4sj47g4:/gpfs/alpine/world-shared/phy122/lib/install/summit/kokkos/DEFAULT/install
#set(ADIOS2_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/adios2/devel/nvhpc")
#
#set(FFTW3_ROOT "/sw/summit/spack-envs/base/opt/linux-rhel8-ppc64le/nvhpc-21.7/fftw-3.3.9-bzi7deue27ijd7xm4zn7pt22u4sj47g4")
#
#set(LAPACK_ROOT "$ENV{OLCF_NVHPC_ROOT}")
#
#set(USE_SYSTEM_CAMTIMERS ON CACHE BOOL "Use system camtimers")
#set(CAMTIMERS_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/camtimers-perfstubs/nvhpc21.7")
#
#set(USE_SYSTEM_PSPLINE ON CACHE BOOL "Use system pspline")
#set(PSPLINE_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/pspline/nvhpc21.7")
#
#set(Cabana_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/Cabana/DEFAULT/install")
#set(Kokkos_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/kokkos/DEFAULT/install")
#
#set(GTEST_ROOT "/gpfs/alpine/world-shared/phy122/lib/install/summit/gtest/DEFAULT/install")
