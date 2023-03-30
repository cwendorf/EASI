
## Quick Start Guide

### About EASI

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Functions are generally limited to means (and functions of means), correlations, and regression coefficients
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Calculations run on the same underlying functions regardless of type of input
- Output utilizes consistent layouts and labeling across different types of analyses

### Function Calls

In EASI, each different type of analysis consists of a unique function call. Using standard R syntax, the function name is followed in parentheses by the variable to be analyzed (or data frame or formula, depending on the research design). Similarly, any relevant additional parameters (such as different confidence levels, null values, etc.) can be included. This format is used in the basic tutorials and textbook examples, but could be used for all cases.

```
estimateMeanComparison(Outcome~Factor)
estimateMeanComparison(Outcome~Factor,conf.level=.99)
testMeanComparison(Outcome~Factor)
testMeanComparison(Outcome~Factor,mu=2)
```

In R versions 4.1 and greater, the native pipe operator can be used instead of standard syntax. Here, the variable (or data frame or formula) is included first, followed by the pipe operator, and then the function call (with any relevant additional parameters in parentheses). This format is used for advanced applications, but could be used for all cases if desired.

```
(Outcome~Factor) |> estimateMeanComparison()
(Outcome~Factor) |> estimateMeanComparison(conf.level=.99)
(Outcome~Factor) |> testMeanComparison()
(Outcome~Factor) |> testMeanComparison(mu=2)
```

EASI also offers methods for formatting the table output. Generally, the default options provide a table title that describes the type of analysis conducted (consistent with the function call), numbers rounded to three digits, and columns with consistent spacing. Tables with less formatting can be produced by preceding the function call with a period. Numbers in tables (and plots) can be rounded to a different number of digits. Table (and plot) titles can be customized within the call.

```
.estimateMeanComparison(Outcome~Factor)
estimateMeanComparison(Outcome~Factor,digits=2)
estimateMeanComparison(Outcome~Factor,main="Custom Table Title")
```

### Details and Examples

The package includes a wide variety of tutorials, examples, and applications that demonstrate its use:

- [Details of the Functions](./functions) - A manual describing the functions and their available options
- [Tutorials from the Sourcebook](./tutorials) - Vignettes with tutorial data that show the basic options 
- [Examples from ITNS](./examples) - Reanalyses of published textbook examples that highlight the estimation approach 
- [Advanced Applications](./applications) - Advanced and experimental applications of the package
