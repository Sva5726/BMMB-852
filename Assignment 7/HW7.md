

This is a markdwon report of Makefile. The steps here metniones are about downloading the genome, stimulating the reads, trimming and generating the FastQc reports. 


The tools and data used are as follow:
### Genome URL: Escherichia coli Genome
### SRA Accession: SRR1573606

Tools
:
wgsim : Read simulation

Trimmomatic :  Read trimming

FastQC  : Quality control


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
Simulated reads were generated using wgsim. The reads were then compressed.
```
make simulate
```
Output:
```
Simulated reads: sim_read_1.fastq.gz
```

## Downloading SRA Data:
Reads were downloaded from the SRA using fastq-dump and analyzed for quality using FastQC.
```
make download
```

Output:
```
 SRR1573606_1.fastq
 ```
FastQC report: Saved in qcreports

## Trimming Reads:
Raw reads were trimmed using Trimmomatic with specific adapter clipping and quality thresholds. The trimmed reads were analyzed with FastQC.
```
make trim
```
Output:
```
Trimmed reads: SRR1573606_trimmed.fastq
```
FastQC reports for trimmed reads: Saved in qcreports

## Quality Control of FastQC Reports
The quality of the trimmed reads was improved using FastQC.
```
make fastqc
```
Output:
```
FastQC reports: SRR1573606_trimmed.fastq
 SRR1573606_trimmed_qc.fastq
```
