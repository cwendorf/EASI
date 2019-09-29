# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Other Examples**](https://github.com/cwendorf/EASI/tree/master/D-OtherExamples)

---

## Extended Within-Subjects Summary Example

### Source the EASI Functions and Extensions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")
```

### Three Time Period Example Summary Statistics

```r
Time1 <- c(N=5,M=6.4,SD=1.14)
Time2 <- c(N=5,M=7.8,SD=.837)
Time3 <- c(N=5,M=8.6,SD=.548)
WithinSummary <- rbind(Time1,Time2,Time3)
class(WithinSummary) <- "wss"
WithinSummary
```
```
      N   M    SD
Time1 5 6.4 1.140
Time2 5 7.8 0.837
Time3 5 8.6 0.548
attr(,"class")
[1] "wss"
```
```r
WithinCorr <- declareCorrMatrix("Time1","Time2","Time3")
WithinCorr["Time1","Time2"] <- .891
WithinCorr["Time1","Time3"] <- .721
WithinCorr["Time2","Time3"] <- .873
WithinCorr <- fillCorrMatrix(WithinCorr)
WithinCorr
```
```
      Time1 Time2 Time3
Time1 1.000 0.891 0.721
Time2 0.891 1.000 0.873
Time3 0.721 0.873 1.000
```

### Analyses of Pairwise Variable Comparisons

This section produces analyses that are equivalent to unadjusted t tests.

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(WithinSummary,WithinCorr)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                Diff    SE    df     LL     UL
Time1 v Time2 -1.400 0.245 4.000 -2.080 -0.720
Time1 v Time3 -2.200 0.374 4.000 -3.239 -1.161
Time2 v Time3 -0.800 0.200 4.000 -1.355 -0.245
```
```r
estimatePairwise(WithinSummary,WithinCorr,conf.level=.99)
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(WithinSummary,WithinCorr)
```
<kbd><img src="ExtendedWithinSubjectsFigure1.jpg"></kbd>
```r
plotPairwise(WithinSummary,WithinCorr,mu=-2,conf.level=.99)
```
<kbd><img src="ExtendedWithinSubjectsFigure2.jpg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(WithinSummary,WithinCorr)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                Diff    SE      t    df     p
Time1 v Time2 -1.400 0.245 -5.718 4.000 0.005
Time1 v Time3 -2.200 0.374 -5.881 4.000 0.004
Time2 v Time3 -0.800 0.200 -3.999 4.000 0.016
```
```r
testPairwise(WithinSummary,WithinCorr,mu=-2)
```

#### Effect Sizes for the Pairwise Comparisons

```r
standardizePairwise(WithinSummary,WithinCorr)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                 Est    SE     LL     UL
Time1 v Time2 -1.400 0.545 -2.468 -0.332
Time1 v Time3 -2.460 0.928 -4.278 -0.641
Time2 v Time3 -1.131 0.488 -2.086 -0.175
```
```r
standardizePairwise(WithinSummary,WithinCorr,conf.level=.99)
```
