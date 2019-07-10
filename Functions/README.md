# Estimation Approach to Statistical Inference (EASI)

## About the EASI Functions

### Overview of the Functions

The EASI functions are in four basic files:
- **estimateFunctions.R** (scripts that estimate means, mean differences, and their confidence intervals)
- **plotFunctions.R** (scripts that plot means, mean differences, and their confidence intervals)
- **effectFunctions.R** (scripts that calculate standardized effect sizes and their confidence intervals)
- **testFunctions.R** (scripts that calculate NHST for means and mean differences)

All EASI scripts should be run prior to conducting analyses. In particular, the **estimateFunctions.R** file is particularly important, as the other functions make calls to these.

### For Means and Mean Differences

- Confidence intervals are based on the central t distribution.
- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on g.
- Confidence intervals are based on the noncentral t distribution.
