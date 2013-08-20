#!/bin/bash
#
#Qiime pipeline by Gregg Iceton
#
#Expects a directory to exist whose name is passed at the command line
#e.g. ./qiime_pipline.sh YOUR_FILE_NAME
#This directory should contain e.g. YOUR_FILE_NAME.fastq and YOUR_FILE_NAMEmap.txt
#Note that the mapping file name format!
#Any pre-existing directories or files other than the above will cause an error
#For example, if you are running an analysis for the second time you must remove 
#the directories created by the first analysis, or change the directory name
#
#Designed to operate as a workflow on the NGS cluster
#such that serial jobs are submitted to compute nodes
#
#Check that $1 isn't empty
if [[ -z "$1" ]]; then
	echo -e "Error - you must enter a name for the analysis at the end of the command e.g.\"qiime_pipeline stream13\""
	exit
fi
#Generate qiime parameters file to include name in job
(cat /share/apps/qiime/qiime_prefs.txt ; echo -e "parallel_pick_otus_trie:job_prefix\t"$1"_trie\nparallel_pick_otus_usearch61_ref:job_prefix\t"$1"_usearch61\nparallel_pick_otus_uclust_ref:job_prefix\t"$1"_uclust_ref\nparallel_assign_taxonomy_rdp:job_prefix\t"$1"_RDP\nparallel_align_seqs_pynast:job_prefix\t"$1"_PyNAST") > $HOME/$1/"$1"_qiime_params.txt
#
#Convert the fastq file to fasta and qual
#
FIRST=$(qsub -N "$1"convert -v name=$1 convert_fastq.sh)
echo $FIRST
#
#Split the libraries according to the mapping file
#
SECOND=$(qsub -N "$1"spl_lib -v name=$1 -W depend=afterok:$FIRST split_lib.sh)
echo $SECOND
#
#Pick OTUs using open reference (first compare to Greengenes, then de novo),
#align sequences, build tree, assign taxonomy
#
THIRD=$(qsub -N "$1"potu -v name=$1 -W depend=afterok:$SECOND pick_otus_open.sh)
echo $THIRD
#
#remove chimeras
#
FOURTH=$(qsub -N "$1"chim -v name=$1 -W depend=afterok:$THIRD remove_chimeras.sh)
echo $FOURTH
#
#filter chimeras from alignment
#
#FIFTH=$(qsub -N "$1"chim -v name=$1 -W depend=afterok:$FOURTH filter_chimeras_alignment.sh)
#echo $FIFTH
#
#filter chimeras from otu table
#
#SIXTH=$(qsub -N "$1"chim -v name=$1 -W depend=afterok:$FIFTH filter_chimeras_otu_table.sh)
#echo $SIXTH
#
#Summarize taxa and draw plots
#
#SEVENTH=$(qsub -N "$1"sum_tax -v name=$1 -W depend=afterok:$SIXTH sum_taxa_plots.sh)
#echo $SEVENTH
