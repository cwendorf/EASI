# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## Mixed Design Tutorial with Summary Statistics

### Source the EASI Functions

This code imports all of the EASI functions, making them available for analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
```

### Enter Summary Statistics

This code inputs the variable summaries and creates a summary table.
```r
Outcome1L1 <- c(N=4,M=2.000,SD=2.449)
Outcome2L1 <- c(N=4,M=6.000,SD=2.449)
Outcome3L1 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL1 <- rbind(Outcome1L1,Outcome2L1,Outcome3L1)
class(WithinSummaryL1) <- "wss"
WithinSummaryL1
```
```
           N M    SD
Outcome1L1 4 2 2.449
Outcome2L1 4 6 2.449
Outcome3L1 4 7 2.449
attr(,"class")
[1] "wss"
```

This code creates a correlation matrix, enters just the top triangle, and then uses a function to fill in the whole matrix.
```r
WithinCorrL1 <- declareCorrMatrix("Outcome1L1","Outcome2L1","Outcome3L1")
WithinCorrL1["Outcome1L1",] <- c(1.000,.500,.389)
WithinCorrL1["Outcome2L1",] <- c(.500,1.000,.889)
WithinCorrL1["Outcome3L1",] <- c(.389,.889,1.000)
WithinCorrL1
```
```
           Outcome1L1 Outcome2L1 Outcome3L1
Outcome1L1      1.000      0.500      0.389
Outcome2L1      0.500      1.000      0.889
Outcome3L1      0.389      0.889      1.000
```

And repeat for the second subset.
```r
Outcome1L2 <- c(N=4,M=2.000,SD=2.449)
Outcome2L2 <- c(N=4,M=6.000,SD=2.449)
Outcome3L2 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL2 <- rbind(Outcome1L2,Outcome2L2,Outcome3L2)
class(WithinSummaryL2) <- "wss"
WithinSummaryL2
```
```
           N M    SD
Outcome1L2 4 2 2.449
Outcome2L2 4 6 2.449
Outcome3L2 4 7 2.449
attr(,"class")
[1] "wss"
```

And for the correlation matrix of the second subset.
```r
WithinCorrL2 <- declareCorrMatrix("Outcome1L2","Outcome2L2","Outcome3L2")
WithinCorrL2["Outcome1L2",] <- c(1.000,.889,.778)
WithinCorrL2["Outcome2L2",] <- c(.889,1.000,.889)
WithinCorrL2["Outcome3L2",] <- c(.778,.889,1.000)
WithinCorrL2
```
```
           Outcome1L2 Outcome2L2 Outcome3L2
Outcome1L2      1.000      0.889      0.778
Outcome2L2      0.889      1.000      0.889
Outcome3L2      0.778      0.889      1.000
```

### Analyses of Multiple Variables

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.
```r
estimateMeans(WithinSummaryL1)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

               N     M    SD    SE     LL     UL
Outcome1L1 4.000 2.000 2.449 1.224 -1.897  5.897
Outcome2L1 4.000 6.000 2.449 1.224  2.103  9.897
Outcome3L1 4.000 7.000 2.449 1.224  3.103 10.897
```

And repeat the analysis for the second subset.
```r
estimateMeans(WithinSummaryL2)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

               N     M    SD    SE     LL     UL
Outcome1L2 4.000 2.000 2.449 1.224 -1.897  5.897
Outcome2L2 4.000 6.000 2.449 1.224  2.103  9.897
Outcome3L2 4.000 7.000 2.449 1.224  3.103 10.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.
```r
estimateMeans(WithinSummaryL1,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

               N     M    SD    SE     LL     UL
Outcome1L1 4.000 2.000 2.449 1.224 -5.152  9.152
Outcome2L1 4.000 6.000 2.449 1.224 -1.152 13.152
Outcome3L1 4.000 7.000 2.449 1.224 -0.152 14.152
```

And repeat the analysis for the second subset.
```r
estimateMeans(WithinSummaryL2,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

               N     M    SD    SE     LL     UL
Outcome1L2 4.000 2.000 2.449 1.224 -5.152  9.152
Outcome2L2 4.000 6.000 2.449 1.224 -1.152 13.152
Outcome3L2 4.000 7.000 2.449 1.224 -0.152 14.152
```

#### Plots of Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.
```r
plotMeans(WithinSummaryL1) # Mixed-Figure1.jpeg
```
<kbd><img src="Mixed-Figure1.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotMeans(WithinSummaryL2) # Mixed-Figure2.jpeg
```
<kbd><img src="Mixed-Figure2.jpeg"></kbd>

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalence.
```r
plotMeans(WithinSummaryL1,conf.level=.99,mu=5,rope=c(3,7)) # Mixed-Figure3.jpeg
```
<kbd><img src="Mixed-Figure3.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotMeans(WithinSummaryL2,conf.level=.99,mu=5,rope=c(3,7)) # Mixed-Figure4.jpeg
```
<kbd><img src="Mixed-Figure4.jpeg"></kbd>

