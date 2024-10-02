 Set the URL
URL=https://ftp.ensembl.org/pub/release-112/gff3/salmo_salar/Salmo_salar.Ssal_v3.1.112.abinitio.gff3.gz

# Extract the file name from the URL
File=$(basename ${Salmo_salar.Ssal_v3.1.112.abinitio.gff3.gz})

#---------Nothing needs to be changedd below this line---------

# Download the GFF3 file
wget ${URL}

# Unzip the GFF3 file
gunzip ${File}

# Extract the clean file named cleam.gff3
cat ${File} | grep -v "#" > clean.gff3

# Extract the gene features from the GFF3 file
cat ${File} | grep -v "#" | awk '$3 == "gene"' > genes.gff3

# Extract the CDS features from the GFF3 file
cat ${File} | grep -v "#" | awk '$3 == "CDS"' > cds.gff3

# Extract the exon features from the GFF3 file
cat ${File} | grep -v "#" | awk '$3 == "exon"' > exon.gff3

# Extract the mRNA features from the GFF3 file
cat ${File} | grep -v "#" | awk '$3 == "mRNA"' > mRNA.gff3

# Count the number of CDS features
cat genes.gff3 | wc -l

# Count the number of gene features
cat cds.gff3 | wc -l

# Count the number of exon features
cat exon.gff3 | wc -l

# Count the number of mRNA features
cat mRNA.gff3 | wc -l
