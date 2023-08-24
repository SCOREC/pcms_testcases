#!/bin/bash 
model=d3d.smd
declare -a meshes=(
d3d-full_20k
d3d-full_226k
d3d-full_43k
d3d-full_96k
d3d-full_9k)

parts=16

for mesh in ${meshes[@]}; do
  echo $mesh
  meshsim2osh ${mesh}.sms ${model} ${mesh}.osh #convert to omegah
  osh_reorder ${mesh}.osh ${mesh}_sfc.osh #add global numbers
  mpirun -np $parts osh_part ${mesh}_sfc.osh $parts ${mesh}_sfc_p${parts}.osh #rib partition
  mpirun -np $parts osh2vtk ${mesh}_sfc_p${parts}.osh ${mesh}_sfc_p${parts}.vtk #render
done
