#!/bin/bash
#SBATCH -A m499
#SBATCH -C knl
#SBATCH --qos=regular
#SBATCH --nodes=6
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=16
#SBATCH --time=4:00:00
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=zhangc20@rpi.edu
#SBATCH --job-name=Cyclone_590k_nphi=8_nnode=6
#SBATCH -o Cyclone_590k.%j.out
#SBATCH -e Cyclone_590k.%j.err

# load modules used to build XGC
module load cray-libsci
module swap craype-haswell craype-mic-knl
module load cray-hdf5-parallel
module load cray-fftw
export XGC_PLATFORM=cori_knl
export CRAYPE_LINK_TYPE=static

export OMP_MAX_ACTIVE_LEVELS=2
export OMP_STACKSIZE=2G
export OMP_NUM_THREADS=1
export xgc_bin_path=/global/homes/z/zhangc20/xgc/XGC-Devel/build/bin/xgc-es-cpp

export n_mpi_ranks_per_node=16
export n_mpi_ranks=$((${SLURM_JOB_NUM_NODES} * ${n_mpi_ranks_per_node}))
echo 'Number of nodes: '                  ${SLURM_JOB_NUM_NODES}
echo 'MPI ranks (total): '                $n_mpi_ranks
echo 'MPI ranks per node: '               $n_mpi_ranks_per_node
echo 'Number of OMP threads: '            ${OMP_NUM_THREADS}
echo 'XGC executable: '                   ${xgc_bin_path}

srun -n 96 -c 16 --cpu_bind=cores $xgc_bin_path >& Cyclone_590k_${SLURM_JOB_ID}.log
