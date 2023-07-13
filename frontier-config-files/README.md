Petsc seems to have some trouble while driven by the script.

 
1. set source/build directory in setup-petsc.sh and setup-coupler.sh
2. run setup-petsc.sh
3. cd to petsc build directory and run make
4. cd back to this script directory and run setup-coupler.sh. This should download and build the rest of the dependencies.

Note: Currently this build has a flang segfault
