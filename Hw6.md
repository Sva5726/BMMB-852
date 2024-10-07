
Microorganism : E.coli k-12 strain

## SRR number = SRR=SRR1573606

## New directories for reads and reports were created
```
mkdir -p reads reports
```
## The first 10000 reads were downloaded and saved in reads directory
```
fastq-dump -X 10000 --split-files -O reads SRR1573606
```
Fastqc to see the quality of data.
```
fastqc -q -o reports reads/SRR1573606_1.fastq
```
## Reads were trimmed for quality control
```
fastp --cut_right -f 30 -T 80 -i reads/SRR1573606_1.fastq -o reads/SRR1573606_1.trimmed.fastq
```
## Quality of trimmed reports were analysed
```
fastqc -q -o reports reads/SRR1573606_1.trimmed.fastq
```

Output
| Metric | Before filtering | After filtering |
|--------|------------------|------------------|
| Total reads | 10000 | 7791 |
| Total bases | 500000 | 155570 |
| Q20 bases | 456141 (91.2%) | 151793 (97.5%) |
| Q30 bases | 424156 (84.8%) | 144560 (92.9%) |




| Filtering Result | Count |
|------------------|-------|
| Reads passed | 7791 |
| Reads failed due to low quality | 1 |
| Reads failed due to too many N | 0 |
| Reads failed due to too short | 2208 |
| Reads with adapter trimmed | 0 |
| Bases trimmed due to adapters | 0 |


The trimming process has significantly reduced the number of reads and bases. It improved the overall quality of the data. There was a 22% reduction in total reads (i.e., from 10,000 to 7,791). The total bases also reduced by 68.89% (i.e., from 500,000 to 155,570). The low-quality and problematic data were screened out. Also, the report indicates that the overall Q20 and Q30 bases increased after trimming. Q20 bases percentage increased from 91.23% to 97.57%, and Q30 bases percentage increased from 84.83% to 92.92%. These improvements show that the remaining bases after filtering are much higher quality. Q20 and Q30 scores represent the probability of a base call being correct (99% and 99.9% accuracy, respectively). Since I set up to remove the first 30 reads, 2,208 reads were removed as they did not meet the length threshold. The sequences do not contain adapter sequences
Thus, FastQC improved the overall quality of the dataset by removing short reads, eliminating low-quality reads, and significantly increasing the proportion of high-quality bases (Q20 and Q30).



