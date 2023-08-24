#!/bin/bash
nodes=1
nprocs=16

sbatch -t 100 -N $nodes -n $nprocs ./run_aimos_xgc.sh

