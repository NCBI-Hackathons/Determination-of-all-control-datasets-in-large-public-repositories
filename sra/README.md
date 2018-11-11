---
slideOptions:
  transition: slide
---

# Filtering 'control' datasets

Murat Ozturk, Shuhei Sugai, Sergiusz Wesolowski, Luiz Irber

---

## Task 

User submits a SRA query, we filter the results down to identify likely 'control' datasets.

---

## SRA metadata fields

- https://edwards.sdsu.edu/research/sra-metadata/

- https://edwards.sdsu.edu/research/sra-attributes/

---

![](https://www.ncbi.nlm.nih.gov/core/assets/sra/images/anatomy_of_SRA_submission.png)

---

## Biosample submission guidelines

https://submit.ncbi.nlm.nih.gov/biosample/template/

Required fields depend on the 'packet' used for the sample (plant, microbial, invertebrate, human etc.)

---

# Plan
Use the metadata of the SRA files to define control samples
1 Build general query using input from user
2. Submit query to SRA API, get all results
3. Extract the fields that indicate "control" status of a sample
4. Filter according to 'heurstics' we will generate based on exploratory analysis -- ideally there would be a model but proabably not


---

## Issues:

1. NO Clear SRA metadata format guidelines.
2. Notorious Mislabelling.
3. Fields that looked like a good candidates have very sparse data (treatment, disease, tumor, affection_status)
4. #$%@#%$&@*$ 

---


## Fields possibly informative on 'control' status

Experiment  <- important description
LibraryName <- pops as important
ScientificName <- pops as important
SampleName <- pops as important
Histological_Type <-pops as important
Disease
Tumor
Affection_Status

---

## Other fields we'd like to keep

Run (it's the accession number; return value)
avgLength
size_MB
Platform
Model

---
## Aliases of "control" fields
['submission_alias', 'submission_comment', 'center_name', 'lab_name']
['study_alias', 'study_title', 'study_abstract', 'center_name', 'center_project_name', 'study_description', 'study_url_link', 'study_attribute']

---
## not useful

~~ReleaseDate~~
~~LoadDate~~
~~spots~~
~~bases~~
~~spots_with_mates~~
~~AssemblyName~~
~~download_path~~
~~LibraryStrategy~~
~~LibrarySelection~~
~~LibrarySource~~
~~LibraryLayout~~
InsertSize
~~InsertDev~~
~~SRAStudy~~
~~BioProject~~
~~Study_Pubmed_id~~
~~ProjectID~~
Sample
BioSample
~~SampleType~~
~~TaxID~~
~~g1k_pop_code~~
source
~~g1k_analysis_group~~
~~Subject_ID~~
~~Sex~~
Disease 
Tumor 
Affection_Status
Analyte_Type
~~Body_Site~~
~~CenterName~~
~~Submission~~
~~dbgap_study_accession~~
~~Consent~~
~~RunHash~~
~~ReadHash~~

## All fields

Run
ReleaseDate
LoadDate
spots
bases
spots_with_mates
avgLength
size_MB
AssemblyName
download_path
Experiment
LibraryName
LibraryStrategy
LibrarySelection
LibrarySource
LibraryLayout
InsertSize
InsertDev
Platform
Model
SRAStudy
BioProject
Study_Pubmed_id
ProjectID
Sample
BioSample
SampleType
TaxID
ScientificName
SampleName
g1k_pop_code
source
g1k_analysis_group
Subject_ID
Sex
Disease
Tumor
Affection_Status
Analyte_Type
Histological_Type
Body_Site
CenterName
Submission
dbgap_study_accession
Consent
RunHash
ReadHash

---

## Examples
Control:
Whole genome Illumina MiSeq sequence of Salmonella enterica
https://www.ncbi.nlm.nih.gov/sra/SRX5000157[accn]

---

Not control:
Other Sequencing of Salmonella enterica
https://www.ncbi.nlm.nih.gov/sra/SRX4948026[accn]
Gut microbiota of pigs challenged with Salmonella and administered chlortetracycline
https://www.ncbi.nlm.nih.gov/sra/SRX4375761[accn]

---

Difference of the two examples above:
 - In "Not control", most of the important information are missing, such as
-Collection date ( < Attributes < Sample)
-These are not necessary but important to "smell genuine"
 - Title are generally concise in "Control" (< Experiment field in metadata)

---

## Organization

- snakemake pipeline
- using jupyterlab for exploration
    - and spacemacs in orgmode?
- bioconda for deps
- hackmd for notes (and presentation!)