#!/bin/sh
#
#Gregg Iceton
#
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
filter_fasta.py -f $HOME/"$name"/otus/pynast_aligned_seqs/rep_set_aligned.fasta -o $HOME/$name/otus/non_chimeric_rep_set_aligned.fasta -s $HOME/$name/otus/chimeric_seqs.txt -n
