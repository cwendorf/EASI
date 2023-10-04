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
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
```

```r
(RepeatedData) |> estimateMeans(conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.043   7.637
## Outcome2  11.180   0.553  49.000   9.698  12.662
## Outcome3  12.020   0.587  49.000  10.448  13.592
```

However, the native pipe operator does not easily permit the piping of the variable, data frame, or formula to multiple functions on the ride-hand side of the call simultaneously. EASI contains a very simple pipe operator that uses a period as a placeholder, permitting more advanced piping options.

```r
(RepeatedData) %.>% estimateMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
```

```r
(RepeatedData) %.>% {c(estimateMeans(.),testMeans(.))}
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.840   0.297  49.000  22.998   0.000
## Outcome2  11.180   0.553  49.000  20.215   0.000
## Outcome3  12.020   0.587  49.000  20.492   0.000
```

```r
(RepeatedData) %.>% {c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))}
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.043   7.637
## Outcome2  11.180   0.553  49.000   9.698  12.662
## Outcome3  12.020   0.587  49.000  10.448  13.592
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.840   0.297  49.000   6.187   0.000
## Outcome2   6.180   0.553  49.000  11.174   0.000
## Outcome3   7.020   0.587  49.000  11.968   0.000
```

### Using Through Pipes

Traditionally, a pipe operator sends the results (not the input) of each operation in sequence to the next operation. Sometimes, it is useful to implement a "pass though" instead, where the input for the first call is also piped to the second call.

```r
(RepeatedData) %.>>% estimateMeans(.) %.>>% testMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.840   0.297  49.000  22.998   0.000
## Outcome2  11.180   0.553  49.000  20.215   0.000
## Outcome3  12.020   0.587  49.000  20.492   0.000
```

```r
(RepeatedData) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.043   7.637
## Outcome2  11.180   0.553  49.000   9.698  12.662
## Outcome3  12.020   0.587  49.000  10.448  13.592
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.840   0.297  49.000   6.187   0.000
## Outcome2   6.180   0.553  49.000  11.174   0.000
## Outcome3   7.020   0.587  49.000  11.968   0.000
```

In these examples, the through pipe is only required prior to the first analysis because the second one is the terminal call and thus nothing needs to "pass though". As a result, the second pipe operator could be the dot or the native pipe operator instead.

```r
(RepeatedData) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.840   2.103  -0.301  -0.244
## Outcome2  50.000  11.180   3.911   0.324  -0.346
## Outcome3  50.000  12.020   4.148  -0.233  -0.451
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
```

```r
(RepeatedData) %.>>% describeMeans(.) |> estimateMeans()
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.840   2.103  -0.301  -0.244
## Outcome2  50.000  11.180   3.911   0.324  -0.346
## Outcome3  50.000  12.020   4.148  -0.233  -0.451
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.840   0.297  49.000   6.242   7.438
## Outcome2  11.180   0.553  49.000  10.069  12.291
## Outcome3  12.020   0.587  49.000  10.841  13.199
```
