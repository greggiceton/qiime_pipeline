#!/bin/sh

#Gregg Iceton
#
#PBS -j oe
#PBS -e $HOME/qsub_error_files
#PBS -o $HOME/qsub_error_files
echo "test $cat $name $depth"
if [ -z $cat ]; then
	core_diversity_analyses.py -i $HOME/$name/otus/otu_table_non_chimeric.biom -o $HOME/$name/core_diversity -m $HOME/$name/"$name"map.txt -p $HOME/$name/"$name"_qiime_params.txt -a -t $HOME/$name/otus/non_chimeric.tre -e $depth
	else 
	core_diversity_analyses.py -i $HOME/$name/otus/otu_table_non_chimeric.biom -o $HOME/$name/core_diversity -m $HOME/$name/"$name"map.txt -p $HOME/$name/"$name"_qiime_params.txt -a -t $HOME/$name/otus/non_chimeric.tre -e $depth -c $cat
fi
