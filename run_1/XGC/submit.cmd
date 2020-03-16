#!/bin/sh -l

#SBATCH --ntasks=256          ### Total number of MPI tasks (16 cores/node)
#SBATCH -N 32                 ### Number of nodes
#SBATCH --cpus-per-task=1     ### Number of threads per task (OpenMP)
##SBATCH --ntasks-per-node=8  ### Tasks per node, ignored if cannot match previous 3
#SBATCH --ntasks-per-core=1   ### Set to 2 for hypertheading
#SBATCH --time=120:00:00       ### wall clock time
#SBATCH --job-name=XGC
##SBATCH --exclude=c9-1,c9-2,c9-3,c9-4,c10-1,c10-2,c10-3,c10-4

export OMP_NUM_THREADS=1
export HDF5_USE_FILE_LOCKING=FALSE
export MV2_ENABLE_AFFINITY=0
#set the stack size to unlimited
ulimit -s unlimited

#hdf5 if FUTILS is linked. I should cpompile a static version
export LD_LIBRARY_PATH=/home/gmerlo/soft/hdf5_intel/lib:$LD_LIBRARY_PATH

env > my_env.txt
ldd xgc-es > myldd_xgc.txt

# Launch the parallel job to the allocated compute nodes
mpiexec -n 256 -genv OMP_NUM_THREADS=1 ./xgc-es.old

### to submit a parameter scan, comment the previous line and uncomment
### the following (see GENE documentation or ./scanscript --help)
#./scanscript --np $SLURM_NTASKS --ppn $SLURM_NTASKS_PER_NODE --mps 4 --syscall="mpirun ./gene_bot"
