# Organism: Escherichia coli

# Set SRA number
SRR =SRR31129135

# Genome stored locally
REF = Escherichia_coli_gca_005045525.ASM504552v1_.dna.toplevel.fa

# Number of reads to get
N = 100000

# Names for reads
R1 = ${SRR}_1.trim.fastq
R2 = ${SRR}_2.trim.fastq

# Output directories
GENOME_DIR = genome
INDEX_DIR = index
FASTQ_DIR = fastq
FASTQC_DIR = fastqc
TRIM_DIR = trimmed
ALIGN_DIR = align

# Ensure all output directories exist
.PHONY: setup
setup:
	mkdir -p ${GENOME_DIR} ${INDEX_DIR} ${FASTQ_DIR} ${FASTQC_DIR} ${TRIM_DIR} ${ALIGN_DIR}

# --------- Nothing needs to change below ------------------

help:
	@echo "Usage:"
	@echo "make genome - download the genome"
	@echo "make index - index the downloaded genome"
	@echo "make fastq_trim - retrieve SRR run info from SRA, filter, trim"
	@echo "make align - run bwa aligner and generate/index bam file"
	@echo "make stats - generate alignment statistics for the sorted BAM file"

genome: setup
	@echo "# Get genome data"
	curl -o ${GENOME_DIR}/${REF}.gz https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-60/fasta/bacteria_51_collection/escherichia_coli_gca_005045525/dna/Escherichia_coli_gca_005045525.ASM504552v1_.dna.toplevel.fa.gz
	@echo "# Decompress the genome"
	gunzip -c ${GENOME_DIR}/${REF}.gz > ${GENOME_DIR}/${REF}

index: setup
	@echo "# Build bwa index for the reference genome"
	bwa index -p ${INDEX_DIR}/${REF} ${GENOME_DIR}/${REF}
	@echo "# Build IGV index for the reference genome"
	samtools faidx ${GENOME_DIR}/${REF} -o ${INDEX_DIR}/$(basename ${REF}).fai

fastq_trim: setup
	@echo "# Obtain the FASTQ sequences for the SRR number"
	fastq-dump -X ${N} --split-files ${SRR} -O ${FASTQ_DIR} > ${FASTQ_DIR}/fastqdump.log.txt
	@echo "# Check quality before trimming"
	fastqc ${FASTQ_DIR}/${SRR}_1.fastq ${FASTQ_DIR}/${SRR}_2.fastq -o ${FASTQC_DIR}
	@echo "# Apply trimming"
	fastp --cut_tail -i ${FASTQ_DIR}/${SRR}_1.fastq -I ${FASTQ_DIR}/${SRR}_2.fastq -o ${TRIM_DIR}/${SRR}_1.trim.fastq -O ${TRIM_DIR}/${SRR}_2.trim.fastq
	@echo "# Check quality after trimming"
	fastqc ${TRIM_DIR}/${SRR}_1.trim.fastq ${TRIM_DIR}/${SRR}_2.trim.fastq -o ${FASTQC_DIR}

align: setup
	@echo "# Run the bwa aligner for paired-end reads. Creates a SAM file"
	bwa mem ${INDEX_DIR}/${REF} ${TRIM_DIR}/${R1} ${TRIM_DIR}/${R2} > ${ALIGN_DIR}/${SRR}.sam
	@echo "# Convert the SAM file to BAM format."
	samtools view -Sb ${ALIGN_DIR}/${SRR}.sam > ${ALIGN_DIR}/${SRR}.bam
	@echo "# Sort and index the BAM file."
	samtools sort ${ALIGN_DIR}/${SRR}.bam -o ${ALIGN_DIR}/${SRR}.sorted.bam
	samtools index ${ALIGN_DIR}/${SRR}.sorted.bam

stats: setup align
	@echo "# Generate alignment statistics"
	samtools flagstat ${ALIGN_DIR}/${SRR}.sorted.bam > ${ALIGN_DIR}/${SRR}.alignment.stats.txt
	@echo "Alignment statistics saved to ${ALIGN_DIR}/${SRR}.alignment.stats.txt"
