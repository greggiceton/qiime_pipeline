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
filter_otus_from_otu_table.py -i $HOME/$name/otus/otu_table_mc2_w_tax_no_pynast_failures.biom -o $HOME/$name/otus/otu_table_non_chimeric.biom -e $HOME/$name/otus/chimeric_seqs.txt
