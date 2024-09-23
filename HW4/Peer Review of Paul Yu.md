### Peer review #2 Paul Yu

### Downloaded the datasets and unzipped it
```
$  wget https://ftp.ensembl.org/pub/release-112/gff3/salmo_salar/Salmo_salar.Ssal_v3.1.112.abinitio.gff3.gz -O"genome.fa"
```
```
$ gunzip -k"genome.fa"
```

### GFF file was downloaded
```
$ wget https://ftp.ensembl.org/pub/release-112/gff3/salmo_salar/Salmo_salar.Ssal_v3.1.112.abinitio.gff3.gz -O "species.gff"
```
### Gene file was moved to gene.gff
```
$ cat species.gff | awk '$3 == "gene"' > gene.gff
```
```
$ cat gene.gff | wc -l
```

OUTPUT

```
    0
```
