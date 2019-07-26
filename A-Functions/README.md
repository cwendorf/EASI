# Estimation Approach to Statistical Inference (EASI)

## About the EASI Functions

### Overview of the Functions

The EASI functions are in four basic files:
- **estimateFunctions.R** (scripts that estimate means, mean differences, and their confidence intervals)
- **plotFunctions.R** (scripts that plot means, mean differences, and their confidence intervals)
- **effectFunctions.R** (scripts that calculate standardized effect sizes and their confidence intervals)
- **testFunctions.R** (scripts that calculate NHST for means and mean differences)

### Installation of the Functions

EASI is not currently on CRAN or compiled as a package, but you can install it from GitHub by pasting the text of the scripts about directly into R.

All EASI scripts should be run prior to conducting analyses. In particular, the **estimateFunctions.R** file is especially important, as the other functions make calls to these functions.

## Technical Details

### For Means and Mean Differences

- Confidence intervals are based on the central t distribution.
- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.
- Unlike other implementations of the "new statistics", all intervals assume heterogenity of variance.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on Hedge's g.
- Confidence intervals are based on the noncentral t distribution.