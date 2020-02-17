# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Paired Samples Example with Thomason Information

### Overview of this Example

The **Thomason** files analyze an example of a within-subjects design for two time points (from _[ITNS](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")_, Ch. 8). These analyses include the following:

- Analyses of Variable Differences (equivalent to a comparison analysis two instances of a variable)
- Analyses of Multiple Studies (examples from three different replication studies)

### Source the Functions

If the EASI package is not installed, the necessary functions can be sourced by pasting the following line into R:
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/easiFunctions.R")
```

### Files for this Example

[**_ThomasonDataExample.md_**](./ThomasonDataExample.md) combines the following files to describe the analyses using raw data input:

- [_ThomasonDataSyntax.R_](./ThomasonDataSyntax.R)
- [_ThomasonDataOutput.txt_](./ThomasonDataOutput.txt)
- [_ThomasonFigure1.jpeg_](./ThomasonFigure1.jpeg)
- [_ThomasonFigure2.jpeg_](./ThomasonFigure2.jpeg)
- [_ThomasonFigure3.jpeg_](./ThomasonFigure3.jpeg) 

[**_ThomasonSummaryExample.md_**](./ThomasonSummaryExample.md) combines the following files to describe the analyses using summary statistics input:

- [_ThomasonSummarySyntax.R_](./ThomasonSummarySyntax.R)
- [_ThomasonSummaryOutput.txt_](./ThomasonSummaryOutput.txt)
- [_ThomasonFigure1.jpeg_](./ThomasonFigure1.jpeg)
- [_ThomasonFigure2.jpeg_](./ThomasonFigure2.jpeg)
- [_ThomasonFigure3.jpeg_](./ThomasonFigure3.jpeg) 

> Note: Results of these analyses will differ slightly from those in _ITNS_. This is because ESCI and EASI make different statistical assumptions about the data. See the [**Functions**](../../Functions) page for more details.

### References

Cumming, G., & Calin-Jageman, R. (2017). _Introduction to the new statistics._ New York: Routledge.
