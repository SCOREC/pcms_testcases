#!/bin/bash
#BSUB -nnodes 8
#BSUB -P fus123
#BSUB -W 00:05     # wallclock time
#BSUB -J wdmapp    # job name

export HDF5_USE_FILE_LOCKING=FALSE
#export SstVerbose=1

GENE_ROOT=/ccs/home/kaig1/src/gene-dev/spack-build
XGC_ROOT=/ccs/home/kaig1/src/xgc-devel/spack-build

rm -rf coupling/*

cd GENE
jsrun -e prepended -n 16 $GENE_ROOT/run/gene &

cd ../XGC
jsrun -E OMP_NUM_THREADS=1 -e prepended -n 256 $XGC_ROOT/bin/xgc-es &

wait

