# Estimation Approach to Statistical Inference

[**Functions**](../A-Functions) | 
[**Tutorials**](../B-Tutorials) | 
[**Examples**](../C-Examples) | 
[**Advanced**](../D-Advanced)

---

## About the EASI Functions

### Installation of the Functions

[**_EASI-Functions.R_**](./EASI-Functions.R) incorporates all of the functions that constitute the original vision of EASI. The EASI functions were written to represent four basic categories of analyses:

- _estimate_ (`estimateMeans`,`estimateDifference`, and `estimateContrast` functions that estimate confidence intervals for means and mean differences)
- _plot_ (`plotMeans`, `plotDifference`, and `plotContrast` functions that plot confidence intervals for means and mean differences)
- _test_ (`testMeans`, `testDifference`, and `testContrast` functions that calculate NHST for means and mean differences)
- _standardize_ (`standardizeMeans`, `standardizeDifference`, and `standardizeContrast` functions that calculate confidence intervals for standardized effect sizes)

These functions are not currently on CRAN or compiled as a package, but you can install the complete and current version of it by pasting the following line into R. The functions will automatically be available for use in analyses.

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
```

### Installation of Available Extensions

EASI extentions are files that extend the functions beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:

[**_EASI-Analyze-Extension.R_**](./EASI-Analyze-Extension.R) (`analyzeMeans`, `analyzeDifference`, and `analyzeContrast` wrappers that combine the estimate, plot, test, and standardize functions for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Analyze-Extension.R")
```

[**_EASI-Summarize-Extension.R_**](./EASI-Summarize-Extension.R) (`summarizeData` and `plotData` functions for summary statistics, boxplots, and data plots for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Summarize-Extension.R")
```

[**_EASI-Omnibus-Extension.R_**](./EASI-Omnibus-Extension.R) (`describeOmnibus` functions that provide analysis of variance source tables for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Omnibus-Extension.R")
```

[**_EASI-Pairwise-Extension.R_**](./EASI-Pairwise-Extension.R) (`estimatePairwise`, `plotPairwise`, `testPairwise`, and `standardizePairwise` functions that produce unadjusted paiwise comparisons for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Pairwise-Extension.R")
```

[**_EASI-Relational-Extension.R_**](./EASI-Relational-Extension.R) (`estimateRelational` and `plotRelational` functions that produce functions that provide arelational (standard) and relational (comparative) intervals for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Relational-Extension.R")
```

[**_EASI-By-Extension.R_**](./EASI-By-Extension.R) (`estimateMeansBy`, `estimateDifferenceBy`, `estimateContrastBy`, `plotMeansBy`, `plotDifferenceBy`, `plotContrastBy`, `testMeansBy`, `testDifferenceBy`, `testContrastBy`, `standardizeMeansBy`, `standardizeDifferenceBy`, and `standardizeContrastBy` functions that apply the estimate, plot, test, and standardize function across levels of the second factor in a two-factor between-subjects or a mixed factorial design -- available only for data input and not summary statistics input)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")
```
