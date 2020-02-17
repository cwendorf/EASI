# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## OneWay (Between-Subjects) Example with Rattan Information

### Overview of this Example

The **Rattan** files analyze an example of a single-factor between-subjects design (from _[ITNS](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")_, Ch. 14). These analyses include the following:

- Analyses of Mutiple Groups (equivalent to one-sample analyses for each level of a factor)
- Analyses of Group Differences (equivalent to a comparison analysis of two levels of a factor)
- Analyses of a Group Contrast (equivalent to a contrast analysis of all levels of a factor)

### Source the Functions

If the EASI package is not installed, the necessary functions can be sourced by pasting the following line into R:
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/easiFunctions.R")
```

### Files for this Example

[**_RattanDataExample.md_**](./RattanSummaryExample.md) combines the following files to describe the analyses using raw data input:

- [_RattanDataSyntax.R_](./RattanDataSyntax.R)
- [_RattanDataOutput.txt_](./RattanDataOutput.txt)
- [_RattanFigure1.jpeg_](./RattanFigure1.jpeg)
- [_RattanFigure2.jpeg_](./RattanFigure2.jpeg)
- [_RattanFigure3.jpeg_](./RattanFigure3.jpeg) 

[**_RattanSummaryExample.md_**](./RattanSummaryExample.md) combines the following files to describe the analyses using summary statistics input:

- [_RattanSummarySyntax.R_](./RattanSummarySyntax.R)
- [_RattanSummaryOutput.txt_](./RattanSummaryOutput.txt)
- [_RattanFigure1.jpeg_](./RattanFigure1.jpeg)
- [_RattanFigure2.jpeg_](./RattanFigure2.jpeg)
- [_RattanFigure3.jpeg_](./RattanFigure3.jpeg) 

> Note: Results of these analyses will differ slightly from those in _ITNS_. This is because ESCI and EASI make different statistical assumptions about the data. See the [**Functions**](../../Functions) page for more details.

### References

Cumming, G., & Calin-Jageman, R. (2017). _Introduction to the new statistics._ Routledge.
