# Estimation Approach to Statistical Inference

[**Functions**](../Functions) | 
[**Tutorials**](../Tutorials) | 
[**Examples**](../Examples) | 
[**Advanced**](../Advanced)

---

## About the EASI Functions

### Installation of Basic Functions

[**_eassiFunctions.R_**](./easiFunctions.R) incorporates all of the functions that constitute the original vision of EASI. The EASI functions were written to represent four basic categories of analyses:

- _estimate_ (`estimateMeans`,`estimateDifference`, and `estimateContrast` functions that estimate confidence intervals for means, mean differences, and contrasts respectively)
- _plot_ (`plotMeans`, `plotDifference`, and `plotContrast` functions that plot confidence intervals for means, mean differences, and contrasts respectively)
- _test_ (`testMeans`, `testDifference`, and `testContrast` functions that calculate NHST for means, mean differences, and contrasts respectively)
- _standardize_ (`standardizeMeans`, `standardizeDifference`, and `standardizeContrast` functions that calculate confidence intervals for standardized effect sizes for individual means, mean differences, and contrasts respectively)

These functions are not currently on CRAN or compiled as a package, but you can install the complete and current version of it by pasting the following line into R. The functions will automatically be available for use in analyses.

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/Functions/easiFunctions.R")
```

### Installation of Available Extensions

EASI extentions are files that extend the functions beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:

[**_analyzeExtension.R_**](./analyzeExtension.R) (`analyzeMeans`, `analyzeDifference`, and `analyzeContrast` wrappers that combine the estimate, plot, test, and standardize functions for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/Functions/analyzeExtension.R")
```

[**_omnibusExtension.R_**](./omnibusExtension.R) (`describeOmnibus` functions that provide analysis of variance source tables for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/Functions/omnibusExtension.R")
```

[**_pairwiseExtension.R_**](./pairwiseExtension.R) (`estimatePairwise`, `plotPairwise`, `testPairwise`, and `standardizePairwise` functions that produce unadjusted paiwise comparisons for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/functions/pairwiseExtension.R")
```

[**_relationalExtension.R_**](./relationalExtension.R) (`estimateRelational` and `plotRelational` functions that produce functions that provide arelational (standard) and relational (comparative) intervals for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/Functions/relationalExtension.R")
```

[**_byExtension.R_**](./byExtension.R) (`estimateMeansBy`, `estimateDifferenceBy`, `estimateContrastBy`, `plotMeansBy`, `plotDifferenceBy`, `plotContrastBy`, `testMeansBy`, `testDifferenceBy`, `testContrastBy`, `standardizeMeansBy`, `standardizeDifferenceBy`, and `standardizeContrastBy` functions that apply the estimate, plot, test, and standardize function across levels of the second factor in a two-factor between-subjects or a mixed factorial design -- available only for data input and not summary statistics input)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/Functions/byExtension.R")
```

### Futher Reading

> [Technical Details](./TechnicalDetails.md) of the calculations used in EASI are available.
