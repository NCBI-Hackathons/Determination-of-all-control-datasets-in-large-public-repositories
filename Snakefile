rule download_geo:
    shell: """
        wget -P data/geo_all/series -m -nH --cut-dirs=2 ftp://ftp.ncbi.nlm.nih.gov/geo/series
    """

rule download_geo_apis_series_summary:
    output: 'data/apis_series_summary.txt'
    run:
        from Bio import Entrez
        Entrez.email = 'ncbihackathons@gmail.com'
        handle = Entrez.esearch('gds', '"Apis mellifera"[porgn] AND "gse"[ETYP]', retmax=100000) 
        record = Entrez.read(handle)
        results = Entrez.efetch(db='gds', id=record['IdList']) 
        with open(output[0], 'w') as f:
            f.write(results.read())

rule download_geo_apis_series:
    input: 'data/apis_series_summary.txt'
    shell: """
        wget -m -nH --cut-dirs=1 -P data/apis_series -i <(grep ftp {input} | rev | cut -d' ' -f 1 | rev)
    """

# https://www.ncbi.nlm.nih.gov/gds?term=%22Apis%20mellifera%22%5Bporgn%5D%20AND%20%22gse%22%5BFilter%5D&cmd=DetailsSearch
