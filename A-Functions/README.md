# Estimation Approach to Statistical Inference (EASI)

## About the EASI Functions

### Overview of the Functions

The EASI functions were written in four basic categories of analyses:
- **describeFunctions.R** (sccripts that calculate basic descriptive statistics and matrices)
- **estimateFunctions.R** (scripts that estimate means, mean differences, and their confidence intervals)
- **plotFunctions.R** (scripts that plot means, mean differences, and their confidence intervals)
- **testFunctions.R** (scripts that calculate NHST for means and mean differences)
- **effectFunctions.R** (scripts that calculate standardized effect sizes and their confidence intervals)

### Installation of the Functions

EASI is not currently on CRAN or compiled as a package, but you can install it by pasting the contents of the [**ALL_FUNCTIONS.R**](./ALL_FUNCTIONS.R) file directly into R. This should be done prior to conducting analyses. 

## Technical Details

### For Means, Mean Differences, and Contrasts

- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.
- All intervals assume heterogenity of variance.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on Hedge's g.

## References

Goulet-Pelletier, J.C., & Cousineau, D. (2018). A review of effect sizes and their confidence intervals, Part I: The Cohen’s d family. _Quantitative Methods in Psycholology, 14,_ 242–265.