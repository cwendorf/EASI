# Estimation Approach to Statistical Inference (EASI)

## Extensions of the Basic EASI Functions

### Overview of the Extensions

EASI extentions are functions that go beyond the original vision for EASI. The EASI extensions parallel the four basic function files by adding the following:
- **estimateExtensions.R** (scripts that estimate confidence intervals for sets of built-in contrasts and pairwise comparisons)
- **plotExtensions.R** (scripts that plot onfidence intervals for sets of built-in contrasts and pairwise comparisons)
- **effectExtensions.R** (scripts that calculate standardized effect sizes and confidence intervals for sets of built-in contrasts and pairwise comparisons)
- **testExtensions.R** (scripts that calculate NHST for for sets of built-in contrasts and pairwise comparisons)

### Installation of the Functions

EASI is not currently on CRAN or compiled as a package, but you can install it by pasting the text of the scripts about directly into R.

All EASI scripts should be run prior to conducting analyses. Because these are extensions, the basic Functions should also pasted into R.

## Technical Details

### For Means and Mean Differences

- Confidence intervals are based on the central t distribution.
- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous).
- No adjustments for multiple intervals have been made.

### For Standardized Effect Sizes

- Both Cohen's d and Hedge's g are presented.
- Confidence intervals are centered on g.
- Confidence intervals are based on the noncentral t distribution.
