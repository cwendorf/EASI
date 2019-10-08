# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Other Examples**](https://github.com/cwendorf/EASI/tree/master/D-OtherExamples)

---

## Paired Samples Example with Tutorial Summary Statistics

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
```

### Enter Summary Statistics

This code inputs the variable summaries and creates a summary table.
```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
WithinSummary <- rbind(Outcome1,Outcome2)
class(WithinSummary) <- "wss"
WithinSummary
```
```
         N M    SD
Outcome1 4 2 2.449
Outcome2 4 6 2.449
attr(,"class")
[1] "wss"
```
This code creates a correlation matrix and enters single correlation.
```r
WithinCorr <- declareCorrMatrix("Outcome1","Outcome2")
WithinCorr["Outcome1","Outcome2"] <- .500
```
 
### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.
```r
estimateMeans(WithinSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

             N     M    SD    SE     LL     UL
Outcome1 4.000 2.000 2.449 1.224 -1.897  5.897
Outcome2 4.000 6.000 2.449 1.224  2.103  9.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.
```r
estimateMeans(WithinSummary,conf.level=.99)
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.
```r
plotMeans(WithinSummary)
```
<kbd><img src="Paired-Figure1.jpg"></kbd>

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value.
```r
plotMeans(WithinSummary,conf.level=.99,mu=6)
```
<kbd><img src="Paired-Figure2.jpg"></kbd>

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.
```r
testMeans(WithinSummary)
```
```
HYPOTHESIS TESTS FOR THE MEANS

          Diff    SE     t    df     p
Outcome1 2.000 1.224 1.633 3.000 0.201
Outcome2 6.000 1.224 4.900 3.000 0.016
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).
```r
testMeans(WithinSummary,mu=6)
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.
```r
standardizeMeans(WithinSummary)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

             d d(unb)    SE     LL    UL
Outcome1 0.817  0.594 0.616 -0.387 1.934
Outcome2 2.450  1.782 0.955  0.325 4.532
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.
```r
standardizeMeans(WithinSummary,mu=6,conf.level=.99)
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for the Mean Difference

This code estimates the confidence interval of the difference.
```r
estimateDifference(WithinSummary,WithinCorr)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df     LL     UL
Comparison -4.000 1.224 3.000 -7.897 -0.103
```

Of course, you can change the confidence level from the default 95% if desired.
```r
estimateDifference(WithinSummary,WithinCorr,conf.level=.99)
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference.
```r
plotDifference(WithinSummary,WithinCorr)
```
<kbd><img src="Paired-Figure3.jpg"></kbd>

Once again, the confidence levels can be changed away from the default if desired.
```r
plotDifference(WithinSummary,WithinCorr,conf.level=.99)
```

#### Significance Test for the Mean Difference

This code produces NHST for the mean difference (using a default test value of zero).
```r
testDifference(WithinSummary,WithinCorr)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -4.000 1.224 -3.267 3.000 0.047
```

If the default value of zero is not plausible, it too can be changed.
```r
testDifference(WithinSummary,WithinCorr,mu=-2)
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference and its confidence interval.
```r
standardizeDifference(WithinSummary,WithinCorr)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL     UL
Comparison -1.633 0.782 -3.166 -0.101
```

The width of the confidence interval for the effect size can be altered if desired.
```r
standardizeDifference(WithinSummary,WithinCorr,conf.level=.99)
```
