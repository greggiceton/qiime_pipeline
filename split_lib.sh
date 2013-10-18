#!/bin/sh

#Gregg Iceton
#
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
	split_libraries.py -m $HOME/$name/"$name"map.txt -f $HOME/$name/$name.fna -q $HOME/$name/$name.qual -s $qual -l 100 -M 100 -b $barcode -o $HOME/$name/split_out

