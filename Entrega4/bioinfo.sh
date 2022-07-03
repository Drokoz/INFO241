#!/bin/bash
dir_reads=$1
fastafile=$2

#sudo apt install boxes
#Creacion de directorios
mkdir -p DNAref # para almacenar el DNA de referencia
mkdir -p FastQC_RawData # para guardar los resultados de calidad de los reads crudos
mkdir -p TrimReads # para almacenar los reads podados
mkdir -p FastQC_TrimData # para guardar los resultados de calidad de los reads podados
mkdir -p Align # para almacenar los resultados del alineamiento
mkdir -p VarCall # para almacenar las variantes llamadas

# #Obtener reads
# file=`cat $dir_reads/lista_fastq.txt |  tr -d '\r'` 
# cd $dir_reads
# echo "FastQC a los datos crudos" | boxes
# for line in $file
#     do
#         response=`find $line`

#         fastqc $response -q -o "../FastQC_RawData/"
#     done
# cd ..

echo "Descomprimiendo archivos FastQC Crudos" | boxes
cd FastQC_RawData
mkdir -p unzip
for file in $(ls $(find . -name "*.zip"))
    do
        unzip -q $file -d ./unzip
    done
cd ..

echo "Trimming archivos FastQC Crudos" | boxes
cd FastQC_RawData/unzip
count=0
for file in $(ls $(find . -name "*.fastqc"))
    do
        arr=(${file//./ })
        nombre1=${arr[0]}
        if [[ count -eq 1 ]]; then
            if [[ $nombre1=~"${arr[0]}" ]]; then
                echo $nombre1=="${arr[0]}"  
            fi
        fi
        count=1

    done
cd ..


#trimmomatic PE RawReads/S5R1.fq RawReads/S5R2.fq TrimReads/p_S5R1.fq TrimReads/u_S5R1.fq TrimReads/p_S5R2.fq TrimReads/u_S5R2.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:20
#trimmomatic PE RawReads/S2R1.fq RawReads/S2R2.fq TrimReads/p_S2R1.fq TrimReads/u_S2R1.fq TrimReads/p_S2R2.fq TrimReads/u_S2R2.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:20