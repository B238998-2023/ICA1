#!/usr/bin/bash

#Remove the "fastq" directory and its contents
rm -rf fastq
#Copy files from a source directory to a destination directory
cp -r  /localdisk/data/BPSM/ICA1/fastq ~/ICA1 .
#Remove and recreate a file named fastq_check
rm -rf fastq_check
mkdir -p fastq_check

#Loop though "fq.gz" files to run FastQC
for file in fastq/*fq.gz ; do
	#Output files into the "fastq_check" directory
	fastqc $file -o fastq_check
done

#When done show the "Successful!" in the screen
echo "Successful!"
