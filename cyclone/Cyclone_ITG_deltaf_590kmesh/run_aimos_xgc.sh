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
awk "{ print \$0 \"-ib slots=$SLURM_NTASKS_PER_NODE\"; }" /tmp/hosts.$SLURM_JOB_ID >/tmp/tmp.$SLURM_JOB_ID
mv /tmp/tmp.$SLURM_JOB_ID /tmp/hosts.$SLURM_JOB_ID

module use /gpfs/u/software/dcs-spack-install/v0133/lmod/linux-rhel7-ppc64le/xl/16.1.1
module load xl_r/16.1.1
module load spectrum-mpi/10.3-i3wnm5t
module load \
  cmake/3.15.4-ti5mams \
  netlib-lapack/3.8.0-rsp2pyc \
  hdf5/1.10.3-k67pjp5 \
  fftw/3.3.8-xtlviu3 \
  adios/1.13.1-tvz2o6o \
  adios2/2.5.0-smahdxw \
  petsc/3.7.7-int32-real-c-y64v5rk \
  c-blosc/1.17.0-gke5ufc \
  zfp/0.5.5-3lpli7j \
  sz/2.0.2.0-yny3tge \
  valgrind

bin=./xgc-es

mpirun --bind-to core -hostfile /tmp/hosts.$SLURM_JOB_ID -np $SLURM_NTASKS \
/bin/bash -c "ulimit -s unlimited -c unlimited; export OMP_NUM_THREADS=1; ./xgc-es -no_signal_handler"

rm /tmp/hosts.$SLURM_JOB_ID
