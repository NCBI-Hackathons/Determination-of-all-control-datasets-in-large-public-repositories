# Putative GEO DataSet prediction

Murat Ozturk, Shuhei Sugai, Sergiusz Wesolowski, Luiz Irber

---

## The original task?

Determination of all 'control' samples in public repositories of genomic data.

---

## How we abandoned SRA and moved to GEO

### SRA Issues:

1. No clear SRA metadata format guidelines.
2. Notoriously non-standard metadata as a result.
3. Control-informative fields are especially sparse (treatment, disease, tumor, affection_status)

---

### Switching to a new task on GEO

Automate process of aggregating samples into comparable DataSets.

> A DataSet represents a curated collection of biologically and statistically comparable GEO Samples and forms the basis of GEO's suite of data display and analysis tools.

---

#### Motivation

DataSet curation is manual and backlogged. 

**NGS experiments should be comparable**

  * Platforms are machine specific, results should not be machine specific 
  * We group by Series_type, which is a categorical variable
      * Focus on type "expression profiling by high throughput sequencing"

---

### Data source

- Apis mellifera"[porgn:__txid7460]"
- Expression profiling by high throughput sequencing
- 735 Samples (70 Series)

---

### Automatic curation: Samples ->  DataSets

- Same Platform
- Same organism
- Same experiment type
- Same calibration (hopefully)

---
### Practical problems 

Even though the search specified full species name, the samples that we have found span 9 different tax-ids

![](https://i.imgur.com/tdk2DtT.png)


### Dead End (again):

- **none of the *Apis mellifera* samples had structured expression data**.
- It turns out, GEO does not have a standard for submitting high throughput sequencing data. 
- Raw data is deposited to SRA and any processed data is included in 'supplementary data' in free format.
- 
---

We seem to have indepently discovered what is in the GEO FAQ:

>Processed sequence data files: GEO hosts processed sequence data files, which are linked at the bottom of Sample and/or Series records as supplementary files. **Requirements for processed data files are not yet fully standardized** and will depend on the nature of the study, but data typically include genome tracks or expression counts.

---

### Not many genes in common


![](https://i.imgur.com/30HN4ZA.png)

```
 ('CM000063FS008065472', 3),
 ('CH877218FS000002636', 3),
 ('CM000059FS001816901', 3),
 ('CM000063FS006342682', 3),
```
---
## Conclusion

Our struggles indicate that the problem exists and current data repositories have strucutre far from perfect. To enable the full potential of such resources there must be a reliable way of searching and grouping the samples based on the metadata.

1. Enforce more strict rules on sample submission format with reliable metadata
2. Build a metadata search engine capable of identifying potential mislabling and inconsistencies in the submissions
3. Finally build a sample assembler that will allow the used to find "closest" match control samples for his/her experiment.
