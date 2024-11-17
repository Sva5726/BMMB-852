Organism: Ebola Virus
#SRA number
SRR = SRR17429268

# Local reference genome file
REF = AF086833.fa

# Number of reads to download
N = 100000

# Names for paired reads
R1 = ${SRR}_1.fastq
R2 = ${SRR}_2.fastq

# Names for trimmed reads
Q1 = ${SRR}_1.trim.fastq
Q2 = ${SRR}_2.trim.fastq

# -- Do not modify below this line --

help:
	@echo "Usage:"
	@echo "make genome - download the genome"
	@echo "make index - prepare genome indices"
	@echo "make fastq_trim - retrieve, filter, and trim sequencing reads"
	@echo "make align - perform alignment and process BAM files"
	@echo "make VCF - generate a VCF file from aligned data"

genome:
	@echo "Fetching the reference genome..."
	efetch -db nuccore -id AF086833 -format fasta > ${REF}

index:
	@echo "Indexing the reference genome with bwa..."
	bwa index ${REF}
	@echo "Creating fasta index for samtools..."
	samtools faidx ${REF}

fastq_trim:
	@echo "Downloading FASTQ files for ${SRR}..."
	fastq-dump -X ${N} --split-files ${SRR} > fastqdump.log.txt
	@echo "Running FastQC before trimming..."
	mkdir -p fastqc
	fastqc ${R1} -o fastqc
	fastqc ${R2} -o fastqc
	@echo "Trimming sequencing reads..."
	fastp --cut_tail -i ${R1} -I ${R2} -o ${Q1} -O ${Q2}
	@echo "Running FastQC after trimming..."
	fastqc ${Q1} -o fastqc
	fastqc ${Q2} -o fastqc

align:
	@echo "Aligning reads to the reference genome..."
	bwa mem ${REF} ${Q1} ${Q2} > ${SRR}.sam
	@echo "Converting SAM to BAM format..."
	samtools view -Sb ${SRR}.sam > ${SRR}.bam
	@echo "Sorting and indexing BAM files..."
	samtools sort ${SRR}.bam -o ${SRR}.sorted.bam
	samtools index ${SRR}.sorted.bam

VCF:
	@echo "Generating genotype data (BCF format)..."
	bcftools mpileup -Ov -f ${REF} ${SRR}.sorted.bam > ${SRR}.bcf
	@echo "Calling variants to create a VCF file..."
	bcftools call -vm -Ov -o ${SRR}.vcf ${SRR}.bcf

