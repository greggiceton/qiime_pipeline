#!/bin/sh

#Gregg Iceton
#
#PBS -M gregg@iceton.org
#PBS -m abe
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
	split_libraries.py -m $HOME/$name/"$name"map.txt -f $HOME/$name/$name.fna -l 100 -M 100 -b 10 -o $HOME/$name/split_out

