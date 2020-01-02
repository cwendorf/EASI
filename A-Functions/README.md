# EASI: Estimation Approach to Statistical Inference

[**Home**](../EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/D-ExtensionExamples)

---

## About the EASI Functions

### Installation of the Functions

[**_ALL-EASI-FUNCTIONS.R_**](./ALL-EASI-FUNCTIONS.R) incorporates all of the functions that constitute the original vision of EASI. The EASI functions were written to represent four basic categories of analyses:

- _estimate_ (`estimateMeans`,`estimateDifference`, and `estimateContrast` functions that estimate confidence intervals for means and mean differences)
- _plot_ (`plotMeans`, `plotDifference`, and `plotContrast` functions that plot confidence intervals for means and mean differences)
- _test_ (`testMeans`, `testDifference`, and `testContrast` functions that calculate NHST for means and mean differences)
- _standardize_ (`standardizeMeans`, `standardizeDifference`, and `standardizeContrast` functions that calculate confidence intervals for standardized effect sizes)

These functions are not currently on CRAN or compiled as a package, but you can install the complete and current version of it by pasting the following line into R. The functions will automatically be available for use in analyses.

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
```


### Installation of Available Extensions

EASI extentions are files that extend the functions beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:


[**_summaryExtension.R_**](./summaryExtension.R) (`summarizeData` and `plotData` functions for summary statistics, boxplots, and data plots for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/summaryExtension.R")
```

[**_omnibusExtension.R_**](./omnibusExtension.R) (`describeOmnibus` functions that provide analysis of variance source tables for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/omnibusExtension.R")
```

[**_pairwiseExtension.R_**](./pairwiseExtension.R) (`estimatePairwise`, `plotPairwise`, `testPairwise`, and `standardizePairwise` functions that produce unadjusted paiwise comparisons for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/pairwiseExtension.R")
```

[**_relationalExtension.R_**](./relationalExtension.R) (`estimateRelational` and `plotRelational` functions that produce functions that provide arelational (standard) and relational (comparative) intervals for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/relationalExtension.R")
```

[**_analyzeExtension.R_**](./analyzeExtension.R) (`analyzeMeans`, `analyzeDifference`, and `analyzeContrast` wrappers that combine the estimate, plot, test, and standardize functions for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/analyzeExtension.R")
```

[**_byExtension.R_**](./byExtension.R) (`estimateMeansBy`, `estimateDifferenceBy`, `estimateContrastBy`, `plotMeansBy`, `plotDifferenceBy`, `plotContrastBy`, `testMeansBy`, `testDifferenceBy`, `testContrastBy`, `standardizeMeansBy`, `standardizeDifferenceBy`, and `standardizeContrastBy` functions that apply the estimate, plot, test, and standardize function across levels of the second factor in a two-factor between-subjects or a mixed factorial design -- available only for data input and not summary statistics input)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/byExtension.R")
```

## Technical Details

### For Means, Mean Differences, and Contrasts

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No alpha adjustments for multiple intervals have been made
- All calculations assume heterogenity of variance (see Keppel & Wickens, 2004)

### For Standardized Effect Sizes

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett (2008)

## References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.

Keppel, G., & Wickens, T. D. (2004). _Design and analysis: A researcher's handbook._ Upper Saddle River, NJ: Pearson Education.
