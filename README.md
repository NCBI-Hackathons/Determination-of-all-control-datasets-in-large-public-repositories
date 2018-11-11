---
slideOptions:
  transition: slide
---

# Putative GEO DataSet prediction

Murat Ozturk, Shuhei Sugai, Sergiusz Wesolowski, Luiz Irber


---

## Background

GEO submissions are organized as follows: 

The submitter submits **Samples** (GSM) that are associated with **Platforms** (GPL) and **Series** (GSE).

The series are then grouped into **DataSets** (GDS):

---

> A DataSet represents a curated collection of biologically and statistically comparable GEO Samples and forms the basis of GEO's suite of data display and analysis tools.

---

Furthermore: 

>Samples within a DataSet refer to the same Platform, that is, they share a common set of array elements.

---

>Value measurements for each Sample within a DataSet are assumed to be calculated in an equivalent manner, that is, considerations such as background processing and normalization are consistent across the DataSet.

---

Finally: 

> Not all submitted data are suitable for DataSet assembly and **we are experiencing a backlog in DataSet creation**, so **not all Series have corresponding DataSet record(s)**.

---

## Task 

Propose groups of Samples that are good candidates for DataSet assembly. (Putative DataSets?)

---

## Approach 

### Focus on less studied species 
  * Of the 104602 series in GEO, ~30k *Mus musculus* and ~44k *Homo sapiens*
  * So, not those.
  * There are 70 Series involving *Apis mellifera* but **no DataSets** 

---

### Experiments of the same type should be comparable 

  * More likely to be true for NGS type experiments
  * Platforms are machine specific, results should not be machine specific for HTS
  * We group by Series_type, which is a categorical variable
      * Focus on type "expression profiling by high throughput sequencing"


---

## Exploratory analysis


---


---

### Is the metadata consistent?

We are investiging key metadata fields and checking how consistent they are within a narrow the search results. Below we are showing of some key fields summary form a search result for all *Apis mellifera* (Honey bee) datasets at GEO. 

---

#### Experiment type

Obligatory field for grouping samples. Necessary to match when searching for control datasets

|Experiment type     | Counter   |
| ----               |   ----     |
|Expression profiling by high throughput sequencing'| 735|
|Other'|363|
|Expression profiling by array'|241|
|Non-coding RNA profiling by array'|95|
|Methylation profiling by high throughput sequencing'|41| 
|Genome binding/occupancy profiling by high throughput sequencing'|34|
|Non-coding RNA profiling by high throughput sequencing'|24|
|Methylation profiling by genome tiling array'|19|
|Expression profiling by genome tiling array'|12|
|Genome variation profiling by genome tiling array'|8| 
|Genome variation profiling by array'|2|
|Expression profiling by SAGE'|1|

---

#### Tax id

Even though the search specified full species name, the samples that we have found span 9 different tax-ids
| Tax_id     | Counter |
| --------   | -------- |
|7460     |1425     |
|7165     |40       |
|3067     |33       |
|7469     |24       |
|9606     |20      |
|3055     |14       |
|88217    |9        |
|4443     |8        |
|346610   |2        |

---

## Issues 
  
Normalization: 
Even when all metadata is consistent across samples, there is the issue of processing. At this point we'll have to look at the actual data and come up with an 'alignment scheme'

---

## Benchmark sets

https://www.ncbi.nlm.nih.gov/gds?term=%22expression%20profiling%20by%20high%20throughput%20sequencing%22%5BDataSet%20Type%5D
- Animals
Drosophila melanogaster (670)
Caenorhabditis elegans (286)
Macaca mulatta (107)
Apis mellifera (29)

---

- Fungi
Saccharomyces cerevisiae (402)
Schizosaccharomyces pombe (105)
Aspergillus fumigatus (19)

- Plants (only yummy ones!)
Arabidopsis thaliana (716)
Oryza sativa (163) <- rice
Vitis vinifera (40) <- grape

---

- Bacteria
Escherichia coli (249)
Staphylococcus aureus (66)
Synechococcus elongatus PCC 7942 (14)

- Viruses
Human gammaherpesvirus 8 (14)
