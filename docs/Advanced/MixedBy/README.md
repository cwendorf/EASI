# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial

### Overview of this Example

The **MixedBy** files analyze an example of a a mixed (between-subjects and within-subjects) design by applying the estimate, plot, test, and standardize functions for a within-subjects factor separately at levels of the between-subjects factor. These analyses include the following:

- Analyses of Mutiple Variables (equivalent to one-sample analyses for each instance of a variable, seaprately at levels of the between-subjects factor)
- Analyses of Variable Differences (equivalent to a comparison analysis two instances of a variable, seaprately at levels of the between-subjects factor)
- Analyses of a Variable Contrast (equivalent to a contrast analysis of all instances of a variable, seaprately at levels of the between-subjects factor)

### Source the Functions and Extension

If the EASI package is not installed, the necessary fucntions and extension can be sourced by pasting the following lines into R:
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/easiFunctions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/byExtension.R")
```

### Details of this Example
 
[_**MixedByDataExample.md**_](./MixedByDataExample.md) combines the following files to describe the analyses using raw data input:

- [_MixedByDataSyntax.R_](./MixedByDataSyntax.R)
- [_MixedByDataOutput.txt_](./MixedByDataOutput.txt)
- [_MixedByFigure1.jpeg_](./MixedByFigure1.jpeg)
- [_MixedByFigure2.jpeg_](./MixedByFigure2.jpeg)
- [_MixedByFigure3.jpeg_](./MixedByFigure3.jpeg)
- [_MixedByFigure4.jpeg_](./MixedByFigure4.jpeg)
- [_MixedByFigure5.jpeg_](./MixedByFigure5.jpeg)
- [_MixedByFigure6.jpeg_](./MixedByFigure6.jpeg)
- [_MixedByFigure7.jpeg_](./MixedByFigure7.jpeg)
- [_MixedByFigure8.jpeg_](./MixedByFigure8.jpeg)
- [_MixedByFigure9.jpeg_](./MixedByFigure9.jpeg)
- [_MixedByFigure10.jpeg_](./MixedByFigure10.jpeg)
- [_MixedByFigure11.jpeg_](./MixedByFigure11.jpeg)
- [_MixedByFigure12.jpeg_](./MixedByFigure12.jpeg)

[_**MixedBySummaryExample.md**_](./MixedBySummaryExample.md) combines the following files to describe the analyses using summary statistics input:

- [_MixedBySummarySyntax.R_](./MixedBySummarySyntax.R)
- [_MixedBySummaryOutput.txt_](./MixedBySummaryOutput.txt)
- [_MixedByFigure1.jpeg_](./MixedByFigure1.jpeg)
- [_MixedByFigure2.jpeg_](./MixedByFigure2.jpeg)
- [_MixedByFigure3.jpeg_](./MixedByFigure3.jpeg)
- [_MixedByFigure4.jpeg_](./MixedByFigure4.jpeg)
- [_MixedByFigure5.jpeg_](./MixedByFigure5.jpeg)
- [_MixedByFigure6.jpeg_](./MixedByFigure6.jpeg)
- [_MixedByFigure7.jpeg_](./MixedByFigure7.jpeg)
- [_MixedByFigure8.jpeg_](./MixedByFigure8.jpeg)
- [_MixedByFigure9.jpeg_](./MixedByFigure9.jpeg)
- [_MixedByFigure10.jpeg_](./MixedByFigure10.jpeg)
- [_MixedByFigure11.jpeg_](./MixedByFigure11.jpeg)
- [_MixedByFigure12.jpeg_](./MixedByFigure12.jpeg)

### References

Wendorf, C. A. (2019). _Statistics for social science: A sourcebook of basic statistical methods._ [https://www4.uwsp.edu/psych/cw/statistics/sourcebook.htm](https://www4.uwsp.edu/psych/cw/statistics/sourcebook.htm)
