# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## Pairwise Comparisons - Repeated (Within-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions and the Extension

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Pairwise-Extension.R")
```

### Enter Summary Statistics

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary
```
```
         N M    SD
Outcome1 4 2 2.449
Outcome2 4 6 2.449
Outcome3 4 7 2.449
attr(,"class")
[1] "wss"
```
```r
RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr
```
```
         Outcome1 Outcome2 Outcome3
Outcome1    1.000    0.500    0.056
Outcome2    0.500    1.000    0.389
Outcome3    0.056    0.389    1.000
```

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(RepeatedSummary,RepeatedCorr)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                      Diff    SE    df      LL     UL
Outcome1 v Outcome2 -4.000 1.224 3.000  -7.897 -0.103
Outcome1 v Outcome3 -5.000 1.683 3.000 -10.355  0.355
Outcome2 v Outcome3 -1.000 1.354 3.000  -5.308  3.308
```

```r
estimatePairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                      Diff    SE    df      LL    UL
Outcome1 v Outcome2 -4.000 1.224 3.000 -11.152 3.152
Outcome1 v Outcome3 -5.000 1.683 3.000 -14.827 4.827
Outcome2 v Outcome3 -1.000 1.354 3.000  -8.906 6.906
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(RepeatedSummary,RepeatedCorr) # PairwiseRepeated-Figure1.jpeg
```
<kbd><img src="PairwiseRepeated-Figure1.jpeg"></kbd>
```r
plotPairwise(RepeatedSummary,RepeatedCorr,mu=-2,conf.level=.99) # PairwiseRepeated-Figure2.jpeg
```
<kbd><img src="PairwiseRepeated-Figure2.jpeg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(RepeatedSummary,RepeatedCorr)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                      Diff    SE      t    df     p
Outcome1 v Outcome2 -4.000 1.224 -3.267 3.000 0.047
Outcome1 v Outcome3 -5.000 1.683 -2.972 3.000 0.059
Outcome2 v Outcome3 -1.000 1.354 -0.739 3.000 0.514
```

```r
testPairwise(RepeatedSummary,RepeatedCorr,mu=-2)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                      Diff    SE      t    df     p
Outcome1 v Outcome2 -2.000 1.224 -1.633 3.000 0.201
Outcome1 v Outcome3 -3.000 1.683 -1.783 3.000 0.173
Outcome2 v Outcome3  1.000 1.354  0.739 3.000 0.514
```

#### Effect Sizes for the Pairwise Comparisons

```r
standardizePairwise(RepeatedSummary,RepeatedCorr)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                       Est    SE     LL     UL
Outcome1 v Outcome2 -1.633 0.782 -3.166 -0.101
Outcome1 v Outcome3 -2.042 0.876 -3.759 -0.325
Outcome2 v Outcome3 -0.408 0.592 -1.569  0.752
```

```r
standardizePairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                       Est    SE     LL    UL
Outcome1 v Outcome2 -1.633 0.782 -3.647 0.380
Outcome1 v Outcome3 -2.042 0.876 -4.298 0.215
Outcome2 v Outcome3 -0.408 0.592 -1.934 1.117
```