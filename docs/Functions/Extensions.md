# Estimation Approach to Statistical Inference

[**Functions**](../Functions) | 
[**Tutorials**](../Tutorials) | 
[**Examples**](../Examples) | 
[**Advanced**](../Advanced)

---

## About the EASI Extensions

### Installation of the Extensions

If the package is installed using the following procedure, then all extensions are automatically installed.

``` r
install.packages("devtools")
devtools::install_github("cwendorf/EASI",build=FALSE)
library(EASI)
```

If the entire package is not installed, the extensions can be individually installed by pasting the appropriate lines into R.

### Summary of the Available Extensions

EASI extentions are files that extend the functions beyond the original vision for EASI. The EASI extensions parallel the primary categories of analyses but add the following:

**_analyzeExtension_** (`analyzeMeans`, `analyzeDifference`, and `analyzeContrast` wrappers that combine the estimate, plot, test, and standardize functions for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/analyzeExtension.R")
```

**_omnibusExtension_** (`describeOmnibus` functions that provide analysis of variance source tables for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/omnibusExtension.R")
```

**_pairwiseExtension_** (`estimatePairwise`, `plotPairwise`, `testPairwise`, and `standardizePairwise` functions that produce unadjusted paiwise comparisons for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/pairwiseExtension.R")
```

**_relationalExtension_** (`estimateRelational` and `plotRelational` functions that produce functions that provide arelational (standard) and relational (comparative) intervals for single-factor between- and within-subjects designs)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/relationalExtension.R")
```

**_byExtension_** (`estimateMeansBy`, `estimateDifferenceBy`, `estimateContrastBy`, `plotMeansBy`, `plotDifferenceBy`, `plotContrastBy`, `testMeansBy`, `testDifferenceBy`, `testContrastBy`, `standardizeMeansBy`, `standardizeDifferenceBy`, and `standardizeContrastBy` functions that apply the estimate, plot, test, and standardize function across levels of the second factor in a two-factor between-subjects or a mixed factorial design -- available only for data input and not summary statistics input)
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/R/byExtension.R")
```
