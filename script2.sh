#!/usr/bin/bash

#Set a directory covering .zip files
zipdir="fastq_check"
#Set a destination directory for unzipped contents
unzipdir="unzipped"

#Create the destination directory
rm -rf "unzipped"
mkdir -p "$unzipdir"

#Loop through each .zip file
for zipfile in "$zipdir"/*.zip; do
    # Unzip the file into the destination directory
    unzip -q "$zipfile" -d "$unzipdir"
done

#When completed "Unzipping complete!" will be displayed on the screen
echo "Unzipping complete!"

#Set a directory covering summary.txt files
summary_dir="unzipped"
#Set a destination directory for all summary files
all_summary="all_summary"

#Initialize a variable to store the total PASS count
> "$all_summary"

#Find all summary.txt files in "summary_dir" and read their contents
find "$summary_dir" -name "summary.txt" | while read -r file; do
    #Use awk to extract and count "PASS" in the column1
    count=$(awk '$1 == "PASS" { count++ } END { print count }' "$file")
    #Extract the base filename of the current files
    basename=$(basename "$file")
    #Change filename named based on the parent directory mame
    filename=$(basename "$(dirname "$file")")
    #generate results in the "all_summary" directory
   echo "File: $filename, PASS Count: $count" >> "$all_summary"
    
done

#When completed the sentences below will be displayed in the sreen
echo "Processing complete. Results saved in $all_summary"
