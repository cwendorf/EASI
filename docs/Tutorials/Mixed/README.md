# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Mixed Design (Between-Subjects and Within-Subjects) Tutorial

### Overview of this Example

The **Mixed** files analyze an example of a a mixed (between-subjects and within-subjects) design  (from Wendorf, 2019) by applying the estimate, plot, test, and standardize functions for a within-subjects factor separately at levels of the between-subjects factor. These analyses include the following:

- Analyses of Mutiple Variables (equivalent to one-sample analyses for each instance of a variable, seaprately at levels of the between-subjects factor)
- Analyses of Variable Differences (equivalent to a comparison analysis two instances of a variable, seaprately at levels of the between-subjects factor)
- Analyses of a Variable Contrast (equivalent to a contrast analysis of all instances of a variable, seaprately at levels of the between-subjects factor)

### Source the Functions

If the EASI package is not installed, the necessary functions can be sourced by pasting the following line into R:
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/easiFunctions.R")
```

### Files for this Example

[**_MixedDataExample.md_**](./MixedDataExample.md) combines the following files to describe the analyses using raw data input:

- [_MixedDataSyntax.R_](./MixedDataSyntax.R)
- [_MixedDataOutput.txt_](./MixedDataOutput.txt)
- [_MixedFigure1.jpeg_](./MixedFigure1.jpeg)
- [_MixedFigure2.jpeg_](./MixedFigure2.jpeg)
- [_MixedFigure3.jpeg_](./MixedFigure3.jpeg) 
- [_MixedFigure4.jpeg_](./MixedFigure4.jpeg)
- [_MixedFigure5.jpeg_](./MixedFigure5.jpeg)
- [_MixedFigure6.jpeg_](./MixedFigure6.jpeg)
- [_MixedFigure7.jpeg_](./MixedFigure7.jpeg) 
- [_MixedFigure8.jpeg_](./MixedFigure8.jpeg)
- [_MixedFigure9.jpeg_](./MixedFigure9.jpeg)
- [_MixedFigure10.jpeg_](./MixedFigure10.jpeg)
- [_MixedFigure11.jpeg_](./MixedFigure11.jpeg) 
- [_MixedFigure12.jpeg_](./MixedFigure12.jpeg)

[**_MixedSummaryExample.md_**](./MixedSummaryExample.md) combines the following files to describe the analyses using summary statistics input:

- [_MixedSummarySyntax.R_](./MixedSummarySyntax.R)
- [_MixedSummaryOutput.txt_](./MixedSummaryOutput.txt)
- [_MixedFigure1.jpeg_](./MixedFigure1.jpeg)
- [_MixedFigure2.jpeg_](./MixedFigure2.jpeg)
- [_MixedFigure3.jpeg_](./MixedFigure3.jpeg) 
- [_MixedFigure4.jpeg_](./MixedFigure4.jpeg)
- [_MixedFigure5.jpeg_](./MixedFigure5.jpeg)
- [_MixedFigure6.jpeg_](./MixedFigure6.jpeg)
- [_MixedFigure7.jpeg_](./MixedFigure7.jpeg) 
- [_MixedFigure8.jpeg_](./MixedFigure8.jpeg)
- [_MixedFigure9.jpeg_](./MixedFigure9.jpeg)
- [_MixedFigure10.jpeg_](./MixedFigure10.jpeg)
- [_MixedFigure11.jpeg_](./MixedFigure11.jpeg) 
- [_MixedFigure12.jpeg_](./MixedFigure12.jpeg)

### References

Wendorf, C. A. (2019). _Statistics for social science: A sourcebook of basic statistical methods._ [https://www4.uwsp.edu/psych/cw/statistics/sourcebook.htm](https://www4.uwsp.edu/psych/cw/statistics/sourcebook.htm)
