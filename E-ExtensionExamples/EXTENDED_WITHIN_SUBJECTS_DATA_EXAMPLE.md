# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Extended Within-Subjects Example

### Three Time Period Example Data

```r
Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata
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

This section produces analyses that are equivalent to unadjusted t tests.

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(Time1,Time2,Time3)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

              Diff    SE df     LL     UL
Time1 v Time2 -1.4 0.245  4 -2.080 -0.720
Time1 v Time3 -2.2 0.374  4 -3.239 -1.161
Time2 v Time3 -0.8 0.200  4 -1.355 -0.245
```
```r
estimatePairwise(Time1,Time2,Time3,conf.level=.99)
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(Time1,Time2,Time3)
```
<kbd><img src="ExtendedWithinSubjectsGraph1.jpg"></kbd>
```r
plotPairwise(Time1,Time2,Time3,mu=-2,conf.level=.99)
```
<kbd><img src="ExtendedWithinSubjectsGraph2.jpg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(Time1,Time2,Time3)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

              Diff    SE      t df     p
Time1 v Time2 -1.4 0.245 -5.715  4 0.005
Time1 v Time3 -2.2 0.374 -5.880  4 0.004
Time2 v Time3 -0.8 0.200 -4.000  4 0.016
```
```r
testPairwise(Time1,Time2,Time3,mu=-2)
```

#### Effect Sizes for the Pairwise Comparisons

```r
effectPairwise(Time1,Time2,Time3)
```
```
STANDARDIZED MEAN DIFFERENCES FOR THE PAIRWISE COMPARISONS

                   d      g     LL     UL
Time1 v Time2 -1.400 -1.264 -2.566 -0.735
Time1 v Time3 -2.460 -2.220 -4.468 -1.326
Time2 v Time3 -1.131 -1.021 -2.153 -0.524
```
```r
effectPairwise(Time1,Time2,Time3,conf.level=.99)
```
