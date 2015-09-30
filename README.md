# mpisubmit

Simple data parallelization using MPI.

For basic applications, MPI is as easy to use as any other message-passing system. The sample scripts below contain the complete communications skeleton for a data (or embarrassingly) parallel problem using the [mpi4py](http://mpi4py.scipy.org/docs/usrman/index.html) package.

Within the code is a description of the few functions needed to write typical parallel applications.

`mpi-submit.py` - Parallel application with simple partitioning: **unbalanced load**.

`mpi-submit2.py` - Parallel application with master/slave scheme: **dynamically balanced load**. 

`jobs.sh` - Example of [PBS](https://en.wikipedia.org/wiki/Portable_Batch_System) script to run the parallel jobs on [HPC](http://www.sdsc.edu/services/hpc/hpc_systems.html). 

## Example

The following line executes `program.py` on a bunch of files in parallel:

    mpiexec -v -machinefile $PBS_NODEFILE python mpi-submit.py "/path/to/my/program.py" /path/to/my/files/*

- `mpi-submit.py` - distributes the workload => map(program.py, [file1, file2, ...])
- `program.py` - program to process each file independently
