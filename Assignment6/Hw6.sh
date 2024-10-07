
# Set the trace
set -uex

# SRR number
SRR=SRR1573606

# Number of reads to download
N=10000

# The output read names
R1=reads/${SRR}_1.fastq

# Trimmed read names
T1=reads/${SRR}_1.trimmed.fastq

# The reads directory
RDIR=reads

# The reports directory
PDIR=reports

----No changes below this line----

# Make the necessary directories
mkdir -p ${RDIR} ${PDIR}

# Download the FASTQ file
fastq-dump -X ${N} --split-files -O ${RDIR} ${SRR} 

# Run fastqc
fastqc -q -o ${PDIR} ${R1}

# Run fastp and trim for quality and read length
fastp --cut_right -f 30 -T 80 -i ${R1} -o ${T1}

# Run fastqc
fastqc -q -o ${PDIR} ${T1}
