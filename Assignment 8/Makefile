# Set SRA number
SRR = SRR1573606

# Genome stored locally
REF = Escherichia_coli_str_k_12_substr_mg1655_gca_000005845.ASM584v2.dna.toplevel.fa

# Number of reads to get
N = 100000

# Name for single-end read
R1 = ${SRR}.trim.fastq

# Name of trimmed reads (if applicable, but not needed for single-end)
Q1 = ${R1}

# -- Nothing needs to change below --

help:
	@echo "Usage:"
	@echo "make genome - download the genome"
	@echo "make index - index the downloaded genome"
	@echo "make fastq_trim - retrieve SRR run info from SRA, filter, trim"
	@echo "make align - run bwa aligner and generate/index bam file"

genome:
	@echo "# Get genome data"
	curl -o ${REF}.gz https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-59/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655_gca_000005845/dna/Escherichia_coli_str_k_12_substr_mg1655_gca_000005845.ASM584v2.dna.toplevel.fa.gz
	@echo "# Decompress the genome"
	gunzip ${REF}.gz

index:
	@echo "# Build bwa index for the reference genome"
	bwa index ${REF}
	@echo "# Build IGV index for the reference genome"
	samtools faidx ${REF}

fastq_trim:
	@echo "# Obtain the FASTQ sequences for the SRR number"
	fastq-dump -X ${N} ${SRR} > fastqdump.log.txt
	@echo "# Make a directory for fastqc"
	mkdir -p fastqc
	@echo "# Check quality before trimming"
	fastqc ${SRR}.fastq -o fastqc
	@echo "# Apply trimming"
	fastp --cut_tail -i ${SRR}.fastq -o ${SRR}.trim.fastq
	@echo "# Check quality after trimming"
	fastqc ${SRR}.trim.fastq -o fastqc

align:
	@echo "# Run the bwa aligner for single-end reads. Creates a SAM file"
	bwa mem ${REF} ${Q1} > ${SRR}.sam
	@echo "# Convert the SAM file to BAM format."
	samtools view -Sb ${SRR}.sam > ${SRR}.bam
	@echo "# Sort and index the BAM file."
	samtools sort ${SRR}.bam -o ${SRR}.sorted.bam
	samtools index ${SRR}.sorted.bam

