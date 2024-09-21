**Organism: E.Coli k-12 strain.
RefSeq:GCF_000005845.2**

### Summary of data sets were visualised using code
```
datasets summary genome accession GCF_000005845.2
```
```
datasets summary genome accession GCF_000005845.2 |jq
```

### Genomic datasets were downloaded using the code 
```
datasets download genome accession GCF_000005845.2
```
```
unzip ncbi_dataset.zip
```
```
cat ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna | head
```
Output
```
NC_000913.3 Escherichia coli str. K-12 substr. MG1655, complete genome
AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGCTTCTGAACTG
GTTACCTGCCGTGAGTAAATTAAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGAC
AGATAAAAATTACAGAGTACACAACATCCATGAAACGCATTAGCACCACCATTACCACCACCATCACCATTACCACAGGT
AACGGTGCGGGCTGACGCGTACAGGAAACACAGAAAAAAGCCCGCACCTGACAGTGCGGGCTTTTTTTTTCGACCAAAGG
TAACGAGGTAACAACCATGCGAGTGTTGAAGTTCGGCGGTACATCAGTGGCAAATGCAGAACGTTTTCTGCGTGTTGCCG
ATATTCTGGAAAGCAATGCCAGGCAGGGGCAGGTGGCCACCGTCCTCTCTGCCCCCGCCAAAATCACCAACCACCTGGTG
GCGATGATTGAAAAAACCATTAGCGGCCAGGATGCTTTACCCAATATCAGCGATGCCGAACGTATTTTTGCCGAACTTTT
GACGGGACTCGCCGCCGCCCAGCCGGGGTTCCCGCTGGCGCAATTGAAAACTTTCGTCGATCAGGAATTTGCCCAAATAA
AACATGTCCTGCATGGCATTAGTTTGTTGGGGCAGTGCCCGGATAGCATCAACGCTGCGCTGATTTGCCGTGGCGAGAAA
```

### datasets having CDS,protein,RNA and Genome was downloaded
```
datasets download genome accession GCF_000005845.2 --include gff3,cds,protein,rna,genome
```


##### unzip datasets by using code
```
  unzip ncbi_dataset.zip
```
### code that get detailed information about the types of features present in the datasets. 
```
  cat ncbi_dataset/data/GCF_000005845.2/genomic.gff 
```

The data sets has gene CDS, exon, rRNA, ncRNA, and tRNA.

### code to display genes only
  ```
  cat ncbi_dataset/data/GCF_000005845.2/genomic.gff | awk '$3=="gene" {print $0}'
```

### code to move data that is explicitly stated gene onto a new file named as gene.gff and CDS to CDS>GFF file by using the following code
```
cat ncbi_dataset/data/GCF_000005845.2/genomic.gff |awk '$3=="gene" { print $0 }' > ncbi_dataset/data/GCF_000005845.2/gene.gff
```
```
cat ncbi_dataset/data/GCF_000005845.2/genomic.gff |awk '$3=="CDS" { print $0 }' > ncbi_dataset/data/GCF_000005845.2/CDS.gff
``` 


### Analysing datasets in IGV

The genome sequence is 4,641 kbp long. The maximum zoom lets us visualize 49 bp at a time. When comparing the gene and CDS sequences, they align quite well. The start codon, methionine, matches exactly with the start of both the gene and CDS. Similarly, the stop codon is consistent in both sequences, with the CDS and gene ending simultaneously. This strain appears to be well-aligned in terms of gene and CDS sequences.

! [<img width="1177" alt="Screenshot 2024-09-15 at 9 35 54 PM" src="https://github.com/user-attachments/assets/9a62b906-e57b-4765-a4ef-09ab93d0fb7f">] 


! [<img width="1167" alt="Screenshot 2024-09-15 at 9 36 09 PM" src="https://github.com/user-attachments/assets/efe96aa0-3467-48e0-84bb-7416d861a92d">]



