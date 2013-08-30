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
filter_otus_from_otu_table.py -o $HOME/$name/otus/otu_table_mc2_w_tax_no_pynast_failures.biom -i $HOME/$name/otus/otu_table_mc2_w_tax.biom -e -i $HOME/$name/otus/pynast_aligned_seqs/rep_set_failures.fasta
