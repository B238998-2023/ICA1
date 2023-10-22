#!/usr/bin/bash

#Remove the "group" file and create a new one
rm -rf group
mkdir -p group

#Use a loop to read the certain the word to output certain clumn
while read -r line;do
    Name=$(echo "$line" | awk -F'\t' '{print$1}')
    Time=$(echo "$line" | awk -F'\t' '{print$4}')
    Type=$(echo "$line" | awk -F'\t' '{print$2}')
    Treatment=$(echo "$line" | awk -F'\t' '{print$5}')
    Num=${Name/Tco/}

#echo   $Num $Time $Type $Treatment $Name # Check

#Use many "if" commond to divide into 15 groups according to three variables
#1      WT_UI_0  
if [[ "$Type" == "WT" && "$Time" == "0" && "$Treatment" == "Uninduced" ]]; then 
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_WT_UI_0.txt
        
fi
#2      WT_UI_24
if [[ "$Type" == "WT" && "$Time" == "24" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_WT_UI_24.txt
fi

#3      WT_UI_48
if [[ "$Type" == "WT" && "$Time" == "48" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_WT_UI_48.txt
fi

#4      Clone1_UI_0
if [[ "$Type" == "Clone1" && "$Time" == "0" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_UI_0.txt
fi

#5     Clone1_UI_24
if [[ "$Type" == "Clone1" && "$Time" == "24" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_UI_24.txt
fi

#6      Clone1_UI_48
if [[ "$Type" == "Clone1" && "$Time" == "48" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_UI_48.txt
fi

#7      Clone2_UI_0
if [[ "$Type" == "Clone2" && "$Time" == "0" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_UI_0.txt
fi

#8      Clone2_UI_24
if [[ "$Type" == "Clone2" && "$Time" == "24" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_UI_24.txt
fi

#9      Clone2_UI_48
if [[ "$Type" == "Clone2" && "$Time" == "48" && "$Treatment" == "Uninduced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_UI_48.txt
fi

#10     Clone1_IN_0
if [[ "$Type" == "Clone1" && "$Time" == "0" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_IN_0.txt
fi

#11     Clone1_IN_24
if [[ "$Type" == "Clone1" && "$Time" == "24" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_IN_24.txt
fi

#12     Clone1_IN_48
if [[ "$Type" == "Clone1" && "$Time" == "48" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone1_IN_48.txt
fi

#13     Clone2_IN_0
if [[ "$Type" == "Clone2" && "$Time" == "0" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_IN_0.txt
fi

#14     Clone2_IN_24
if [[ "$Type" == "Clone2" && "$Time" == "24" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_IN_24.txt
fi

#15     Clone2_IN_48
if [[ "$Type" == "Clone2" && "$Time" == "48" && "$Treatment" == "Induced" ]]; then
        cp counts_data/Tco-"$Num"_counts.txt group/Tco-"$Num"_Clone2_IN_48.txt
fi

done < fastq/Tco2.fqfiles

#Remove the "Average" dirctory and create a new one
rm -rf Average
mkdir -p Average

#Loop through all files from the "group" dir and run 13 times in different situation
#1 WT_UI_0
for file in group/*_WT_UI_0.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_WT_UI_0.txt
paste group/*_WT_UI_0_col6.txt > Average/combined_WT_UI_0.txt
rm -rf Average/merged_WT_UI_0.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_WT_UI_0.txt > Average/merged_WT_UI_0.txt
rm -rf Average/average_WT_UI_0.txt
paste Average/merged_WT_UI_0.txt <(cut -f4 group/Tco-160_WT_UI_0.txt) <(cut -f5 group/Tco-160_WT_UI_0.txt) > Average/average_WT_UI_0.txt

#2 WT_UI_24
for file in group/*_WT_UI_24.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_WT_UI_24.txt
paste group/*_WT_UI_24_col6.txt > Average/combined_WT_UI_24.txt
rm -rf Average/merged_WT_UI_24.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_WT_UI_24.txt > Average/merged_WT_UI_24.txt
rm -rf Average/average_WT_UI_24.txt
paste Average/merged_WT_UI_24.txt <(cut -f4 group/Tco-229_WT_UI_24.txt) <(cut -f5 group/Tco-229_WT_UI_24.txt) > Average/average_WT_UI_24.txt


#3 WT_UI_48
for file in group/*_WT_UI_48.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_WT_UI_48.txt
paste group/*_WT_UI_48_col6.txt > Average/combined_WT_UI_48.txt
rm -rf Average/merged_WT_UI_48.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_WT_UI_48.txt > Average/merged_WT_UI_48.txt
rm -rf Average/average_WT_UI_48.txt
paste Average/merged_WT_UI_48.txt <(cut -f4 group/Tco-17_WT_UI_48.txt) <(cut -f5 group/Tco-17_WT_UI_48.txt) > Average/average_WT_UI_48.txt


#4 Clone1_UI_0
for file in group/*_Clone1_UI_0.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_UI_0.txt
paste group/*_Clone1_UI_0_col6.txt > Average/combined_Clone1_UI_0.txt
rm -rf Average/merged_WClone1_UI_0.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_UI_0.txt > Average/merged_Clone1_UI_0.txt
rm -rf Average/average_Clone1_UI_0.txt
paste Average/merged_Clone1_UI_0.txt <(cut -f4 group/Tco-486_Clone1_UI_0.txt) <(cut -f5 group/Tco-486_Clone1_UI_0.txt) > Average/average_Clone1_UI_0.txt


#4 Clone1_UI_0
for file in group/*_Clone1_UI_0.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_UI_0.txt
paste group/*_Clone1_UI_0_col6.txt > Average/combined_Clone1_UI_0.txt
rm -rf Average/merged_WClone1_UI_0.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_UI_0.txt > Average/merged_Clone1_UI_0.txt
rm -rf Average/average_Clone1_UI_0.txt
paste Average/merged_Clone1_UI_0.txt <(cut -f4 group/Tco-486_Clone1_UI_0.txt) <(cut -f5 group/Tco-486_Clone1_UI_0.txt) > Average/average_Clone1_UI_0.txt


#5 Clone1_UI_24
for file in group/*_Clone1_UI_24.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_UI_24.txt
paste group/*_Clone1_UI_24_col6.txt > Average/combined_Clone1_UI_24.txt
rm -rf Average/merged_Clone1_UI_24.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_UI_24.txt > Average/merged_Clone1_UI_24.txt
rm -rf Average/average_Clone1_UI_24.txt
paste Average/merged_Clone1_UI_24.txt <(cut -f4 group/Tco-859_Clone1_UI_24.txt) <(cut -f5 group/Tco-859_Clone1_UI_24.txt) > Average/average_Clone1_UI_24.txt


#6 Clone1_UI_48
for file in group/*_Clone1_UI_48.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_UI_48.txt
paste group/*_Clone1_UI_48_col6.txt > Average/combined_Clone1_UI_48.txt
rm -rf Average/merged_Clone1_UI_48.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_UI_48.txt > Average/merged_Clone1_UI_48.txt
rm -rf Average/average_Clone1_UI_48.txt
paste Average/merged_Clone1_UI_48.txt <(cut -f4 group/Tco-999_Clone1_UI_48.txt) <(cut -f5 group/Tco-999_Clone1_UI_48.txt) > Average/average_Clone1_UI_48.txt


#7 Clone1_IN_24
for file in group/*_Clone1_IN_24.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_IN_24.txt
paste group/*Clone1_IN_24_col6.txt > Average/combined_Clone1_IN_24.txt
rm -rf Average/merged_Clone1_IN_24.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_IN_24.txt > Average/merged_Clone1_IN_24.txt
rm -rf Average/average_Clone1_IN_24.txt
paste Average/merged_Clone1_IN_24.txt <(cut -f4 group/Tco-613_Clone1_IN_24.txt) <(cut -f5 group/Tco-613_Clone1_IN_24.txt) > Average/average_Clone1_IN_24.txt


#8 Clone1_IN_48
for file in group/*_Clone1_IN_48.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone1_IN_48.txt
paste group/*_Clone1_IN_48_col6.txt > Average/combined_Clone1_IN_48.txt
rm -rf Average/merged_Clone1_IN_48.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone1_IN_48.txt > Average/merged_Clone1_IN_48.txt
rm -rf Average/average_Clone1_IN_48.txt
paste Average/merged_Clone1_IN_48.txt <(cut -f4 group/Tco-28_Clone1_IN_48.txt) <(cut -f5 group/Tco-28_Clone1_IN_48.txt) > Average/average_Clone1_IN_48.txt


#9 Clone2_UI_0
for file in group/*_Clone2_UI_0.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone2_UI_0.txt
paste group/*_Clone2_UI_0_col6.txt > Average/combined_Clone2_UI_0.txt
rm -rf Average/merged_Clone2_UI_0.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone2_UI_0.txt > Average/merged_Clone2_UI_0.txt
rm -rf Average/average_Clone2_UI_0.txt
paste Average/merged_Clone1_UI_0.txt <(cut -f4 group/Tco-290_Clone2_UI_0.txt) <(cut -f5 group/Tco-290_Clone2_UI_0.txt) > Average/average_Clone2_UI_0.txt


#10 Clone2_UI_24
for file in group/*_Clone2_UI_24.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone2_UI_24.txt
paste group/*_Clone2_UI_24_col6.txt > Average/combined_Clone2_UI_24.txt
rm -rf Average/merged_Clone2_UI_24.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone2_UI_24.txt > Average/merged_Clone2_UI_24.txt
rm -rf Average/average_Clone2_UI_24.txt
paste Average/merged_Clone2_UI_24.txt <(cut -f4 group/Tco-392_Clone2_UI_24.txt) <(cut -f5 group/Tco-392_Clone2_UI_24.txt) > Average/average_Clone2_UI_24.txt


#11 Clone2_UI_48
for file in group/*_Clone2_UI_48.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone2_UI_48.txt
paste group/*_Clone2_UI_48_col6.txt > Average/combined_Clone2_UI_48.txt
rm -rf Average/merged_Clone2_UI_48.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone2_UI_48.txt > Average/merged_Clone2_UI_48.txt
rm -rf Average/average_Clone2_UI_48.txt
paste Average/merged_Clone2_UI_48.txt <(cut -f4 group/Tco-483_Clone2_UI_48.txt) <(cut -f5 group/Tco-483_Clone2_UI_48.txt) > Average/average_Clone2_UI_48.txt

#12 Clone2_IN_24
for file in group/*_Clone2_IN_24.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone2_IN_24.txt
paste group/*_Clone2_IN_24_col6.txt > Average/combined_Clone2_IN_24.txt
rm -rf Average/merged_Clone2_IN_24.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone2_IN_24.txt > Average/merged_Clone2_IN_24.txt
rm -rf Average/average_Clone2_IN_24.txt
paste Average/merged_Clone2_IN_24.txt <(cut -f4 group/Tco-503_Clone2_IN_24.txt) <(cut -f5 group/Tco-503_Clone2_IN_24.txt) > Average/average_Clone2_IN_24.txt


#13 Clone2_IN_48
for file in group/*_Clone2_IN_48.txt; do
    cut -f6 "$file" > "${file%.*}_col6.txt"
done
rm -rf Average/combined_Clone2_IN_48.txt
paste group/*_Clone2_IN_48_col6.txt > Average/combined_Clone2_IN_48.txt
rm -rf Average/merged_Clone2_IN_48.txt
awk '{sum = 0; for (i = 1; i <= NF; i++) sum += $i; avg = sum / NF; print $0 "\t" avg}' Average/combined_Clone2_IN_48.txt > Average/merged_Clone2_IN_48.txt
rm -rf Average/average_Clone2_IN_48.txt
paste Average/merged_Clone2_IN_48.txt <(cut -f4 group/Tco-582_Clone2_IN_48.txt) <(cut -f5 group/Tco-582_Clone2_IN_48.txt) > Average/average_Clone2_IN_48.txt

#Extract the last three columns of the file prefixed with average and overwrite it into the original file
for file in Average/average* ;do
        awk -F '\t' '{print $(NF-2) "\t" $(NF-1) "\t" $NF}' $file > $file.tmp
        mv $file.tmp $file
done
