#!/bin/sh
echo -e "\nPlease enter the analysis directory name\n"
read name
print_biom_table_summary.py -i $HOME/$name/otus/otu_table_non_chimeric.biom
echo -e "\nPlease review the above output and decide on sampling depth (minimum number of reads to use)\n"
read depth
head -n 1 $HOME/$name/"$name"map.txt
echo -e "\nPlease review the above categories and enter a comma separated list of those which you wish to compare\n"
read cat
RUN=$(qsub -N "12_$name" -v name=$name depth=$depth cat=$cat /share/apps/qiime_pipeline/core_diversity.sh)
echo $RUN
