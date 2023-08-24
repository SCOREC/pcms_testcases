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

mkdir coupledrun
cd coupledrun
cp -r ../run_summit_coupled.sh ../*.cpn ../*.osh .
mkdir core
cd core
echo `pwd`
copyfiles
echo "
&wdmcpl
wdmcpl_side=0
/
" >> input
cd ../
mkdir edge
cd edge
copyfiles
echo "
&wdmcpl
wdmcpl_side=1
/
" >> input
