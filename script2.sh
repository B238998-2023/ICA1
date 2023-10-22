#!/usr/bin/bash

# Set the source directory where .zip files are located
zipdir="fastq_check"

# Set the destination directory for unzipped contents
unzipdir="unzipped"

# Ensure the destination directory exists
rm -rf "unzipped"
mkdir -p "$unzipdir"

# Loop through each .zip file in the source directory
for zipfile in "$zipdir"/*.zip; do
    # Unzip the file into the destination directory
    unzip -q "$zipfile" -d "$unzipdir"
done

echo "Unzipping complete!"

# Set the root directory where summary.txt files are located
summary_dir="unzipped"
all_summary="all_summary"

# Initialize a variable to store the total PASS count
> "$all_summary"

# Use the find command to locate all summary.txt files
find "$summary_dir" -name "summary.txt" | while read -r file; do
    # Use awk to extract and count "PASS" in the first column
    count=$(awk '$1 == "PASS" { count++ } END { print count }' "$file")
    basename=$(basename "$file")
    filename=$(basename "$(dirname "$file")")
    #Output the result for each file
   echo "File: $filename, PASS Count: $count" >> "$all_summary"
    
done


echo "Processing complete. Results saved in $all_summary"
