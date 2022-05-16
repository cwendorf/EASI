
## Quick Start Guide

### About EASI

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Functions are generally limited to means (and functions of means), correlations, and regression coefficients
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Calculations run on the same underlying functions regardless of type of input
- Output utilizes consistent layouts and labeling across different types of analyses

### Implementation

EASI offers a general syntax for function calls. Each function is first comprised of a prefix (the verb that indicates what procedure should be conducted). These are the basic options (though more elaborate functions also exist):

- `describe` - describe the data with summary statistics
- `estimate` - estimate the statistic and its confidence interval
- `plot` - plot the descriptive statistics or the estimates
- `test` - test the estimates for statistical significance

Then the functions add an object (the noun that indicates the parameter or item to be analyzed). For example, these are the basic options for the analyses of means and mean differences (noting that functions for correlations, standardized mean difference, omnibus tests, and more also exist):

- `Means` - functions that examine all individual group or level means
- `MeanDifference` - functions that examine a difference among two group or level means
- `MeanContrast` - functions that examine a contrast among all of the group or level means
- `MeanComparison` - functions that examine a comparison among two group or level means (combines the `Means` and `MeanDifference` functions)


In R versions less than 4.1, the function name is followed by variable to be analyzed (or frame or formula, depending on the research design). Similarly, any relevant additional parameters (such as different confidence levels, null values, etc.) can be included.

```
etimateMeanDifference(Outcome)
etimateMeanDifference(Outcome,conf.level=.99)
```

In R versions => 4.1, the native pipe operator can be used instead. Here, the variable (or frame or formula) is included first, followed by the pipe operator, and then the function call (with any relevant additional parameters). 

```
(Outcome~Factor) |> estimateMeanComparison()
(Outcome~Factor) |> estimateMeanComparison(conf.level=.99)
```

### Usage

The package includes a wide variety of documentation, tutorials, and examples that demonstrate its use:

- [Tutorials from the Sourcebook](./tutorials) - Vingettes with tutorial data that show the diversity of basic options 
- [Examples from ITNS](./examples) - Reanalyses of published textbook examples highlighting the estimation approach 
- [Advanced Applications](./applications) - Advanced and experimental applications of the package
