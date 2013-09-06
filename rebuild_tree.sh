#!/bin/sh
#
#Gregg Iceton
#
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
make_phylogeny.py -i $HOME/"$name"/otus/non_chimeric_rep_set_aligned.fasta -o $HOME/$name/otus/non_chimeric.tre
