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
    output: "SRAmetadb.sqlite.gz"
    shell: """
        wget -O {output} https://starbuck1.s3.amazonaws.com/sradb/SRAmetadb.sqlite.gz
    """
