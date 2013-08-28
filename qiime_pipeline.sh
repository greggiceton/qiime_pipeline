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
#Set paths for torque output files
output_path=$HOME/qsub_error_files
#
#Check that $1 isn't empty
if [[ -z "$1" ]]; then
	echo -e "Error - you must enter a name for the analysis at the end of the command e.g.\"qiime_pipeline gregg13\""
	exit
fi
#
if [ "${#1}" -ge "8" ]; then
	echo -e "Error - analysis name must be no more than 7 characters\n"
	exit
fi
#
if [ ! -f $HOME/$1/"$1".fastq ]; then
	echo -e "FastQ file not found in $HOME/$1\n"
	exit
fi
#Generate qiime parameters file to include name in job
(cat /share/apps/qiime/qiime_prefs.txt ; echo -e "parallel_pick_otus_trie:job_prefix\t3B_"$1"\nparallel_pick_otus_usearch61_ref:job_prefix\t3C_"$1"\nparallel_pick_otus_uclust_ref:job_prefix\t3D_"$1"\nparallel_assign_taxonomy_rdp:job_prefix\t4_"$1"\nparallel_align_seqs_pynast:job_prefix\t5_"$1"") > $HOME/$1/"$1"_qiime_params.txt
#
#Convert the fastq file to fasta and qual
#
FIRST=$(qsub -N "1_$1" -e $output_path -o $output_path -v name=$1 /share/apps/qiime_pipeline/convert_fastq.sh)
echo $FIRST
#
#Split the libraries according to the mapping file
#
SECOND=$(qsub -N "2_$1" -e $output_path -o $output_path  -v name=$1 -W depend=afterok:$FIRST /share/apps/qiime_pipeline/split_lib.sh)
echo $SECOND
#
#Pick OTUs using open reference (first compare to Greengenes, then de novo),
#align sequences, build tree, assign taxonomy
#
THIRD=$(qsub -N "3_$1"  -e $output_path -o $output_path -v name=$1 -W depend=afterok:$SECOND /share/apps/qiime_pipeline/pick_otus_open.sh)
echo $THIRD
#
#remove chimeras
#
FOURTH=$(qsub -N "7_$1" -e $output_path -o $output_path  -v name=$1 -W depend=afterok:$THIRD /share/apps/qiime_pipeline/identify_chimeras.sh)
echo $FOURTH
#
#filter chimeras from alignment
#
FIFTH=$(qsub -N "8_$1" -e $output_path -o $output_path  -v name=$1 -W depend=afterok:$FOURTH /share/apps/qiime_pipeline/filter_chimeras_alignment.sh)
echo $FIFTH
#
#filter chimeras from otu table
#
SIXTH=$(qsub -N "9_$1" -e $output_path -o $output_path  -v name=$1 -W depend=afterok:$FIFTH /share/apps/qiime_pipeline/filter_chimeras_otu_table.sh)
echo $SIXTH
#
SEVENTH=$(qsub -N "10_$1" -e $output_path -o $output_path  -v name=$1 -W depend=afterok:$SIXTH /share/apps/qiime_pipeline/rebuild_tree.sh)
echo $SEVENTH
