# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Extensions of the EASI Functions

### Installation of the Functions and Extensions

Like the basic EASI functions, the EASI extentions are not currently on CRAN or compiled as a package. You can install the complete and current extensions file by pasting the following line into R. The functions will automatically be available for use in analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/D-Extensions/ALL-EASI-EXTENSIONS.R")
```

Alternatively, you can paste the contents of the [**ALL-EASI-EXTENSIONS.R**](https://github.com/cwendorf/EASI/raw/master/D-Extensions/ALL-EASI-EXTENSIONS.R) file directly into R. 

The basic EASI functions also must be installed in order for the extensions to operate properly.

### Overview of the Extensions

EASI extentions are functions that go beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:

- **estimateExtensions.R** (functions that estimate confidence intervals for pairwise comparisons)
- **plotExtensions.R** (functions that plot onfidence intervals for pairwise comparisons)
- **testExtensions.R** (functions that calculate NHST for pairwise comparisons)
- **standardizeExtensions.R** (functions that calculate confidence intervals for pairwise comparison effect sizes)

## Technical Details

### For Pairwise Comparisons

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No alpha adjustments for multiple intervals have been made
- All calculations assume heterogenity of variance (see Keppel & Wickens, 2004)

### For Standardized Effect Sizes

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett (2008)

## References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.

Keppel, G., & Wickens, T. D. (2004). _Design and analysis: A researcher's handbook._ Upper Saddle River, NJ: Pearson Education.
