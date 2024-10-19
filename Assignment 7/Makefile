# Define variables
GENOME_URL=https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-59/fasta/bacteria_12_collection/escherichia_coli_gca_001606525/dna/Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa.gz
GENOME_GZ= Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa.gz
GENOME_FILE := Escherichia_coli_gca_001606525.ASM160652v1.dna_rm.toplevel.fa
SRR=SRR1573606
SIM_READ_1 =simulated_reads_1.fastq
TRIMMED_FILE := $(SRA)_trimmed.fastq
QC_TRIMMED_FILE := $(SRR)_trimmed_qc.fastq
TRIMMOMATIC_VER := 0.39
TRIMMOMATIC_DIR := Trimmomatic-$(TRIMMOMATIC_VER)
TRIMMOMATIC_JAR := $(TRIMMOMATIC_DIR)/trimmomatic-$(TRIMMOMATIC_VER).jar
ADAPTER_FILE := $(TRIMMOMATIC_DIR)/adapters/TruSeq3-SE.fa
FASTQC_CMD := fastqc
SRA_DIR := sra_data/$(SRR)
QC_DIR := qcreports
TRIM_DIR := $(SRA_DIR)/trimmed

# Help
usage:
	@echo "  genome   - Download and unzip the genome"
	@echo "  simulate_genome - Simulate reads from the genome"
	@echo "  download - Download reads from SRA"
	@echo "  trim     - Trim reads using Trimmomatic"
	@echo "  fastqc   - Generate FastQC reports"

# Download genome
genome:
	mkdir -p genome_data
	cd genome_data && wget $(GENOME_URL)
	cd genome_data && gunzip $(GENOME_GZ)

# Simulate reads
simulate_genome: genome
	@echo "Simulating FASTQ reads..."
	@echo "GENOME_FILE: $(GENOME_FILE)"
	@echo "SIM_READ_1: $(SIM_READ_1)"
	wgsim -N 100000 -1 150 $(GENOME_FILE) $(SIM_READ_1) /dev/null
	@echo "Compressing simulated reads..."
	gzip $(SIM_READ_1)


# Download reads from SRA and run FastQC
download:
	mkdir -p $(SRR) $(QC_DIR)   # Create directories
	fastq-dump --split-files --outdir $(SRA_DIR) $(SRR)
	$(FASTQC_CMD) $(SRA_DIR)/$(SRR)_1.fastq -o $(QC_DIR)


# Download Trimmomatic if not present
trimmomatic:
	@if [ ! -f "$(TRIMMOMATIC_JAR)" ]; then \
	echo "Downloading Trimmomatic..."; \
	wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-$(TRIMMOMATIC_VER).zip; \
	unzip Trimmomatic-$(TRIMMOMATIC_VER).zip; \
	fi

# Trim reads using Trimmomatic and run FastQC
trim: trimmomatic
	@echo "Trimming reads with Trimmomatic..."
	mkdir -p $(TRIM_DIR)
	java -jar $(TRIMMOMATIC_JAR) SE -threads 4 $(SRA_DIR)/$(SRR)_1.fastq $(TRIMMED_FILE) \
		ILLUMINACLIP:$(ADAPTER_FILE):2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
	$(FASTQC_CMD) $(TRIMMED_FILE) -o $(QC_DIR)


# Generate FastQC reports
fastqc: download trim
	@echo "Running FastQC on all trimmed reads..."
	$(FASTQC_CMD) $(TRIMMED_FILE) -o $(QC_DIR)
	$(FASTQC_CMD) $(IMPROVED_TRIMMED_FILE) -o $(QC_DIR)

# Clean up
clean:
	clear && rm -rf genome_data sra_data qcreports Trimmomatic-0.39 Trimmomatic-0.39.zip sim_read_1.fastq.gz
