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

# ----------- Nothing needs to change below ----------------

help:
	@echo "Usage:"
	@echo "make genome - download the genome"
	@echo "make index - index the downloaded genome"
	@echo "make fastq_trim - retrieve SRR run info from SRA, filter, trim"
	@echo "make align - run bwa aligner and generate/index bam file"
	@echo "make stats - get alignment statistics"
	@echo "make filter - filter BAM file for primary alignments with mapping quality > 10"
	@echo "make compare_flagstats - compare flag stats for original and filtered BAM files"

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

stats:
	@echo "# How many reads did not align with the reference genome?"
	samtools view -c -f 4 ${SRR}.sorted.bam
	@echo "# How many primary, secondary, and supplementary alignments are in the BAM file?"
	samtools view -c -F 256 ${SRR}.sorted.bam  # Primary alignments
	samtools view -c -f 256 ${SRR}.sorted.bam  # Secondary alignments
	samtools view -c -f 2048 ${SRR}.sorted.bam  # Supplementary alignments

filter:
	@echo "# Make a new BAM file with primary alignments with mapping quality > 10"
	samtools view -h -F 256 -q 10 ${SRR}.sorted.bam -o ${SRR}.filtered.bam
	@echo "# Sort and index the filtered BAM file"
	samtools sort ${SRR}.filtered.bam -o ${SRR}.filtered.sorted.bam
	samtools index ${SRR}.filtered.sorted.bam

compare_flagstats:
	@echo "# Compare flagstats for original and filtered BAM files"
	samtools flagstat ${SRR}.sorted.bam > original_flagstats.txt
	samtools flagstat ${SRR}.filtered.sorted.bam > filtered_flagstats.txt
	@echo "# Flagstats comparison done. Check 'original_flagstats.txt' and 'filtered_flagstats.txt'."
