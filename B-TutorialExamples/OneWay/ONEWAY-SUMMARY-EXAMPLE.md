# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Other Examples**](https://github.com/cwendorf/EASI/tree/master/D-OtherExamples)

---

## OneWay (Single-Factor Between-Subjects) Summary Statistics Example

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
```

### Three Group Example Summary Statistics

This code inputs the variable summaries and creates a single summary table.
```r
Group1 <- c(N=3,M=2.000,SD=2.449)
Group2 <- c(N=3,M=6.000,SD=2.449)
Group3 <- c(N=3,M=7.000,SD=2.449)
BetweenSummary <- rbind(Group1,Group2,Group3)
class(BetweenSummary) <- "bss"
BetweenSummary
```
```
       N M    SD
Group1 3 2 2.449
Group2 3 6 2.449
Group3 3 7 2.449
attr(,"class")
[1] "bss"
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.
```r
estimateMeans(BetweenSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

           N     M    SD    SE     LL     UL
Group1 3.000 2.000 2.449 1.414 -4.084  8.084
Group2 3.000 6.000 2.449 1.414 -0.084 12.084
Group3 3.000 7.000 2.449 1.414  0.916 13.084
```

The code defaults to 95% confidence intervals. This can be changed if desired.
```r
estimateMeans(BetweenSummary,conf.level=.99)
```

#### Plots of the Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.
```r
plotMeans(BetweenSummary)
```
<kbd><img src="OneWay-Figure1.jpg"></kbd>

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value.
```r
plotMeans(BetweenSummary,conf.level=.99,mu=5)
```
<kbd><img src="OneWay-Figure2.jpg"></kbd>


#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.
```r
testMeans(BetweenSummary)
```
```
HYPOTHESIS TESTS FOR THE MEANS

        Diff    SE     t    df     p
Group1 2.000 1.414 1.414 2.000 0.293
Group2 6.000 1.414 4.243 2.000 0.051
Group3 7.000 1.414 4.951 2.000 0.038
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).
```r
testMeans(BetweenSummary,mu=5)
```

#### Effect Sizes for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.
```r
standardizeMeans(BetweenSummary)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

           d d(unb)    SE     LL    UL
Group1 0.817  0.467 0.727 -0.595 2.110
Group2 2.450  1.400 1.093 -0.045 4.925
Group3 2.858  1.633 1.211  0.048 5.681
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.
```r
standardizeMeans(BetweenSummary,mu=5,conf.level=.99)
```
 
### Analyses of a Group Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

#### Confidence Interval for a Mean Difference

This code creates a new table that identifies the two levels for comparison and estimates the confidence interval of the difference.
```r
CompSummary <- BetweenSummary[c("Group1","Group2"),]
class(CompSummary) <- "bss"
estimateDifference(CompSummary)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df     LL    UL
Comparison -4.000 2.000 4.000 -9.552 1.552
```

Of course, you can change the confidence level from the default 95% if desired.
```r
estimateDifference(CompSummary,conf.level=.99)
```

It is also possible to alter the comparison by changing (or even reversing the order) of the groups.
```r
CompSummary <- BetweenSummary[c("Group3","Group1"),]
class(CompSummary) <- "bss"
estimateDifference(CompSummary)
```

#### Plot of the Confidence Interval for a Mean Difference

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified comparison.
```r
plotDifference(CompSummary)
```
<kbd><img src="OneWay-Figure3.jpg"></kbd>

Once again, the confidence levels can be changed away from the default if desired.
```r
plotDifference(CompSummary,conf.level=.99)
```

#### Significance Test for a Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).
```r
testDifference(CompSummary)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -4.000 2.000 -2.000 4.000 0.116
```

If the default value of zero is not plausible, it too can be changed.
```r
testDifference(CompSummary,mu=2)
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.
```r
standardizeDifference(CompSummary)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL    UL
Comparison -1.633 1.155 -3.897 0.630
```

The width of the confidence interval for the effect size can be altered if desired.
```r
standardizeDifference(CompSummary,conf.level=.99)
```

### Analyses of a Group Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

#### Confidence Interval for Combined Levels

This code creates combinations of groups and produces a confidence interval for those pooled groups.
```r
G1 <- c(1,0,0)
estimateContrast(BetweenSummary,contrast=G1)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL    UL
Contrast 2.000 1.414 2.000 -4.084 8.084
```
```r
G2nG3 <- c(0,.5,.5)
estimateContrast(BetweenSummary,contrast=G2nG3)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 6.500 1.000 4.000 3.724 9.276
```

#### Confidence Interval for a Contrast

This code identifies a contrast among the groups and produces a confidence interval for that contrast.
```r
G1vsOthers <- c(-1,.5,.5)
estimateContrast(BetweenSummary,contrast=G1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL    UL
Contrast 4.500 1.732 4.000 -0.308 9.308
```

As in all other cases, the default value of the confidence interval can be changed.
```r
estimateContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.
```r
G1vsOthers <- c(-1,.5,.5)
plotContrast(BetweenSummary,contrast=G1vsOthers)
````
<kbd><img src="OneWay-Figure4.jpg"></kbd>

The width of the confidence interval for the contrast can be altered if desired.
```r
plotContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)
```

#### Significance Test for a Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.
```r
testContrast(BetweenSummary,contrast=G1vsOthers)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 4.500 1.732 2.599 4.000 0.060
```

If desired, the contrast can be tested against other values if needed.
```r
testContrast(BetweenSummary,contrast=G1vsOthers,mu=4)
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.
```r
standardizeContrast(BetweenSummary,contrast=G1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE     LL    UL
Contrast 1.837 1.016 -0.153 3.828
```

The width of the confidence interval for the effect size can be altered if desired.
```r
standardizeContrast(BetweenSummary,contrast=G1vsOthers,conf.level=.99)
```
