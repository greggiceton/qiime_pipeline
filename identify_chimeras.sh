#!/bin/sh
#
#Gregg Iceton
#
#PBS -M gregg@iceton.org
#PBS -m abe
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
#
parallel_identify_chimeric_seqs.py -T -i $HOME/"$name"/otus/pynast_aligned_seqs/rep_set_aligned.fasta -a /share/apps/qiime/core_set_aligned.fasta.imputed -m ChimeraSlayer -O 16 -X "7_$name" -o $HOME/$name/otus/chimeric_seqs.txt
