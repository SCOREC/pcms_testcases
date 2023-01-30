#!/bin/bash
# Begin LSF Directives
#BSUB -P PHY122
#BSUB -W 0:40
#BSUB -nnodes 2
#BSUB -J Cyclone-590k
#BSUB -o Cyclone-590k.%J
#BSUB -e Cyclone-590k.%J
#BSUB -N zhangc20@rpi.edu
#BSUB -B zhangc20@rpi.edu

module load cuda/10.2.89

date
jsrun -n 8 -a 1 -c 1 -g 1 --smpiargs "-gpu" \
./XGCm_GPU_KSP --kokkos-threads=1 590kmesh.osh 590kmesh_6.cpn \
1 1 bfs bfs 0 1 0 3 input_20million_nrho=3 petsc petsc_xgcm.rc \
-dm_vec_type cuda -dm_mat_type aijcusparse -use_gpu_aware_mpi 0

date
