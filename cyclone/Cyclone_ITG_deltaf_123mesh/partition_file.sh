# create omega_h mesh file
./../../../../install/omega_h_simmetrix/install/bin/meshsim2osh geqdsk_gene_comp_case5_fix.eqd.sms geqdsk_gene_comp_case5_fix.eqd.smd 123mesh.osh

# create partition files
./../../../../install/pumi-pic/build/test/print_classification 123mesh.osh 123mesh 2 60 1.0
