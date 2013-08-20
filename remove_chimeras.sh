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
parallel_identify_chimeric_seqs.py -i $HOME/"$name"/split_out/seqs.fna -a /share/apps/qiime/core_set_aligned.fasta.imputed -m ChimeraSlayer -O 16 -X "$name"_chim
