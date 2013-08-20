qiime_pipeline
==============

Set of bash scripts to run QIIME on our NGS cluster

Most of them are wrappers for the usual QIIME scripts, with the pipeline script running them in sequence.

Job ID's are pipeline stage number followed by an underscore and the analysis name, e.g. 3A_STRM13

1_ = Converting FASTQ file to FASTA and Quality file
2_ = Splitting libraries
3A_ = OTU picking workflow
3B_ = Trie pre-filter
3C_ = Usearch61 OTU picking
3D_ = UClust Ref OTU Picking
4_ = Taxonomy assignment
5_ = Sequence alignment
6_ = Tree building
7_ = Chimera identification
8_ = Filter chimeras from alignment
9_ = Filter chimeras from OTU table
10_ = Summarize taxa & draw plots
