

This is a markdwon report of Makefile. The steps here metniones are about downloading the genome, stimulating the reads, trimming and generating the FastQc reports. 


The tools and data used are as follow:
### Genome URL: Escherichia coli Genome from Ensembl Bacteria
### SRA Accession: SRR1573606

##Tools##
 
`wgsim` : Read simulation.
`fastp` : Trimming the reads.
`FastQC`:Quality control.


## Downloading the genome: 
The genome was downloaded from the Ensembl Bacteria FTP server and unzipped for further processing.

```
make genome
```

Output:
```
Genome file: Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa
```

## Simulating the Reads:
Simulated reads were generated using wgsim. The reads were then compressed using gzip.
```
make simulate_genome
```
Output:
```
Simulated reads: simulated_reads_1.fastq.gz
```

## Downloading SRA Data:
Reads were downloaded from the SRA using fastq-dump and analyzed for quality using FastQC.
```
make fastq_trim
```

Output:
```
 SRR1573606_1.fastq
 ```
FastQC report: Saved in fastqc directory

## Trimming Reads:
Raw reads were trimmed using fastp.This step will cut low quality regions from the reads. The trimmed reads were again analyzed with FastQC.
```
make fastq_trim
```
Output:
```
Trimmed reads: SRR1573606.trim.fastq
```
FastQC reports saved in fastqc directory.

## Quality Control of trimmed reads:
The quality of the trimmed reads were improved using FastQC.
```
make fastqc
```
Output:
```
FastQC reports: SRR1573606.trim.fastq
```
