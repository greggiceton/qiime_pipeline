#!/bin/sh

#Gregg Iceton
#
#PBS -j oe
#PBS -e $HOME/qsub_error_files
#PBS -o $HOME/qsub_error_files
  filter_alignment.py -o $HOME/$name/otus/pynast_aligned_seqs -i $HOME/$name/otus/pynast_aligned_seqs/rep_set_aligned.fasta
