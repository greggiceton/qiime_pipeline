#!/bin/sh

#Gregg Iceton
#
#PBS -M gregg@iceton.org
#PBS -m abe
#PBS -j oe
#PBS -e $HOME/qsub_error_files
#PBS -o $HOME/qsub_error_files
  $command
