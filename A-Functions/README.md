# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## About the EASI Functions

### Installation of the Functions

EASI is not currently on CRAN or compiled as a package, but you can install the complete and current version of it by pasting the following line into R. The functions will automatically be available for use in analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")
```

Alternatively, you can paste the contents of the [**ALL_EASI_FUNCTIONS.R**](https://github.com/cwendorf/EASI/raw/master/A-Functions/ALL_EASI_FUNCTIONS.R) file directly into R. 

### Summary of the Functions

The EASI functions were written in five basic categories of analyses:
- **describeFunctions.R** (functions that help calculate basic descriptive statistics and matrices)
- **estimateFunctions.R** (functions that estimate confidence intervals for means and mean differences)
- **plotFunctions.R** (functions that plot confidence intervals for means and mean differences)
- **testFunctions.R** (functions that calculate NHST for means and mean differences)
- **effectFunctions.R** (functions that calculate confidence intervals for standardized effect sizes)

## Technical Details

### For Means, Mean Differences, and Contrasts

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.
- All intervals assume heterogenity of variance.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on Hedge's g.

## References

Goulet-Pelletier, J-C., & Cousineau, D. (2018). A review of effect sizes and their confidence intervals, Part I: The Cohen's d family. _The Quantitative Methods for Psychology_, _14_(4), 242-265.

Keppel, G., & Wickens, T. D. (2004). _Design and analysis: A researcher's handbook._ Upper Saddle River, NJ: Pearson Education.
