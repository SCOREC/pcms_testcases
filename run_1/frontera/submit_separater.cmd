#!/bin/sh -l                                                                                                                         
rm -rf coupling/*

sbatch submit_XGC.cm 

sbatch submit_GENE.cm
