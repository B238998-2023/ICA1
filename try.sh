#!/usr/bin/bash


rm -rf group
mkdir -p group


while read -r line;do
    Name=$(echo "$line" | awk -F'\t' '{print$1}')
    Time=$(echo "$line" | awk -F'\t' '{print$4}')
    Type=$(echo "$line" | awk -F'\t' '{print$2}')
    Treatment=$(echo "$line" | awk -F'\t' '{print$5}')
    Num=${Name/Tco/}

#echo   $Num $Time $Type $Treatment $Name

#1	WT_UI_0
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
