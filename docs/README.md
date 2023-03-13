
## Quick Start Guide

### About EASI

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Functions are generally limited to means (and functions of means), correlations, and regression coefficients
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Calculations run on the same underlying functions regardless of type of input
- Output utilizes consistent layouts and labeling across different types of analyses

### Implementation

EASI offers a general syntax for function calls. Each function is first comprised of a prefix (the verb that indicates what procedure should be conducted). Then the functions add an object (the noun that indicates the parameter or item to be analyzed). 

In standard R syntax, the function name is followed in parentheses by the variable to be analyzed (or frame or formula, depending on the research design). Similarly, any relevant additional parameters (such as different confidence levels, null values, etc.) can be included. This format is used in the basic tutorials and textbook examples, but could be used for all cases.

```
estimateMeanComparison(Outcome~Factor)
estimateMeanComparison(Outcome~Factor,conf.level=.99)
testMeanComparison(Outcome~Factor)
testMeanComparison(Outcome~Factor,mu=2)
```

In R versions => 4.1, the native pipe operator can be used instead of standard syntax. Here, the variable (or frame or formula) is included first, followed by the pipe operator, and then the function call (with any relevant additional parameters in parentheses). This format is used for advanced applications, but could be used for all cases if desired.

```
(Outcome~Factor) |> estimateMeanComparison()
(Outcome~Factor) |> estimateMeanComparison(conf.level=.99)
(Outcome~Factor) |> testMeanComparison()
(Outcome~Factor) |> testMeanComparison(mu=2)
```

### Usage

The package includes a wide variety of tutorials, examples, and applications that demonstrate its use:

- [Details of the Functions](./functions) - A manual describing the functions and their available options
- [Tutorials from the Sourcebook](./tutorials) - Vignettes with tutorial data that show the basic options 
- [Examples from ITNS](./examples) - Reanalyses of published textbook examples that highlight the estimation approach 
- [Advanced Applications](./applications) - Advanced and experimental applications of the package
