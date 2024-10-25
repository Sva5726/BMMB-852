### How many reads did not align with the reference genome?
55677 reads didnot aligned with the reference genome. 
```
samtools view -c -f 4 SRR1573606.sorted.bam
```
Output
```
55677
```
### How many primary, secondary, and supplementary alignments are in the BAM file?
```
samtools view -c -F 256 SRR1573606.sorted.bam # Primary alignment
```
Output
```
55678
```
samtools view -c -f 256 SRR1573606.sorted.bam  # Secondary alignments
```
Output
```
0
```
samtools view -c -f 2048 SRR1573606.sorted.bam  # Supplementary alignments
```
Output
```
0
```

### How many properly-paired alignments on the reverse strand are formed by reads contained in the first pair ?
 This data set is singe end sequencing data, thus there is no properly paired alignments on the reverse strand.

### Make a new BAM file that contains only the properly paired primary alignments with a mapping quality of over 10 Compare the flagstats for your original and your filtered BAM file.

### Original Flagstat Report

```
55678 + 0 in total (QC-passed reads + QC-failed reads)
55678 + 0 primary
0 + 0 secondary
0 + 0 supplementary
0 + 0 duplicates
0 + 0 primary duplicates
1 + 0 mapped (0.00% : N/A)
1 + 0 primary mapped (0.00% : N/A)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
```

### Filtered Flagstat Report
```
1 + 0 in total (QC-passed reads + QC-failed reads)
1 + 0 primary
0 + 0 secondary
0 + 0 supplementary
0 + 0 duplicates
0 + 0 primary duplicates
1 + 0 mapped (100.00% : N/A)
1 + 0 primary mapped (100.00% : N/A)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
```

The report from flagstats shows, out of 55,678 total reads, only 1 read mapped to the reference genome. This indicates very low mapping efficiency. 
