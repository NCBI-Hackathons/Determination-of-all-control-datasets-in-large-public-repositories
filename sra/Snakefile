rule download_microbial_runinfo:
    output: "data/microbial.csv"
    shell: """
        mkdir -p outputs/info
        wget -O {output}.full 'http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?save=efetch&db=sra&rettype=runinfo&term=(("biomol dna"[Properties] NOT amplicon[All Fields])) AND "bacteria"[orgn:__txid2] NOT metagenome'
        head -n -1 {output}.full > {output}
        rm {output}.full
    """

# link from https://github.com/seandavi/SRAdb
rule download_sra_sqlite:
    output: "data/SRAmetadb.sqlite"
    shell: """
        wget -O {output}.gz https://starbuck1.s3.amazonaws.com/sradb/SRAmetadb.sqlite.gz
        gunzip {output}.gz
    """

# ftp://ftp.ncbi.nlm.nih.gov/sra/reports/Metadata/NCBI_SRA_Metadata_Full_20181103.tar.gz
rule download_sra_metadata:
    output: "data/Metadata/NCBI_SRA_Metadata_Full_20181103.tar.gz"
    shell: """
        wget -O {output} ftp://ftp.ncbi.nlm.nih.gov/sra/reports/Metadata/NCBI_SRA_Metadata_Full_20181103.tar.gz
    """

# ftp://ftp.ncbi.nlm.nih.gov/biosample/biosample_set.xml.gz
rule download_biosample:
    output: "data/biosample_set.xml.gz"
    shell: """
        wget -O {output}.gz ftp://ftp.ncbi.nlm.nih.gov/biosample/biosample_set.xml.gz
        gunzip {output}.gz
    """
