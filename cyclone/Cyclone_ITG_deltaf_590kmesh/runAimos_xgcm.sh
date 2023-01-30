#!/bin/bash
if [ "x$SLURM_NPROCS" = "x" ] 
then
  if [ "x$SLURM_NTASKS_PER_NODE" = "x" ] 
  then
    SLURM_NTASKS_PER_NODE=1
  fi
  SLURM_NPROCS=`expr $SLURM_JOB_NUM_NODES \* $SLURM_NTASKS_PER_NODE`
else
  if [ "x$SLURM_NTASKS_PER_NODE" = "x" ]
  then
    SLURM_NTASKS_PER_NODE=`expr $SLURM_NPROCS / $SLURM_JOB_NUM_NODES`
  fi
fi

srun hostname -s | sort -u > /tmp/hosts.$SLURM_JOB_ID

module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq

bin=XGCm

# Cyclone case with 590k mesh elements
mpirun -hostfile /tmp/hosts.$SLURM_JOB_ID -np ${SLURM_NPROCS} -gpu $bin \
  590kmesh.osh 590kmesh_4.cpn \
  1 1 full bfs 0 1 1 input_xgcm petsc petsc_xgcm.rc \
  -dm_vec_type cuda -dm_mat_type aijcusparse -use_gpu_aware_mpi 0

rm /tmp/hosts.$SLURM_JOB_ID
