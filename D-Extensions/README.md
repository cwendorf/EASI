# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Extensions of the EASI Functions

### Overview of the Extensions

EASI extentions are functions that go beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:
- **estimateExtensions.R** (functions that estimate confidence intervals for pairwise comparisons)
- **plotExtensions.R** (functions that plot onfidence intervals for pairwise comparisons)
- **testExtensions.R** (functions that calculate NHST for pairwise comparisons)
- **effectExtensions.R** (functions that calculate standardized effect sizes and confidence intervals for pairwise comparisons)

### Installation of the Functions and Extensions

Like the basic EASI functions, the EASI extentions are not currently on CRAN or compiled as a package. You can install the complete and current extensions file by pasting the following line into R. The functions will automatically be available for use in analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/D-Extensions/ALL_EASI_EXTENSIONS.R")
```

Alternatively, you can paste the contents of the [**ALL_EASI_EXTENSIONS.R**](https://github.com/cwendorf/EASI/raw/master/D-Extensions/ALL_EASI_EXTENSIONS.R) file directly into R. 

The basic EASI functions also must be installed in order for the extensions to operate properly.
