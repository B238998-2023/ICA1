#!/usr/bin/bash

#Remove these file from the step below
rm -rf Tcongo_genome
#Copy files from a source directory to a destination directory
cp -r  /localdisk/data/BPSM/ICA1/Tcongo_genome .

#Build a Bowtie2 index for the reference genome
bowtie2-build Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz Tcongo_genome/genome_index
#Remove and recreat the "bowtie2" directory for storing the output files
rm -rf bowtie2
mkdir -p bowtie2

#Loop through Fastq files representing paired-end reads
for file in fastq/*_1.fq.gz ; do
        #Extract the base filename of the current files	
	filename1=$(basename $file)	
	#Change the filename from "__1.fq.gz" to "_2.fq.gz"
	filename2=${filename1/_1.fq.gz/_2.fq.gz}
	#Construct filenames for the second read and the output SAM file
	outname=${filename1/_1.fq.gz/.sam}
	#Use Bowtie2 to align the paired-end reads to the reference genome and save the alignment results in the "bowtie2" directory
	bowtie2 --threads 6 -x Tcongo_genome/genome_index -1 fastq/"$filename1"  -2 fastq/"$filename2" -S bowtie2/"$outname" 
done

#Remove these file from the step below
rm -rf Tcongo_genome_bed
mkdir -p Tcongo_genome_bed
rm -rf TriTrypDB-46_TcongolenseIL3000_2019.bed
#Copy files from a source directory to a destination directory
cp -r /localdisk/data/BPSM/ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed Tcongo_genome_bed

#Remove and recreat the "output" directories for storing the output files
rm -rf output1
mkdir -p output1
rm -rf output2
mkdir -p output2

#Loop through each SAM file in the "bowtie2" directory
for sam_file in bowtie2/*.sam; do
    #Extract the base filename of the current SAM files
    bam_file=$(basename $sam_file)
    #Change the filename from SAM files to BAM files
    bam_file=${bam_file/.sam/.bam}
    #Use samtools to convert the SAM file to BAM format and saves them in the "output1" directory
    samtools view -bS "$sam_file" > output1/"$bam_file"
    done

#Loop through each BAM file in the "output1" directory
for bam_file in output1/*.bam; do
    #Extract the basename of the current BAM file
    originname=$(basename $bam_file)
    #Change the filename for the sorted BAM file by replacing ".bam" with "_sorted.bam" in the basename
    sorted_bam_file="${originname/.bam/_sorted.bam}"
    #Use samtools to sort the BAM file and saves the sorted result in the "output2" directory
    samtools sort "$bam_file" -o output2/"$sorted_bam_file"
done
