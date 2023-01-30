#!/bin/bash
nodes=8
nprocs=256

sbatch -t 100 -N $nodes -n $nprocs ./run_aimos_xgc.sh

