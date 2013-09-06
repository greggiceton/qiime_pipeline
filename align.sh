#!/bin/sh

#Gregg Iceton
#
#PBS -j oe
#PBS -e $HOME/qsub_error_files
#PBS -o $HOME/qsub_error_files
  parallel_align_seqs_pynast.py -i $HOME/$name/otus/rep_set.fna -o $HOME/$name/otus/pynast_aligned_seqs -T
