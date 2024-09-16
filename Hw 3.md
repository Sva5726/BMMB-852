
**Organism: E.Coli k-12 strain.**
RefSeq:GCF_000005845.2

# Summary of data sets were visualised using code

srijanaadhikari@MacBook-Air ~/Study/lec04
$ datasets summary genome accession GCF_000005845.2
 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ datasets summary genome accession GCF_000005845.2 |jq
    
    New version of client (16.28.0) available at https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/mac/datasets.
{
  "reports": [
    {
      "accession": "GCF_000005845.2",
      "annotation_info": {
        "name": "Annotation submitted by NCBI RefSeq",
        "provider": "NCBI RefSeq",
        "release_date": "2022-03-09",
        "stats": {
          "gene_counts": {
            "non_coding": 206,
            "protein_coding": 4288,
            "pseudogene": 145,
            "total": 4639
          }
        }
      },
      "assembly_info": {
        "assembly_level": "Complete Genome",
        "assembly_name": "ASM584v2",
        "assembly_status": "current",
        "assembly_type": "haploid",
        "bioproject_accession": "PRJNA225",
        "bioproject_lineage": [
          {
            "bioprojects": [
              {
                "accession": "PRJNA225",
                "title": "Model organism for genetics, physiology, biochemistry"
              }
            ]
          }
        ],
        "biosample": {
          "accession": "SAMN02604091",
          "attributes": [
            {
              "name": "strain",
              "value": "K-12"
            },
            {
              "name": "substrain",
              "value": "MG1655"
            }
          ],
          "bioprojects": [
            {
              "accession": "PRJNA225"
            }
          ],
          "description": {
            "organism": {
              "organism_name": "Escherichia coli str. K-12 substr. MG1655",
              "tax_id": 511145
            },
            "title": "Sample from Escherichia coli str. K-12 substr. MG1655"
          },
          "last_updated": "2020-01-27T14:15:18.170",
          "models": [
            "Generic"
          ],
          "owner": {
            "name": "NCBI"
          },
          "package": "Generic.1.0",
          "publication_date": "2014-01-30T14:54:21.310",
          "sample_ids": [
            {
              "label": "Sample name",
              "value": "U00096"
            },
            {
              "db": "SRA",
              "value": "SRS6067201"
            }
          ],
          "status": {
            "status": "live",
            "when": "2014-01-30T14:54:21.310"
          },
          "strain": "K-12",
          "submission_date": "2014-01-30T14:54:21.310"
        },
        "comments": "Changes to proteins and annotation made on March 7, 2022. Current U00096 annotation updates are derived from EcoCyc https://ecocyc.org/. Suggestions for updates can be sent to biocyc-support@ai.sri.com. These updates are being generated from a collaboration that includes EcoCyc, the University of Wisconsin, UniProtKB/Swiss-Prot, and the National Center for Biotechnology Information (NCBI)",
        "paired_assembly": {
          "accession": "GCA_000005845.2",
          "annotation_name": "Annotation submitted by Univ. Wisconsin",
          "status": "current"
        },
        "refseq_category": "reference genome",
        "release_date": "2013-09-26",
        "submitter": "Univ. Wisconsin"
      },
      "assembly_stats": {
        "contig_l50": 1,
        "contig_n50": 4641652,
        "gc_count": "2357528",
        "gc_percent": 51,
        "number_of_component_sequences": 1,
        "number_of_contigs": 1,
        "number_of_scaffolds": 1,
        "scaffold_l50": 1,
        "scaffold_n50": 4641652,
        "total_number_of_chromosomes": 1,
        "total_sequence_length": "4641652",
        "total_ungapped_length": "4641652"
      },
      "average_nucleotide_identity": {
        "best_ani_match": {
          "ani": 99.46,
          "assembly": "GCA_000210475.1",
          "assembly_coverage": 94.38,
          "category": "claderef",
          "organism_name": "Escherichia coli",
          "type_assembly_coverage": 82.26
        },
        "category": "category_na",
        "comment": "na",
        "match_status": "species_match",
        "submitted_ani_match": {
          "ani": 99.46,
          "assembly": "GCA_000210475.1",
          "assembly_coverage": 94.38,
          "category": "claderef",
          "organism_name": "Escherichia coli ETEC H10407",
          "type_assembly_coverage": 82.26
        },
        "submitted_organism": "Escherichia coli str. K_12 substr. MG1655",
        "submitted_species": "Escherichia coli",
        "taxonomy_check_status": "OK"
      },
      "checkm_info": {
        "checkm_marker_set": "Escherichia coli",
        "checkm_marker_set_rank": "species",
        "checkm_species_tax_id": 562,
        "checkm_version": "v1.2.2",
        "completeness": 99.48,
        "completeness_percentile": 89.76061,
        "contamination": 0.15
      },
      "current_accession": "GCF_000005845.2",
      "organism": {
        "infraspecific_names": {
          "strain": "K-12 substr. MG1655"
        },
        "organism_name": "Escherichia coli str. K-12 substr. MG1655",
        "tax_id": 511145
      },
      "paired_accession": "GCA_000005845.2",
      "source_database": "SOURCE_DATABASE_REFSEQ"
    }
  ],
  "total_count": 1
}
(bioinfo) 


