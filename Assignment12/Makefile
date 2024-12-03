# Organism: Ebola Virus
# SRA numbers should be listed in design.csv
# Local reference genome file
REF = AF086833.fa

# Directory for outputs
OUT_DIR = output
LOG_DIR = logs

# Number of reads to download
N = 100000

# -- Nothing needs to be changed below this line --

help:
	@echo "Usage:"
	@echo "make all - Execute the entire pipeline for all samples in design.csv"
	@echo "make genome - Download the genome and index it"
	@echo "make sample SRR=<SRA_number> - Process a specific sample through the pipeline"
	@echo "make merge - Merge all resulting VCF files into a single file"
	@echo "make clean - Clean up intermediate files"

all: genome process_all merge

genome:
	@echo "Fetching and indexing the reference genome..."
	mkdir -p ${OUT_DIR} ${LOG_DIR}
	efetch -db nuccore -id AF086833 -format fasta > ${OUT_DIR}/${REF}
	bwa index ${OUT_DIR}/${REF}
	samtools faidx ${OUT_DIR}/${REF}

process_all:
	@echo "Processing all samples listed in design.csv..."
	cat design.csv | tail -n +2 | cut -d ',' -f1 | parallel -j 4 make sample SRR={}

sample:
	@echo "Processing sample ${SRR}..."
	@echo "Step 1: Downloading FASTQ files..."
	fastq-dump -X ${N} --split-files ${SRR} > ${LOG_DIR}/${SRR}_fastqdump.log
	mkdir -p ${OUT_DIR}/${SRR}
	mv ${SRR}_1.fastq ${OUT_DIR}/${SRR}/
	mv ${SRR}_2.fastq ${OUT_DIR}/${SRR}/
	@echo "Step 2: Running FastQC before trimming..."
	fastqc ${OUT_DIR}/${SRR}/${SRR}_1.fastq -o ${LOG_DIR}
	fastqc ${OUT_DIR}/${SRR}/${SRR}_2.fastq -o ${LOG_DIR}
	@echo "Step 3: Trimming reads with fastp..."
	fastp --cut_tail -i ${OUT_DIR}/${SRR}/${SRR}_1.fastq -I ${OUT_DIR}/${SRR}/${SRR}_2.fastq -o ${OUT_DIR}/${SRR}/${SRR}_1.trim.fastq -O ${OUT_DIR}/${SRR}/${SRR}_2.trim.fastq
	@echo "Step 4: Running FastQC after trimming..."
	fastqc ${OUT_DIR}/${SRR}/${SRR}_1.trim.fastq -o ${LOG_DIR}
	fastqc ${OUT_DIR}/${SRR}/${SRR}_2.trim.fastq -o ${LOG_DIR}
	@echo "Step 5: Aligning reads to the reference genome..."
	bwa mem ${OUT_DIR}/${REF} ${OUT_DIR}/${SRR}/${SRR}_1.trim.fastq ${OUT_DIR}/${SRR}/${SRR}_2.trim.fastq > ${OUT_DIR}/${SRR}/${SRR}.sam
	samtools view -Sb ${OUT_DIR}/${SRR}/${SRR}.sam > ${OUT_DIR}/${SRR}/${SRR}.bam
	samtools sort ${OUT_DIR}/${SRR}/${SRR}.bam -o ${OUT_DIR}/${SRR}/${SRR}.sorted.bam
	samtools index ${OUT_DIR}/${SRR}/${SRR}.sorted.bam
	@echo "Step 6: Generating a VCF file..."
	bcftools mpileup -Ov -f ${OUT_DIR}/${REF} ${OUT_DIR}/${SRR}/${SRR}.sorted.bam > ${OUT_DIR}/${SRR}/${SRR}.bcf
	bcftools call -vm -Ov -o ${OUT_DIR}/${SRR}/${SRR}.vcf ${OUT_DIR}/${SRR}/${SRR}.bcf

merge:
	@echo "Compressing and indexing all VCF files..."
	find ${OUT_DIR} -name "*.vcf" | while read -r file; do \
		bgzip -c "$$file" > "$$file.gz"; \
		tabix -p vcf "$$file.gz"; \
	done
	@echo "Merging all VCF files into a single file..."
	ls ${OUT_DIR}/*/*.vcf.gz | xargs bcftools merge --force-single -Ov -o ${OUT_DIR}/merged.vcf
	@echo "Merged VCF file stored at ${OUT_DIR}/merged.vcf"

clean:
	@echo "Cleaning up intermediate files..."
	rm -rf ${OUT_DIR}/*/*.sam ${OUT_DIR}/*/*.bam ${OUT_DIR}/*/*.bcf
