#!/usr/bin/bash

#Define a "bed_file" variable and assign a value that is the path to a BED file
bed_file="Tcongo_genome_bed/TriTrypDB-46_TcongolenseIL3000_2019.bed"

#Create a directory to store the counts results
rm -rf couts_data
mkdir -p counts_data

#Loop through all "sorted.bam" files
for bam_file in output2/*_sorted.bam; do
    #Extract the base filename of the current BAM file
    sample_name=$(basename $bam_file)
    #Change the filename from "_sorted.bam" to "_counts.txt"
    counts_name=${sample_name/_sorted.bam/_counts.txt}
    #Use bedtools coverage statistics for each BAM file and store in the "counts_data" directory using countsname
    bedtools coverage -a "$bed_file" -b "$bam_file" > "counts_data/${counts_name}"
done
