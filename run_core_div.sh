#!/bash


print_biom_table_summary.py -i $HOME/$1/otus/otu_table_non_chimeric.biom
echo -e "\nPlease review the above output and decide on sampling depth (minimum number of reads to use)\n"
read depth
head -n 1 $HOME/$name/"$name"map.txt
echo -e "\nPlease review the above categories and enter a comma separated list of those which you wish to compare\n"
read cat
qsub -N "12_$1" -v name=$1 depth=$depth cat=$cat /share/apps/qiime_pipeline/convert_fastq.sh
