# XGC build and run instruction

- Depending on the HPC platform, building the `xgc-es` executable accordingly.

- In `xgc_flags.mk` file, define the flags used in building `xgc-es`, the flags should include the following:
 
  XGC_FLAGS += -DITER_GRID -DCAM_TIMERS -DCONVERT_GRID2 -DDELTAF_MODE2 -DINIT_GENE_PERT -DNEW_FLX_AIF

- The run script `run_cori_xgc1.sh` is setup to run the test case on NERSC Cori KNL with 16 nodes and 256 cores. The reason for running only 16 cores per KNL node is for memory issue. 

- on NERSC cori, type `sbatch run_cori_xgc1.sh` to run the test case

- on RPI aimos, type `./submit_aimos_xgc.sh` to run the test case
 - runs 200 steps without issue

- On a different HPC system with different memory, user could modify the run script to use the system more effectively if possible, i.e., use more available computing resources to run the test case.

- The test case contains 590k triangle elements. This test case is used in XGC for benchmark purpose. The original test case is described here: https://github.com/PrincetonUniversity/XGC-Examples/wiki/delta-f_ITG.

- The mesh is regenerated with XGC meshing code` in `https://github.com/SCOREC/Fusion` branch with commit around: https://github.com/SCOREC/Fusion/commit/8445f6731514259cd925d25e0839c6ea6289044e.

The matlab_file folder contains post-process scripts to read in the `*.bp` file in Matlab compiled with Adios. Currently, this will work on NERSC Cori, since AiMOS does not have Matlab installed. 
  - On NERSC Cori, Matlab/R2019a seems to be the only working Matlab version at the moment due to compatiblity with Adios1.
