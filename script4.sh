#!/usr/bin/bash
bed_file="Tcongo_genome_bed/TriTrypDB-46_TcongolenseIL3000_2019.bed"

# Create a directory to store the counts results
rm -rf couts_data
mkdir -p counts_data

# Loop through all your sorted BAM files
for bam_file in output2/*_sorted.bam; do
    # Extract the sample name from the BAM file name (assuming the file names are in a specific format)
    sample_name=$(basename $bam_file)
    counts_name=${sample_name/_sorted.bam/_counts.txt}
    # Run bedtools coverage for each BAM file
    bedtools coverage -a "$bed_file" -b "$bam_file" > "counts_data/${counts_name}"
done
