#!/usr/bin/bash



rm -rf Tcongo_genome
cp -r  /localdisk/data/BPSM/ICA1/Tcongo_genome .
rm -rf genome_read
mkdir -p genome_read

bowtie2-build Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz Tcongo_genome/genome_index
rm -rf bowtie2
mkdir -p bowtie2

for file in fastq/*_1.fq.gz ; do	
	filename1=$(basename $file)	
	filename2=${filename1/_1.fq.gz/_2.fq.gz}
	outname=${filename1/_1.fq.gz/.sam}
	bowtie2 --threads 6 -x Tcongo_genome/genome_index -1 fastq/"$filename1"  -2 fastq/"$filename2" -S bowtie2/"$outname" 
done
rm -rf Tcongo_genome_bed
mkdir -p Tcongo_genome_bed
rm -rf TriTrypDB-46_TcongolenseIL3000_2019.bed
cp -r /localdisk/data/BPSM/ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed Tcongo_genome_bed

rm -rf output1
mkdir -p output1
rm -rf output2
mkdir -p output2

for sam_file in bowtie2/*.sam; do
    bam_file=$(basename $sam_file)
    bam_file=${bam_file/.sam/.bam}
    samtools view -bS "$sam_file" > output1/"$bam_file"
    done

for bam_file in output1/*.bam; do
    originname=$(basename $bam_file)
    sorted_bam_file="${originname/.bam/_sorted.bam}"
    samtools sort "$bam_file" -o output2/"$sorted_bam_file"
done
