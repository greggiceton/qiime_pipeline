
#!/bin/sh

#Gregg Iceton
#
#PBS -M gregg@iceton.org
#PBS -m abe
#PBS -j oe
#PBS -o $HOME/qsub_error_files
#PBS -e $HOME/qsub_error_files
#
	 pick_open_reference_otus.py -i $HOME/"$name"/split_out/seqs.fna -p $HOME/$name/"$name"_qiime_params.txt -o $HOME/$name/otus -a -r /share/apps/qiime/gg/rep_set/97_otus.fasta