#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.
```r
testMeans(WithinSummaryL1)
```
```
HYPOTHESIS TESTS FOR THE MEANS

            Diff    SE     t    df     p
Outcome1L1 2.000 1.224 1.633 3.000 0.201
Outcome2L1 6.000 1.224 4.900 3.000 0.016
Outcome3L1 7.000 1.224 5.717 3.000 0.011
```

And repeat the analysis for the second subset.
```r
testMeans(WithinSummaryL2)
```
```
HYPOTHESIS TESTS FOR THE MEANS

            Diff    SE     t    df     p
Outcome1L2 2.000 1.224 1.633 3.000 0.201
Outcome2L2 6.000 1.224 4.900 3.000 0.016
Outcome3L2 7.000 1.224 5.717 3.000 0.011
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).
```r
testMeans(WithinSummaryL1,mu=5)
```
```
HYPOTHESIS TESTS FOR THE MEANS

             Diff    SE      t    df     p
Outcome1L1 -3.000 1.224 -2.450 3.000 0.092
Outcome2L1  1.000 1.224  0.817 3.000 0.474
Outcome3L1  2.000 1.224  1.633 3.000 0.201
```

And repeat the analysis for the second subset.
```r
testMeans(WithinSummaryL2,mu=5)
```
```
HYPOTHESIS TESTS FOR THE MEANS

             Diff    SE      t    df     p
Outcome1L2 -3.000 1.224 -2.450 3.000 0.092
Outcome2L2  1.000 1.224  0.817 3.000 0.474
Outcome3L2  2.000 1.224  1.633 3.000 0.201
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.
```r
standardizeMeans(WithinSummaryL1)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

               d d(unb)    SE     LL    UL
Outcome1L1 0.817  0.594 0.616 -0.387 1.934
Outcome2L1 2.450  1.782 0.955  0.325 4.532
Outcome3L1 2.858  2.079 1.063  0.464 5.227
```

