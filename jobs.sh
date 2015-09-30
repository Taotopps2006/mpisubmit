#!/bin/bash

#PBS -A fpaolo             # account name
#PBS -q hotel              # queue name
#PBS -N test               # job name
#PBS -o test.out           # output file name
#PBS -e test.err           # error file name
#PBS -l nodes=1:ppn=2      # nodes, process-per-node
#PBS -l walltime=0:00:10   # requested time h:mm:ss
#PBS -M fpaolo@ucsd.edu    # email to receive messages
#PBS -m abe                # message me when start and stop
#PBS -V                    # verbose

# print info on the screen
echo 'PBS_JOBID:' $PBS_JOBID
echo 'PBS_O_WORKDIR:' $PBS_O_WORKDIR
echo 'PBS_O_QUEUE:' $PBS_O_QUEUE
echo 'PBS_NODEFILE:' $PBS_NODEFILE

# Change to current workdir
cd $PBS_O_WORKDIR

# run programs
mpiexec -v -machinefile $PBS_NODEFILE python -c "print 'hello world'"

#mpiexec -v -machinefile $PBS_NODEFILE python mpi-submit.py '/path/to/prog.py' ~/path/to/data/file.*
#
# notes
# -----
# mpi-submit.py - distributes the workload => map(prog.py, [f1, f2, ...])
# prog.py - program to run on each file independently
# file.* - data files to process in parallel
