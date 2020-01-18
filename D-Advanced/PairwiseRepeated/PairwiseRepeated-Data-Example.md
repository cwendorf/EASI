# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## Pairwise Comparisons - Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions and Extensions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")
```

### Three Time Period Example Data

```r
Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)
PairwiseRepeatedData <- data.frame(Time1,Time2,Time3)
PairwiseRepeatedData
```
```
  Time1 Time2 Time3
1     5     7     8
2     6     7     8
3     6     8     9
4     7     8     9
5     8     9     9
```

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(Time1,Time2,Time3)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                Diff    SE    df     LL     UL
Time1 v Time2 -1.400 0.245 4.000 -2.080 -0.720
Time1 v Time3 -2.200 0.374 4.000 -3.239 -1.161
Time2 v Time3 -0.800 0.200 4.000 -1.355 -0.245
```

```r
estimatePairwise(Time1,Time2,Time3,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                Diff    SE    df     LL     UL
Time1 v Time2 -1.400 0.245 4.000 -2.527 -0.273
Time1 v Time3 -2.200 0.374 4.000 -3.922 -0.478
Time2 v Time3 -0.800 0.200 4.000 -1.721  0.121
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(Time1,Time2,Time3) # PairwiseRepeated-Figure1.jpeg
```
<kbd><img src="PairwiseRepeated-Figure1.jpeg"></kbd>
```r
plotPairwise(Time1,Time2,Time3,mu=-2,conf.level=.99) # PairwiseRepeated-Figure2.jpeg
```
<kbd><img src="PairwiseRepeated-Figure2.jpeg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(Time1,Time2,Time3)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                Diff    SE      t    df     p
Time1 v Time2 -1.400 0.245 -5.718 4.000 0.005
Time1 v Time3 -2.200 0.374 -5.881 4.000 0.004
Time2 v Time3 -0.800 0.200 -3.999 4.000 0.016
```

```r
testPairwise(Time1,Time2,Time3,mu=-2)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                Diff    SE      t    df     p
Time1 v Time2  0.600 0.245  2.451 4.000 0.070
Time1 v Time3 -0.200 0.374 -0.535 4.000 0.621
Time2 v Time3  1.200 0.200  5.998 4.000 0.004
```

#### Effect Sizes for the Pairwise Comparisons

```r
standardizePairwise(Time1,Time2,Time3)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                 Est    SE     LL     UL
Time1 v Time2 -1.400 0.545 -2.468 -0.332
Time1 v Time3 -2.460 0.928 -4.278 -0.641
Time2 v Time3 -1.131 0.488 -2.086 -0.175
```

```r
standardizePairwise(Time1,Time2,Time3,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                 Est    SE     LL     UL
Time1 v Time2 -1.400 0.545 -2.804  0.004
Time1 v Time3 -2.460 0.928 -4.850 -0.070
Time2 v Time3 -1.131 0.488 -2.387  0.125
```
