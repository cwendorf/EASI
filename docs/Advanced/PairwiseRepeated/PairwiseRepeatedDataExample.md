# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Pairwise Comparisons - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
PairwiseRepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
PairwiseRepeatedData
```
```
  Outcome1 Outcome2 Outcome3
1        0        4        9
2        0        7        6
3        3        4        4
4        5        9        9
```

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(Outcome1,Outcome2,Outcome3)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                     Diff    SE    df     LL     UL
Outcome1 v Outcome2 4.000 1.224 3.000  0.103  7.897
Outcome1 v Outcome3 5.000 1.683 3.000 -0.356 10.356
Outcome2 v Outcome3 1.000 1.354 3.000 -3.308  5.308
```

```r
estimatePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                     Diff    SE    df     LL     UL
Outcome1 v Outcome2 4.000 1.224 3.000 -3.152 11.152
Outcome1 v Outcome3 5.000 1.683 3.000 -4.830 14.830
Outcome2 v Outcome3 1.000 1.354 3.000 -6.907  8.907
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(Outcome1,Outcome2,Outcome3)
```
<kbd><img src="PairwiseRepeatedFigure1.jpeg"></kbd>
```r
plotPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0))
```
<kbd><img src="PairwiseRepeatedFigure2.jpeg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(Outcome1,Outcome2,Outcome3)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                     Diff    SE     t    df     p
Outcome1 v Outcome2 4.000 1.224 3.267 3.000 0.047
Outcome1 v Outcome3 5.000 1.683 2.971 3.000 0.059
Outcome2 v Outcome3 1.000 1.354 0.739 3.000 0.514
```

```r
testPairwise(Outcome1,Outcome2,Outcome3,mu=-2)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                     Diff    SE     t    df     p
Outcome1 v Outcome2 6.000 1.224 4.900 3.000 0.016
Outcome1 v Outcome3 7.000 1.683 4.159 3.000 0.025
Outcome2 v Outcome3 3.000 1.354 2.216 3.000 0.113
```

#### Effect Sizes for the Pairwise Comparisons

```r
standardizePairwise(Outcome1,Outcome2,Outcome3)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                      Est    SE     LL    UL
Outcome1 v Outcome2 1.633 0.782  0.101 3.166
Outcome1 v Outcome3 2.042 0.876  0.325 3.759
Outcome2 v Outcome3 0.408 0.592 -0.752 1.569
```

```r
standardizePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                      Est    SE     LL    UL
Outcome1 v Outcome2 1.633 0.782 -0.380 3.647
Outcome1 v Outcome3 2.042 0.876 -0.215 4.298
Outcome2 v Outcome3 0.408 0.592 -1.117 1.934
```