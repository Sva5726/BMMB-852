# Set SRA number
SRR = SRR1573606

# Genome stored locally
REF = Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa

# Number of reads to simulate or download
N = 100000

# Name for single-end read
R1 = ${SRR}.trim.fastq

# Name of trimmed reads
Q1 = ${R1}

# -- Nothing needs to change below --

help:
	@echo "Usage:"
	@echo "make genome - download the genome"
	@echo "make simulate_genome - simulate reads from the genome"
	@echo "make fastq_trim - retrieve SRR run info from SRA, filter, trim"

genome:
	@echo "# Get genome data"
	curl -o ${REF}.gz https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-59/fasta/bacteria_12_collection/escherichia_coli_gca_001606525/dna/Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa.gz
	@echo "# Decompress the genome"
	gunzip ${REF}.gz

simulate_genome: genome
	@echo "# Simulate FASTQ reads"
	wgsim -N ${N} -1 150 ${REF} simulated_reads_1.fastq /dev/null
	@echo "# Compressing simulated reads"
	gzip simulated_reads_1.fastq

fastq_trim:
	@echo "# Obtain the FASTQ sequences for the SRR number"
	fastq-dump -X ${N} ${SRR} > fastqdump.log.txt
	@echo "# Make a directory for fastqc"
	mkdir -p fastqc
	@echo "# Check quality before trimming"
	fastqc ${SRR}.fastq -o fastqc
	@echo "# Apply trimming"
	fastp --cut_tail -i ${SRR}.fastq -o ${R1}
	@echo "# Check quality after trimming"
	fastqc ${R1} -o fastqc
