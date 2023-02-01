#!/bin/bash
copyfiles() {
cp ../../geqdsk_gene_comp_case5_fix.eqd.ele \
  ../../geqdsk_gene_comp_case5_fix.eqd.flx.aif \
  ../../geqdsk_gene_comp_case5_fix.eqd.node \
  ../../input \
  ../../petsc.rc \
  ../../geqdsk_gene_comp_case5_fix.eqd \
  ../../den_gene_case5.prf \
  ../../temp_gene_case5_fix.prf \
  ../../meshRclassification.txt \
  ../../adios2cfg.xml \
  .
}

mkdir coupled
cd coupled
mkdir deltaf1
cd deltaf1
echo `pwd`
copyfiles
cd ../
mkdir deltaf2
cd deltaf2
copyfiles
