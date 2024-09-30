

# Hw 5

I selected the E.coli K12 strain for this assignment. 

## Download the E. coli genome from NCBI, unzip it, and link it to ecoli.fa
```
datasets download genome accession GCF_000005845.2
unzip -o ncbi_datset.zip
ln -sf ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna ecoli.fa
```

## Stats of genome file
```
seqkit stat ecoli.fa
```

Output:
```
seqkit stat ecoli.fa
file      format  type  num_seqs    sum_len    min_len    avg_len    max_len
ecoli.fa  FASTA   DNA          1  4,641,652  4,641,652  4,641,652  4,641,652
```


## The size of the file
```
echo "Size of File: $(du -h ecoli.fa | cut -f1)"
``` 
Output 
```
4.5M
```


## The total number of nucleotides in the genome
```
echo "Total number of nucleotides: $(grep -v '>' ecoli.fa | wc -c)"
```

Output 
```
4699673
```

## The number of chromosomes in the genome
```
echo "Number of chromosomes: $(grep -c '>' ecoli.fa)"
```
Output
```
1
```

## The name and Id of the chromosome
```
grep '>' ecoli.fa | cut -d ' ' -f1,2
```
Output
```
NC_000913.3 Escherichia
```

# Part 2: Generate a simulated FASTQ output for a sequencing instrument of your choice. Set the parameters so that your target coverage is 10x.

How many reads have you generated?

    500,886

What is the average read length?

    100 bp (as it was specified)    

How big are the FASTQ files?

    50,088,600 bases


Compress the files and report how much space that saves.

Uncompressed file size: ~95.5 M

Compressed file size: 23 M each. Thus around 52% space was saved.


How much data would be generated when covering the Yeast, the Drosophila or the Human genome at 30x?
!![alt text](<Screenshot 2024-09-29 at 11.06.26 PM-2.png>)

​ Around 28.26 Gb

## Download the ecoli genome from ensembl
```
wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-59/fasta/bacteria_26_collection/escherichia_coli_w_gca_000184185/dna/Escherichia_coli_w_gca_000184185.ASM18418v1.dna.toplevel.fa.gz
```
```
gunzip Escherichia_coli_w_gca_000184185.ASM18418v1.dna.toplevel.fa.gz
```
## Create a symbolic link to the genome file
```
ln -sf Escherichia_coli_w_gca_000184185.ASM18418v1.dna.toplevel.fa ecoli.fa
```

## Index the fasta file
```
samtools faidx ecoli.fa
Fai-file = ecoli.fa.fai
cat ecoli.fa.fai
```
Output
```
Chromosome	4900968	88	60	61
pRK1	102536	4982814	60	61
pRK2	5360	5087132	60	61
```

## Check the file size of the genome file
```
total_genome_size=$(awk '{sum+=$2} END {print sum}' ecoli.fa.fai)
echo "total genome size: $total_genome_size"
```
Output
```
total genome size: 5008864
```

## Stimulate the reads with wgsim
genome = ecoli.fa
expected_coverage = 10
read_length = 100

## Calculate the number of reads to using bc for arithmatic operations
```
N=$(echo "10 * 5008864/ 100" | bc)
echo "Number of reads to simulate: $N"
```
# The files to write the reads to
```
R1="simreads/wgsim_read1.fq"
R2="simreads/wgsim_read2.fq"
```

# Make a new directory  and set the path to the directory
```
mkdir -p $(dirname simreads/wgsim_read1.fq)
```
# Simulate reads with wgsim with no errors and uniform base quality
```
wgsim -N 500886 -1 100 -2 100 -e 0 -r 0 -R 0 -X 0 ecoli.fa simreads/wgsim_read1.fq simreads/wgsim_read2.fq
```
Output
```
[wgsim] seed = 1727661207
[wgsim_core] calculating the total length of the reference sequence...
[wgsim_core] 3 sequences, total length: 5008864
```
```
seqkit stat simreads/wgsim_read1.fq simreads/wgsim_read2.fq
```
Output
```
processed files:  2 / 2 [======================================] ETA: 0s. done
file                     format  type  num_seqs     sum_len  min_len  avg_len  max_len
simreads/wgsim_read1.fq  FASTQ   DNA    500,886  50,088,600      100      100      100
simreads/wgsim_read2.fq  FASTQ   DNA    500,886  50,088,600      100      100      100
``` 

## determine the size of compressed file
```
$ ls -lh simreads/wgsim_read1.fq.gz simreads/wgsim_read2.fq.gz
```
Output
```
-rw-r--r--  1 srijanaadhikari  staff    23M Sep 29 21:53 simreads/wgsim_read1.fq.gz
-rw-r--r--  1 srijanaadhikari  staff    23M Sep 29 21:53 simreads/wgsim_read2.fq.gz
```

