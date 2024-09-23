
Peer Reviw #1 Rita Vadodria 

### Organism: salmo_salar 

micromamba activate bioinfo
 

Downloaded the datasets and unzipped it
```
datasets download genome accession GCF_000005845.2 --include gff3
```
```
unzip ncbi_dataset.zip
```

OUTPUT:
```
Archive:  ncbi_dataset.zip
  inflating: README.md               
  inflating: ncbi_dataset/data/assembly_data_report.jsonl  
  inflating: ncbi_dataset/data/GCF_000005845.2/genomic.gff  
  inflating: ncbi_dataset/data/dataset_catalog.json  
  inflating: md5sum.txt              
```
Directory changed
```
$ cd ncbi_dataset/data/GCF_000005845.2
```
```
$ cat genomic.gff |cut -f 3 | grep -v '#' > feature_types.txt
```
```
$ cat feature_types.txt | sort-uniq-count-rank
```
OUTPUT:
```
4494	gene
4337	CDS
207	exon
145	pseudogene
99	ncRNA
86	tRNA
50	mobile_genetic_element
48	sequence_feature
22	rRNA
1	origin_of_replication
1	region
```




