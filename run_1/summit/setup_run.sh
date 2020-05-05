#! /bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <run-directory>"
    echo
    echo "will set up a sample coupled GENE-XGC run in <run-directory>."
fi

set -e

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"
RUN_DIR=$1

echo "Preparing run in $RUN_DIR"

mkdir -p $RUN_DIR

mkdir -p $RUN_DIR/GENE
mkdir -p $RUN_DIR/GENE/out

mkdir -p $RUN_DIR/XGC
mkdir -p $RUN_DIR/XGC/restart_dir

mkdir -p $RUN_DIR/coupling

for f in parameters XGC_map_circular_2020_new.h5 adios2cfg.xml \
         tracer_fast profiles_ions \
         coupling.in
do
    ln -s $SRC_DIR/GENE/$f $RUN_DIR/GENE
done

for f in input adioscfg.xml adios2cfg.xml petsc.rc \
        geqdsk_gene_comp_case5_fix.eqd \
        geqdsk_gene_comp_case5_fixed.eqd.node \
        geqdsk_gene_comp_case5_fixed.eqd.ele \
        den_gene_case5.prf \
        temp_gene_case5_fix.prf \
        perturbation.in \
	ogyropsi_init_cond.bp
do
    ln -s $SRC_DIR/XGC/$f $RUN_DIR/XGC
done

ln -s $SRC_DIR/summit/job_wdmapp.sh $RUN_DIR

echo "Done preparing run. You'll have to edit"
echo "$RUN_DIR/job_wdmapp.sh"
echo "to reflect the paths to your builds of GENE and XGC."

