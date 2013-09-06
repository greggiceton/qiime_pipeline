#!/bin/sh

#Gregg Iceton
#
#PBS -j oe
#PBS -e $HOME/qsub_error_files
#PBS -o $HOME/qsub_error_files
#
#Submit script to default queue using an integer passed at command line to define which stream run to use
#e.g. qsub -v integer=13 convert_fasta.sh
	convert_fastaqual_fastq.py -f $HOME/$name/$name.fastq -c fastq_to_fastaqual -o $HOME/$name
