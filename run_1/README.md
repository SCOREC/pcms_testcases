
# Sample coupled run 1

This has all the inputs needed to run a coupled simulation (adiabatic electrons) between
XGC-Devel and GENE.

On summit, you should be able to do

```sh
$ summit/setup_run.sh <run-dir>
```

and it'll set up what's needed in `<run-dir>`, including a `job-wdmapp.sh` job script. That will
still need editing to put in the correct paths to the gene and xgc-es executables.
