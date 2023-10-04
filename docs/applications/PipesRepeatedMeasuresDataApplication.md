## Pipes Repeated Measures Data Application

This page introduces a variety of native and simple pipe operators to implement basic analysis functions using repeated measures (within-subjects) data.

### Data Management

Simulate some data.

```r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Using the Native and Dot Pipes

In R versions 4.1 and greater, the native pipe operator can be used instead of standard syntax. Here, the variable (or data frame or formula) is included first, followed by the pipe operator, and then the function call (with any relevant additional parameters in parentheses). 

```r
(RepeatedData) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
```

```r
(RepeatedData) |> estimateMeans(conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   5.994   7.566
## Outcome2  11.080   0.615  49.000   9.433  12.727
## Outcome3  12.120   0.459  49.000  10.889  13.351
```

However, the native pipe operator does not easily permit the piping of the variable, data frame, or formula to multiple functions on the ride-hand side of the call simultaneously. EASI contains a very simple pipe operator that uses a period as a placeholder, permitting more advanced piping options.

```r
(RepeatedData) %.>% estimateMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
```

```r
(RepeatedData) %.>% c(estimateMeans(.),testMeans(.))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.780   0.293  49.000  23.126   0.000
## Outcome2  11.080   0.615  49.000  18.026   0.000
## Outcome3  12.120   0.459  49.000  26.377   0.000
```

```r
(RepeatedData) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   5.994   7.566
## Outcome2  11.080   0.615  49.000   9.433  12.727
## Outcome3  12.120   0.459  49.000  10.889  13.351
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.780   0.293  49.000   6.071   0.000
## Outcome2   6.080   0.615  49.000   9.891   0.000
## Outcome3   7.120   0.459  49.000  15.495   0.000
```

### Using Passthrough Pipes

Traditionally, a pipe operator sends the results (not the input) of each operation in sequence to the next operation. Sometimes, it is useful to implement a "pass though" instead, where the input for the first call is piped to the second call.

```r
(RepeatedData) %.>>% estimateMeans(.) %.>>% testMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.780   0.293  49.000  23.126   0.000
## Outcome2  11.080   0.615  49.000  18.026   0.000
## Outcome3  12.120   0.459  49.000  26.377   0.000
```

```r
(RepeatedData) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   5.994   7.566
## Outcome2  11.080   0.615  49.000   9.433  12.727
## Outcome3  12.120   0.459  49.000  10.889  13.351
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.780   0.293  49.000   6.071   0.000
## Outcome2   6.080   0.615  49.000   9.891   0.000
## Outcome3   7.120   0.459  49.000  15.495   0.000
```

In these examples, the passthrough pipe is only required prior to the first analysis because the second one is the terminal call and thus nothing needs to "pass though". As a result, the second pipe operator could be the dot or the native pipe operator instead.

```r
(RepeatedData) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.780   2.073   0.035  -0.844
## Outcome2  50.000  11.080   4.346   0.006  -0.491
## Outcome3  50.000  12.120   3.249   0.435   0.012
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
```

```r
(RepeatedData) %.>>% describeMeans(.) |> estimateMeans()
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.780   2.073   0.035  -0.844
## Outcome2  50.000  11.080   4.346   0.006  -0.491
## Outcome3  50.000  12.120   3.249   0.435   0.012
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.780   0.293  49.000   6.191   7.369
## Outcome2  11.080   0.615  49.000   9.845  12.315
## Outcome3  12.120   0.459  49.000  11.197  13.043
```
