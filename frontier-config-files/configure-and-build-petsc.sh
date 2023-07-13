SOURCE_DIR=$1
BUILD_DIR=$2

CURDIR=$PWD
cd $BUILD_DIR

git clone -b release https://gitlab.com/petsc/petsc.git petsc
cd petsc

echo "#!/usr/bin/python
if __name__ == '__main__':
  import sys
  import os
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--download-parmetis',
    '--download-metis',
    '--with-precision=double',
    '--with-clanguage=c',
    '--with-ssl=0',
    '--with-cc=cc',
    '--with-clib-autodetect=0',
    '--with-cxx=CC',
    '--with-cxxlib-autodetect=0',
    '--with-debugging=0',
    '--with-fc=ftn',
    '--with-shared-libraries=0',
    '--with-static-libraries=1',
    '--with-x=0',
    '--with-mpiexec=srun -p batch -A PHY122 -N 1 -t 00:10:00',
    '--download-f2cblaslapack',
    '--with-64-bit-indices',
    '--with-batch=1',
    '--prefix=install',
  ]
  configure.petsc_configure(configure_options)" >configure-petsc.py

 # '--download-f2cblaslapack',
 #'CXXOPTFLAGS=-g -fast',
 #'HIPOPTFLAGS=-Ofast --amdgpu-target=gfx906,gfx908',
 #'FOPTFLAGS=-g -fast',


echo "CONFIGURE PETSC"
python3 configure-petsc.py $SOURCE_DIR $BUILD_DIR
echo "BUILD PETSC"
make PETSC_DIR=$BUILD_DIR/petsc PETSC_ARCH=arch-linux-c-opt all -j 8
#echo "INSTALL PETSC"
#make PETSC_DIR=$BUILD_DIR/petsc PETSC_ARCH=arch-linux-c-opt install

cd $CURDIR