# Genomic datasets was downloaded using the code 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ datasets download genome accession GCF_000005845.2
New version of client (16.28.0) available at https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/mac/datasets.
Collecting 1 genome record [================================================] 100% 1/1
Downloading: ncbi_dataset.zip    1.38MB valid zip structure -- files not checked
Validating package [================================================] 100% 5/5
(bioinfo) 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ ls                   
ncbi_dataset     ncbi_dataset.zip
(bioinfo) 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ unzip ncbi_dataset.zip
Archive:  ncbi_dataset.zip
  inflating: README.md               
  inflating: ncbi_dataset/data/assembly_data_report.jsonl  
  inflating: ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna  
  inflating: ncbi_dataset/data/dataset_catalog.json  
  inflating: md5sum.txt              
(bioinfo) 



srijanaadhikari@MacBook-Air ~/Study/lec04
$ cat ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna | head
>NC_000913.3 Escherichia coli str. K-12 substr. MG1655, complete genome
AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGCTTCTGAACTG
GTTACCTGCCGTGAGTAAATTAAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGAC
AGATAAAAATTACAGAGTACACAACATCCATGAAACGCATTAGCACCACCATTACCACCACCATCACCATTACCACAGGT
AACGGTGCGGGCTGACGCGTACAGGAAACACAGAAAAAAGCCCGCACCTGACAGTGCGGGCTTTTTTTTTCGACCAAAGG
TAACGAGGTAACAACCATGCGAGTGTTGAAGTTCGGCGGTACATCAGTGGCAAATGCAGAACGTTTTCTGCGTGTTGCCG
ATATTCTGGAAAGCAATGCCAGGCAGGGGCAGGTGGCCACCGTCCTCTCTGCCCCCGCCAAAATCACCAACCACCTGGTG
GCGATGATTGAAAAAACCATTAGCGGCCAGGATGCTTTACCCAATATCAGCGATGCCGAACGTATTTTTGCCGAACTTTT
GACGGGACTCGCCGCCGCCCAGCCGGGGTTCCCGCTGGCGCAATTGAAAACTTTCGTCGATCAGGAATTTGCCCAAATAA
AACATGTCCTGCATGGCATTAGTTTGTTGGGGCAGTGCCCGGATAGCATCAACGCTGCGCTGATTTGCCGTGGCGAGAAA
(bioinfo) 


srijanaadhikari@MacBook-Air ~/Study/lec04
$ datasets download genome accession GCF_000005845.2 --include gff3,cds,protein,rna,genome
New version of client (16.28.0) available at https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/mac/datasets.
Collecting 1 genome record [================================================] 100% 1/1
Downloading: ncbi_dataset.zip    4.2MB valid zip structure -- files not checked
Validating package [================================================] 100% 8/8
(bioinfo) 

# unzip datasets by using code

srijanaadhikari@MacBook-Air ~/Study/lec04
$ unzip ncbi_dataset.zip
Archive:  ncbi_dataset.zip
replace README.md? [y]es, [n]o, [A]ll, [N]one, [r]ename: y
  inflating: README.md               
replace ncbi_dataset/data/assembly_data_report.jsonl? [y]es, [n]o, [A]ll, [N]one, [r]ename: A
  inflating: ncbi_dataset/data/assembly_data_report.jsonl  
  inflating: ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna  
  inflating: ncbi_dataset/data/GCF_000005845.2/genomic.gff  
  inflating: ncbi_dataset/data/GCF_000005845.2/cds_from_genomic.fna  
  inflating: ncbi_dataset/data/GCF_000005845.2/protein.faa  
  inflating: ncbi_dataset/data/dataset_catalog.json  
  inflating: md5sum.txt              
(bioinfo) 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ cat ncbi_dataset/data/GCF_000005845.2/genomic.gff 


This code gave detailed information about the types of features present in the dataset. It has gene CDS, exon, rRNA, ncRNA, and tRNA.


# code to display gene only.

srijanaadhikari@MacBook-Air ~/Study/lec04
$ cat ncbi_dataset/data/GCF_000005845.2/genomic.gff | awk '$3=="gene" {print $0}'



# code to move data that is explicitly stated gene onto a new file named as gene.gff and CDS to CDS>GFF file by using the following code

srijanaadhikari@MacBook-Air ~/Study/lec04
$ cat ncbi_dataset/data/GCF_000005845.2/genomic.gff |awk '$3=="gene" { print $0 }' > ncbi_dataset/data/GCF_000005845.2/gene.gff
(bioinfo) 
srijanaadhikari@MacBook-Air ~/Study/lec04
$ cat ncbi_dataset/data/GCF_000005845.2/genomic.gff |awk '$3=="CDS" { print $0 }' > ncbi_dataset/data/GCF_000005845.2/CDS.gff
(bioinfo) 


# Analysing datasets in IGV

The genome sequence is 4,641bp long. The maximum zooM let us visualize 49 bp at a time. When comparing the gene and CDS sequences, they align quite well. The start codon, methionine, matches exactly with the start of both the gene and CDS. Similarly, the stop codon is consistent in both sequences, with the CDS and gene ending simultaneously. This strain appears to be well-aligned in terms of gene and CDS sequences.





