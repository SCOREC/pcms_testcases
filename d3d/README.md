## Contents

d3d.smd - Simmetrix GeomSim geometric model with mesh generation attributes
4p.cpn - four process partition of the geometric model faces of d3d.smd
d3d-full_9k_sfc.osh - Omega_h mesh with nine thousand triangles
d3d-full_9k_sfc_p16.osh - Omega_h with nine thousand triangles partitioned to 16 processes
  with the Omegah\_h recursive inertial bisection partitioner
prepareMeshes.sh - script to convert, reorder, partition, and render meshes
README.md - this file

## Notes

- `d3d.smd` was created using the TOMMS mesh generation tools using Simmetrix
  SimModSuite 17.0-210808dev
- Mesh attributes in `d3d.smd` were defined using SimModeler 11.0-210812-dev.
  There are mesh attribute cases in `d3d.smd` for generating meshes with
  9k (k=thousand), 20k, 43k, 96k, and 226k triangles.
- The `prepareMeshes.sh` uses multiple utilities from the SCOREC fork of Omega\_h v10.2.0 
  for converting the Simmetrix (`.sms`) meshes to Omega\_h (`.osh`), reordering
  them with a space filling curve so that they have a global numbering defined,
  partitioning them with the Omega\_h recursive inertial bisection method, and
  lastly, creating Paraview `.vtu` files for visualising the mesh.
  Note, the TOMMS mesh generator, which we should be using in the longer term,
  will generate meshes with a global numbering so that step performed by the
  script can be skipped.

