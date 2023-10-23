#!/usr/bin/bash

#Remove a directory and recreate a new one
rm -rf Comparison/Test_hypothesis
mkdir -p Comparison/Test_hypothesis

#Fold change two files and print results
file1=Average/average_WT_UI_24.txt
file2=Average/average_Clone1_UI_24.txt
paste "$file1" "$file2" | awk -F "\t" ' 
BEGIN{ OFS = "\t" }{
    if ($1 != 0) {
        foldchange = ($4 / $1);
        print $2, $3, foldchange;
    } else {
        print $2, $3, "N/A";
    }
}' > "Comparison/Test_hypothesis/WT&Clone1_IN_24_output"

file1=Average/average_WT_UI_48.txt
file2=Average/average_Clone1_UI_48.txt
paste "$file1" "$file2" | awk -F "\t" ' 
BEGIN{ OFS = "\t" }{
    if ($1 != 0) {
        foldchange = ($4 / $1);
        print $2, $3, foldchange;
    } else {
        print $2, $3, "N/A";
    }
}' > "Comparison/Test_hypothesis/WT&Clone1_IN_48_output"

file1=Average/average_WT_UI_24.txt
file2=Average/average_Clone2_UI_24.txt
paste "$file1" "$file2" | awk -F "\t" '
BEGIN{ OFS = "\t" }{
    if ($1 != 0) {
        foldchange = ($4 / $1);
        print $2, $3, foldchange;
    } else {
        print $2, $3, "N/A";
    }
}' > "Comparison/Test_hypothesis/WT&Clone2_IN_24_output"


file1=Average/average_WT_UI_48.txt
file2=Average/average_Clone2_UI_48.txt
paste "$file1" "$file2" | awk -F "\t" '
BEGIN{ OFS = "\t" }{
    if ($1 != 0) {
        foldchange = ($4 / $1);
        print $2, $3, foldchange;
    } else {
        print $2, $3, "N/A";
    }
}' > "Comparison/Test_hypothesis/WT&Clone2_IN_48_output"


