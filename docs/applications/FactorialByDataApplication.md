## FactorialBy Data Application

This page analyzes simple effects using factorial (between-subjects) data.

### Data Management

#### Data Entry

Enter the data.

```r
FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Outcome <- c(rnorm(30,mean=8,sd=2),rnorm(30,mean=11,sd=4),rnorm(30,mean=12,sd=4),rnorm(30,mean=8,sd=2),rnorm(30,mean=8,sd=3),rnorm(30,mean=7,sd=4))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
```

#### Descriptive Statistics

Get descriptive statistics separately for each simple effect.

```r
(Outcome~FactorA) |> describeMeansBy(by=FactorB)
```

```
## $`Descriptive Statistics for the Data: B1`
##          N       M      SD    Skew    Kurt
## A1  30.000   8.248   1.658  -0.319  -0.616
## A2  30.000  11.857   3.824  -0.190   1.118
## A3  30.000  11.197   4.197  -0.112  -0.344
## 
## $`Descriptive Statistics for the Data: B2`
##          N       M      SD    Skew    Kurt
## A1  30.000   8.204   1.844   0.382  -0.289
## A2  30.000   8.648   2.372  -0.696   0.022
## A3  30.000   6.960   4.365   0.271  -0.861
```

### Analyses of the Means

Estimate, plot, test, and standardize the means separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeansBy(by=FactorB)
```

```
## $`Confidence Intervals for the Means: B1`
##          M      SE      df      LL      UL
## A1   8.248   0.303  29.000   7.628   8.867
## A2  11.857   0.698  29.000  10.429  13.285
## A3  11.197   0.766  29.000   9.630  12.765
## 
## $`Confidence Intervals for the Means: B2`
##          M      SE      df      LL      UL
## A1   8.204   0.337  29.000   7.516   8.893
## A2   8.648   0.433  29.000   7.763   9.534
## A3   6.960   0.797  29.000   5.330   8.590
```

```r
(Outcome~FactorA) |> plotMeansBy(by=FactorB)
```

![](figures/FactorialBy-Means-1.png)<!-- -->![](figures/FactorialBy-Means-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeansBy(by=FactorB)
```

```
## $`Hypothesis Tests for the Means: B1`
##       Diff      SE      df       t       p
## A1   8.248   0.303  29.000  27.247   0.000
## A2  11.857   0.698  29.000  16.981   0.000
## A3  11.197   0.766  29.000  14.612   0.000
## 
## $`Hypothesis Tests for the Means: B2`
##       Diff      SE      df       t       p
## A1   8.204   0.337  29.000  24.371   0.000
## A2   8.648   0.433  29.000  19.971   0.000
## A3   6.960   0.797  29.000   8.733   0.000
```

```r
(Outcome~FactorA) |> estimateStandardizedMeansBy(by=FactorB)
```

```
## $`Confidence Intervals for the Standardized Means: B1`
##          d      SE      LL      UL
## A1   4.975   0.658   3.647   6.294
## A2   3.100   0.435   2.224   3.966
## A3   2.668   0.386   1.891   3.434
## 
## $`Confidence Intervals for the Standardized Means: B2`
##          d      SE      LL      UL
## A1   4.449   0.595   3.250   5.639
## A2   3.646   0.499   2.641   4.641
## A3   1.594   0.275   1.045   2.131
```

### Analyses of a Comparison

Specify a comparison separately for each simple effect.

```r
Comparison=factor(FactorB,c("A1","A2"))
```

Analyze the specified comparison separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeanDifferenceBy(by=FactorB)
```

```
## $`Confidence Interval for the Mean Difference: B1`
##               Diff      SE      df      LL      UL
## Comparison   3.609   0.761  39.528   2.071   5.148
## 
## $`Confidence Interval for the Mean Difference: B2`
##               Diff      SE      df      LL      UL
## Comparison   0.444   0.549  54.675  -0.656   1.543
```

```r
(Outcome~FactorA) |> plotMeanDifferenceBy(by=FactorB)
```

![](figures/FactorialBy-Comparison-1.png)<!-- -->![](figures/FactorialBy-Comparison-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeanDifferenceBy(by=FactorB)
```

```
## $`Hypothesis Test for the Mean Difference: B1`
##               Diff      SE      df       t       p
## Comparison   3.609   0.761  39.528   4.743   0.000
## 
## $`Hypothesis Test for the Mean Difference: B2`
##               Diff      SE      df       t       p
## Comparison   0.444   0.549  54.675   0.809   0.422
```

```r
(Outcome~FactorA) |> estimateStandardizedMeanDifferenceBy(by=FactorB)
```

```
## $`Confidence Interval for the Standardized Mean Difference: B1`
##                  d      SE      LL      UL
## Comparison   1.225   0.297   0.643   1.806
## 
## $`Confidence Interval for the Standardized Mean Difference: B2`
##                  d      SE      LL      UL
## Comparison   0.209   0.263  -0.307   0.725
```

### Analyses of a Contrast

Specify a contrast for a factor.

```r
A1vsOthers <- c(-1,.5,.5)
```

Analyze the specified contrast separately for each simple effect.

```r
(Outcome~FactorA) |> estimateMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Mean Contrast: B1`
##              Est      SE      df      LL      UL
## Contrast   3.280   0.600  84.035   2.086   4.473
## 
## $`Confidence Interval for the Mean Contrast: B2`
##              Est      SE      df      LL      UL
## Contrast  -0.400   0.565  73.308  -1.526   0.725
```

```r
(Outcome~FactorA) |> plotMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

![](figures/FactorialBy-Contrast-1.png)<!-- -->![](figures/FactorialBy-Contrast-2.png)<!-- -->

```r
(Outcome~FactorA) |> testMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Hypothesis Test for the Mean Contrast: B1`
##              Est      SE      df       t       p
## Contrast   3.280   0.600  84.035   5.464   0.000
## 
## $`Hypothesis Test for the Mean Contrast: B2`
##              Est      SE      df       t       p
## Contrast  -0.400   0.565  73.308  -0.709   0.481
```

```r
(Outcome~FactorA) |> estimateStandardizedMeanContrastBy(by=FactorB,contrast=A1vsOthers)
```

```
## $`Confidence Interval for the Standardized Mean Contrast: B1`
##              Est      SE      LL      UL
## Contrast   0.960   0.197   0.574   1.347
## 
## $`Confidence Interval for the Standardized Mean Contrast: B2`
##              Est      SE      LL      UL
## Contrast  -0.131   0.188  -0.500   0.238
```
