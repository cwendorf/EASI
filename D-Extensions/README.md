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
source("http://raw.githubusercontent.com/cwendorf/EASI/master/D-Extensions/ALL_EASI_EXTENSIONS.R")
```

Alternatively, you can paste the contents of the [**ALL_EASI_EXTENSIONS.R**](https://github.com/cwendorf/EASI/raw/master/D-Extensions/ALL_EASI_EXTENSIONS.R) file directly into R. 

The basic EASI functions also must be installed in order for the extensions to operate properly.

### Overview of the Extensions

EASI extentions are functions that go beyond the original vision for EASI. The EASI extensions parallel the basic categories of analyses but add the following:
- **estimateExtensions.R** (functions that estimate confidence intervals for pairwise comparisons)
- **plotExtensions.R** (functions that plot onfidence intervals for pairwise comparisons)
- **testExtensions.R** (functions that calculate NHST for pairwise comparisons)
- **standardizeExtensions.R** (functions that calculate confidence intervals for pairwise comparison effect sizes)

## Technical Details

### For Pairwise Comparisons

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.
- All intervals assume heterogenity of variance.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on Hedge's g.

## References

Cousineau, D. (2017). Varieties of confidence intervals. _Advances in Cognitive Psychology_, _13_(2), 140-155.

Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. _Methodology_, _8_(4), 125-133.
