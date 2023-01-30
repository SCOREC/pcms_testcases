#!/bin/bash
nodes=2
ppn=4
set -x
sbatch -N $nodes -n $((nodes*ppn)) -t 120 --gres=gpu:$ppn ./runAimos_xgcm.sh
set +x
