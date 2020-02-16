# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## One Sample Tutorial with Summary Statistics

### Source the EASI Functions

This code imports all of the EASI functions, making them available for analyses.
```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
```

### Enter Summary Statistics

This code inputs the variable and creates a single summary table.
```r
Outcome <- c(N=8,M=4.000,SD=3.117)
OneSampleSummary <- rbind(Outcome)
class(OneSampleSummary) <- "wss"
OneSampleSummary
```
```
        N M    SD
Outcome 8 4 3.117
attr(,"class")
[1] "wss"
```

### Analyses of the Group

This section produces analyses that are equivalent to one-sample analyses for the variable.

#### Confidence Interval for the Mean

This code will provide a table of descriptive statistics and confidence intervals for the variable.
```r
estimateMeans(OneSampleSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

            N     M    SD    SE    LL    UL
Outcome 8.000 4.000 3.117 1.102 1.394 6.606
```

The code defaults to 95% confidence intervals. This can be changed if desired.
```r
estimateMeans(OneSampleSummary,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

            N     M    SD    SE    LL    UL
Outcome 8.000 4.000 3.117 1.102 0.143 7.857
```

#### Plots of the Confidence Intervals for the Mean

This code will produce a graph of the confidence interval for the variable.
```r
plotMeans(OneSampleSummary) # OneSample-Figure1.jpeg
```
<kbd><img src="OneSample-Figure1.jpeg"></kbd>

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and a region of practical equivalece.
```r
plotMeans(OneSampleSummary,conf.level=.99,mu=5,rope=c(3,7)) # OneSample-Figure2.jpeg
```
<kbd><img src="OneSample-Figure2.jpeg"></kbd>


#### Significance Tests for the Mean

This code will produce a table of NHST sfor the variable. In this case, the mean is tested against a value of zero.
```r
testMeans(OneSampleSummary)
```
```
HYPOTHESIS TESTS FOR THE MEANS

         Diff    SE     t    df     p
Outcome 4.000 1.102 3.630 7.000 0.008
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).
```r
testMeans(OneSampleSummary,mu=5)
```
```
HYPOTHESIS TESTS FOR THE MEANS

          Diff    SE      t    df     p
Outcome -1.000 1.102 -0.907 7.000 0.394
```

#### Effect Sizes for the Mean

This code will produce a table of standardized mean difference for the variable. In this case, the mean is compared to zero to form the effect size.
```r
standardizeMeans(OneSampleSummary)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

            d d(unb)    SE    LL    UL
Outcome 1.283  1.141 0.482 0.304 2.217
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.
```r
standardizeMeans(OneSampleSummary,mu=5,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

             d d(unb)    SE     LL    UL
Outcome -0.321 -0.285 0.383 -1.247 0.625
```
