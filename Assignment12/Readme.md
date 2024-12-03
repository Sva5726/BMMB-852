# Variant Calling Pipeline

## Overview
This pipeline processes sequencing data from the SRA database, aligns it to the Ebola virus reference genome, and generates variant call format files. It also merges multiple VCF files into a single file for downstream analysis.

## Requirements
Ensure the following tools are installed:
- `bwa`
- `samtools`
- `fastq-dump`
- `fastp`
- `fastqc`
- `bcftools`
- `parallel`

## Files and Directories
- `design.csv`: A CSV file listing the SRA sample numbers to process. 
```csv
SRR
SRR17429268
SRR17429269
SRR17429270
```
- `AF086833.fa`: The Ebola virus reference genome in FASTA format.
- `output/`: The directory where all output files (e.g., trimmed FASTQ, BAM files, VCF files) will be stored.
- `logs/`: The directory where log files (e.g., FastQC, fastq-dump logs) will be saved.
---

## Pipeline Overview
### 1. Genome Download and Indexing (make genome)
This step fetches the Ebola virus reference genome from NCBI and indexes it using `bwa` and `samtools`.
### 2. Process All Samples (make process_all)
The pipeline reads the `design.csv` file, extracts SRA sample numbers, and processes each sample by:
1. Downloading FASTQ files using `fastq-dump`.
2. Running FastQC to check the quality of the raw reads.
3. Trimming the reads with `fastp`.
4. Running FastQC again to check the quality of the trimmed reads.
5. Aligning the reads to the reference genome using `bwa`.
6. Sorting and indexing the BAM files using `samtools`.
7. Generating a VCF file with variant calls using `bcftools`.

### 3. Sample Processing (make sample SRR=<SRA_number>)

This step allows you to process a specific sample by specifying its SRA number (`SRR`).

### 4. Merging VCF Files(make merge)
- Compresses and indexes all VCF files.
- Merges them into a single VCF file.

### 5. Cleaning Up(make clean)
 removes intermediate files 