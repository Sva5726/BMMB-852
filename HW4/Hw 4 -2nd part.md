

Part 2: Make use of ontologies

In Hw2, there was an exon feature present. so to learn more about exon its parent's terms and children nodes,

### Activated bioinfo ennvironment
```
micromamba activate bioinfo
```

### Downloaded the software 
```
pip install bio --upgrade
```


```
bio explain exon
```

OUTPUT
```
## exon (SO:0000147)

A region of the transcript sequence within a gene which is not removed from the primary RNA transcript by RNA splicing.

Parents:
- transcript_region 

Children:
- coding_exon 
- noncoding_exon 
- interior_exon 
- decayed_exon (non_functional_homolog_of)
- pseudogenic_exon (non_functional_homolog_of)
- exon_region (part_of)
- exon_of_single_exon_gene 
```

### Short description:

The exons are the sequences that are retained during the RNA splicing process and are crucial for gene expression. It is opposite of introns, as introns are spliced off. Its parent term is transcript regions. Exons have various child nodes, which indicates that they differ from each other based on their function, such as coding or noncoding, and their location, such as interior exons. Interestingly, there are also decayed or pseudogenic exons. These exons have lost their function over time.