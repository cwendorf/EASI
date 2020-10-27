## Technical Details

### Goals of the EASI Project

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Statistics are limited to means (and functions of means) and correlations
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Available functions encourage direct estimation of parameters of interest and discourage traditional approaches
- Calcuations run on the same underlying functions regardless of type of input
- Output utilizes a consistent layout across different types of analyses
- Plots limit the amount of information in order to focus on interval estimates and to be publication-ready

### Calculations and Explanations

For unstandardized effects (means, mean differences, and mean contrasts):

- All calculations assume heterogenity of variance (with no options for homogeniety of variance or pooled error terms)
- Confidence intervals are calculated independent of each other (i.e., they are not simultaneous)
- No corrections (Bonferroni, Tukey, etc.) for multiple intervals/contrasts are made

For standardized effect sizes:

- All effect sizes are calculated as standardized comparisons (Cohen's d) or as standardized contrasts (see Bonett, 2008)
- Confidence intervals for standardized comparisons and contrasts are based on Bonett's (2008) method

### References

Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. _Psychological Methods_, _13_(2), 99-109.
