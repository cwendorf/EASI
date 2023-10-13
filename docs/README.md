
## Quick Start Guide

### About EASI

EASI was designed to offer a simple, intuitive, and consistent way to implement estimation statistics in R. The following goals set the scope of the project:

- Functions are generally limited to means (and functions of means), correlations, and regression coefficients
- Analyses can be conducted using either raw data or summary statistics (means, standard deviations, and correlations)
- Calculations run on the same underlying functions regardless of type of input
- Output utilizes consistent layouts and labeling across different types of analyses

### Function Calls

In EASI, each different type of analysis consists of a unique function call. Using standard R syntax, the function name is followed in parentheses by the variables to be analyzed. Similarly, any relevant additional parameters (such as different confidence levels, null values, etc.) can be included. This format is used in the basic tutorials and textbook examples included with EASI, but could be used for all cases.

```
estimateMeans(Outcome~Factor)
estimateMeans(Outcome~Factor,conf.level=.99,main="Custom Table Title",digits=2)
plotMeans(Outcome~Factor)
plotMeans(Outcome~Factor,values=FALSE,col="darkblue")
```

In R versions 4.1 and greater, the native pipe operator can be used instead of standard syntax. Here, the variables to be analyzed are included first, followed by the pipe operator, and then the function call (with any relevant additional parameters in parentheses). This format is used in the advanced applications section of EASI, but could be used for all cases if desired.

```
(Outcome~Factor) |> estimateMeans()
(Outcome~Factor) |> estimateMeans(conf.level=.99,main="Custom Table Title",digits=2)
(Outcome~Factor) |> plotMeans()
(Outcome~Factor) |> plotMeans(values=FALSE,col="darkblue")
```

When larger or predefined data sets are used, it is necessary to identify the data first and then select the variables from within the data set. In base R, this is accomplished using a `with` command (or built in data identification parameters). In EASI, this is accomplished by using an exposition operator (such as the included `%$>%`). This is used in several of the advanced applications.

```
Dataset %$>% (Outcome~Factor) |> estimateMeans()
Dataset %$>% (Outcome~Factor) |> estimateMeans(conf.level=.99,main="Custom Table Title",digits=2)
Dataset %$>% (Outcome~Factor) |> plotMeans()
Dataset %$>% (Outcome~Factor) |> plotMeans(values=FALSE,col="darkblue")
```

### Details and Examples

The package includes a wide variety of tutorials, examples, and applications that demonstrate its use:

- [Details of the Functions](./functions) - A manual describing the functions and their available options
- [Tutorials from the Sourcebook](./tutorials) - Tutorial vignettes that show the default and basic output
- [Examples from ITNS](./examples) - Reanalyses of published textbook examples that use custom output options
- [Advanced Applications](./applications) - Advanced applications that demonstrate additional features
