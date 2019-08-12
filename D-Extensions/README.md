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

EASI extentions are functions that go beyond the original vision for EASI. The EASI extensions parallel the four basic categories of analyses but add the following:
- **estimateExtensions.R** (scripts that estimate confidence intervals for pairwise comparisons and sets of built-in contrast codes)
- **plotExtensions.R** (scripts that plot onfidence intervals for pairwise comparisons and sets of built-in contrast codes)
- **testExtensions.R** (scripts that calculate NHST for pairwise comparisons and sets of built-in contrast codes)
- **effectExtensions.R** (scripts that calculate standardized effect sizes and confidence intervals for pairwise comparisons and sets of built-in contrast codes)

### Installation of the Functions and Extensions

Like the basic EASI functions, the EASI extentions are not currently on CRAN or compiled as a package. You can install the complete and current extensions file by pasting the following line into R. The scripts will automatically be available for use in analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/D-Extensions/ALL_EASI_EXTENSIONS.R")
```

Alternatively, you can paste the contents of the [**EASI_EXTENSIONS.R**](https://github.com/cwendorf/EASI/raw/master/D-Extensions/ALL_EASI_EXTENSIONS.R) file directly into R. 

The basic EASI functions must be installed in order for the extensions to operate properly.

## References

Wendorf, C.A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. _Methodology, 8_(4), 125-133.
