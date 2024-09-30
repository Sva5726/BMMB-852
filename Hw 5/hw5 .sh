Part 1

# ----- DEFINITIONS -----

SeqID ="GCF_000005845.2"
File = "ecoli.fa"

#--------Nothing changed from here on out--------

# Download the E. coli genome from NCBI
datasets download genome accession $SeqID

# Unzip the downloaded file
unzip -o ncbi_datset.zip

# Create a symbolic link to the genome file
ln -sf ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna $File

#check the file size of the genome file
seqkit stat $File

# count the size of genome
echo "Size of File: $(du -h $File | cut -f1)"

# count the total number of nucleotides in the genome
echo "Total number of nucleotides: $(grep -v '>' $File | wc -c)"

# count the number of chrmosomes in the genome
echo "Number of chromosomes: $(grep -c '>' $File)"

#report the name and Id of the chromosome
grep '>' $File | cut -d ' ' -f1,2



Part 2- Stimulating Fasta files


# ------DEFINITIONS---------

URL = https://ftp.ensemblgenomes.ebi.ac.uk/pub/bacteria/release-59/fasta/bacteria_26_collection/escherichia_coli_w_gca_000184185/dna/Escherichia_coli_w_gca_000184185.ASM18418v1.dna.toplevel.fa.gz
basefile = Escherichia_coli_w_gca_000184185.ASM18418v1.dna.toplevel.fa
fastafile = ecoli.fa

# Download the ecoli genome from ensembl
wget $URL

# Unzip the downloaded file
gunzip basefile

# Create a symbolic link to the genome file
ln -sf basefile $fastafile

#index the fasta file
samtools faidx $fastafile
Fai-file = $fastafile.fai
cat $Fai-file

#check the file size of the genome file
total_genome_size=$(awk '{sum+=$2} END {print sum}' $Fai-file)
echo "total genome size: $total_genome_size"

#stimulate the reads with wgsim
genome = fastafile
expected_coverage = 10
read_length = 100

#calculate the number of reads to using bc for arithmatic operations
N=$(echo "$expected_coverage * $total_genome_size / $read_length" | bc)
echo "Number of reads to simulate: $N"

# the files to write the reads to
R1="simreads/wgsim_read1.fq"
R2="simreads/wgsim_read2.fq"

# Make a new directory  and set the path to the directory
mkdir -p $(dirname simreads/wgsim_read1.fq)

# Simulate reads with wgsim with no errors and uniform base quality
wgsim -N $N -1 $read_length -2 $read_length -e 0 -r 0 -R 0 -X 0 $genome $R1 $R2

# Check the size of the read files
seqkit stat $R1 $R2

