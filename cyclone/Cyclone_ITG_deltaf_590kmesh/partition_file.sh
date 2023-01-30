# create omega_h mesh file
./../../../../install/omega_h_simmetrix/install/bin/meshsim2osh simMesh_result.sms simModel_result.smd 590kmesh.osh

# create partition files
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 4 145000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 6 100000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 8 73000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 12 48000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 16 36000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 18 31500 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 24 23000 1.0
./../../../../install/pumi-pic/build/test/print_classification 590kmesh.osh 590kmesh 48 11000 1.0