And repeat the analysis for the second subset.
```r
standardizeMeans(WithinSummaryL2)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

               d d(unb)    SE     LL    UL
Outcome1L2 0.817  0.594 0.616 -0.387 1.934
Outcome2L2 2.450  1.782 0.955  0.325 4.532
Outcome3L2 2.858  2.079 1.063  0.464 5.227
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.
```r
standardizeMeans(WithinSummaryL1,mu=5,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

                d d(unb)    SE     LL    UL
Outcome1L1 -1.225 -0.891 0.680 -3.011 0.547
Outcome2L1  0.408  0.297 0.574 -0.968 1.734
Outcome3L1  0.817  0.594 0.616 -0.732 2.320
```

And repeat the analysis for the second subset.
```r
standardizeMeans(WithinSummaryL2,mu=5,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

                d d(unb)    SE     LL    UL
Outcome1L2 -1.225 -0.891 0.680 -3.011 0.547
Outcome2L2  0.408  0.297 0.574 -0.968 1.734
Outcome3L2  0.817  0.594 0.616 -0.732 2.320
```

### Analyses of a Variable Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new table that identifies the two levels for comparison and repeats for the second subset.
```r
CompSummaryL1 <- WithinSummaryL1[c("Outcome1L1","Outcome2L1"),]
class(CompSummaryL1) <- "wss"
CompSummaryL2 <- WithinSummaryL2[c("Outcome1L2","Outcome2L2"),]
class(CompSummaryL2) <- "wss"
```

#### Confidence Interval for the Mean Difference

This code identifies the two levels for comparison and estimates the confidence interval of the difference.
```r
estimateDifference(CompSummaryL1,WithinCorrL1)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df     LL     UL
Comparison -4.000 1.224 3.000 -7.897 -0.103
```

And repeat the analysis for the second subset.
```r
estimateDifference(CompSummaryL2,WithinCorrL2)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df     LL     UL
Comparison -4.000 0.577 3.000 -5.836 -2.164
```

Of course, you can change the confidence level from the default 95% if desired.
```r
estimateDifference(CompSummaryL1,WithinCorrL1,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df      LL    UL
Comparison -4.000 1.224 3.000 -11.152 3.152
```

And repeat the analysis for the second subset.
```r
estimateDifference(CompSummaryL2,WithinCorrL2,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

             Diff    SE    df     LL     UL
Comparison -4.000 0.577 3.000 -7.370 -0.630
```

#### Plots of Confidence Intervals for the Mean Difference

This code obtains and plots the confidence intervals for the levels and the mean difference in the identified comparison.
```r
plotDifference(CompSummaryL1,WithinCorrL1) # Mixed-Figure5.jpg
```
<kbd><img src="Mixed-Figure5.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotDifference(CompSummaryL2,WithinCorrL2) # Mixed-Figure6.jpg
```
<kbd><img src="Mixed-Figure6.jpeg"></kbd>

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.
```r
plotDifference(CompSummaryL1,WithinCorrL1,conf.level=.99,rope=c(-2,2)) # Mixed-Figure7.jpeg
```
<kbd><img src="Mixed-Figure7.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotDifference(CompSummaryL2,WithinCorrL2,conf.level=.99,rope=c(-2,2)) # Mixed-Figure8.jpeg
```
<kbd><img src="Mixed-Figure8.jpeg"></kbd>

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).
```r
testDifference(CompSummaryL1,WithinCorrL1)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -4.000 1.224 -3.267 3.000 0.047
```

And repeat the analysis for the second subset.
```r
testDifference(CompSummaryL2,WithinCorrL2)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -4.000 0.577 -6.933 3.000 0.006
```

If the default value of zero is not plausible, it too can be changed.
```r
testDifference(CompSummaryL1,WithinCorrL1,mu=-2)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -2.000 1.224 -1.633 3.000 0.201
```

And repeat the analysis for the second subset.
```r
testDifference(CompSummaryL2,WithinCorrL2,mu=-2)
```
```
HYPOTHESIS TEST FOR THE COMPARISON

             Diff    SE      t    df     p
Comparison -2.000 0.577 -3.467 3.000 0.040
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.
```r
standardizeDifference(CompSummaryL1,WithinCorrL1)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL     UL
Comparison -1.633 0.782 -3.166 -0.101
```

And repeat the analysis for the second subset.
```r
standardizeDifference(CompSummaryL2,WithinCorrL2)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL     UL
Comparison -1.633 0.687 -2.980 -0.287
```

The width of the confidence interval for the effect size can be altered if desired.
```r
standardizeDifference(CompSummaryL1,WithinCorrL1,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL    UL
Comparison -1.633 0.782 -3.647 0.380
```

And repeat the analysis for the second subset.
```r
standardizeDifference(CompSummaryL2,WithinCorrL2,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL    UL
Comparison -1.633 0.687 -3.403 0.136
```

### Analyses of a Variable Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the levels.
```r
O1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for the Contrast

This code produces a confidence interval for that contrast.
```r
estimateContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.500 1.258 3.000 0.496 8.504
```

And repeat the analysis for the second subset.
```r
estimateContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.500 0.645 3.000 2.447 6.553
```

As in all other cases, the default value of the confidence interval can be changed.
```r
estimateContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL     UL
Contrast 4.500 1.258 3.000 -2.848 11.848
```

And repeat the analysis for the second subset.
```r
estimateContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.500 0.645 3.000 0.732 8.268
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.
```r
plotContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers) # Mixed-Figure9.jpeg
```
<kbd><img src="Mixed-Figure9.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers) # Mixed-Figure10.jpeg
```
<kbd><img src="Mixed-Figure10.jpeg"></kbd>

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.
```r
plotContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)) # Mixed-Figure11.jpeg
```
<kbd><img src="Mixed-Figure11.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
plotContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)) # Mixed-Figure12.jpeg
```
<kbd><img src="Mixed-Figure12.jpeg"></kbd>

#### Significance Test for the Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.
```r
testContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 4.500 1.258 3.577 3.000 0.037
```

And repeat the analysis for the second subset.
```r
testContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 4.500 0.645 6.976 3.000 0.006
```

If desired, the contrast can be tested against other values.
```r
testContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,mu=4)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 0.500 1.258 0.397 3.000 0.718
```

And repeat the analysis for the second subset.
```r
testContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,mu=4)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 0.500 0.645 0.775 3.000 0.495
```

#### Effect Size for the Contrast

This code calculates a standardized contrast and its confidence interval.
```r
standardizeContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 1.837 0.676 0.512 3.163
```

And repeat the analysis for the second subset.
```r
standardizeContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 1.837 0.631 0.601 3.074
```

The width of the confidence interval for the effect size can be altered if desired.
```r
standardizeContrast(WithinSummaryL1,WithinCorrL1,contrast=O1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 1.837 0.676 0.096 3.579
```

And repeat the analysis for the second subset.
```r
standardizeContrast(WithinSummaryL2,WithinCorrL2,contrast=O1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 1.837 0.631 0.213 3.462
```
