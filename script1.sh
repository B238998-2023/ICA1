#!/usr/bin/bash



rm -rf fastq
cp -r  /localdisk/data/BPSM/ICA1/fastq ~/ICA1 .
rm -rf fastq_check
mkdir -p fastq_check

for file in fastq/*fq.gz ; do
	fastqc $file -o fastq_check
done

echo "Successful!"
