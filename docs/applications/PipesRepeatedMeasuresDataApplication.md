## Pipes Repeated Measures Data Application

This page introduces a variety of native and simple pipe operators to implement basic analysis functions using repeated measures (within-subjects) data.

### Data Management

Enter the data.

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
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
```

```r
(RepeatedData) |> estimateMeans(conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.082   7.718
## Outcome2  10.900   0.508  49.000   9.538  12.262
## Outcome3  11.620   0.494  49.000  10.296  12.944
```

However, the native pipe operator does not easily permit the piping of the variable, data frame, or formula to multiple functions on the ride-hand side of the call simultaneously. EASI contains a very simple pipe operator that uses a period as a placeholder, permitting more advanced piping options.

```r
(RepeatedData) %.>% estimateMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
```

```r
(RepeatedData) %.>% c(estimateMeans(.),testMeans(.))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.900   0.305  49.000  22.594   0.000
## Outcome2  10.900   0.508  49.000  21.453   0.000
## Outcome3  11.620   0.494  49.000  23.524   0.000
```

```r
(RepeatedData) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.082   7.718
## Outcome2  10.900   0.508  49.000   9.538  12.262
## Outcome3  11.620   0.494  49.000  10.296  12.944
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.900   0.305  49.000   6.221   0.000
## Outcome2   5.900   0.508  49.000  11.612   0.000
## Outcome3   6.620   0.494  49.000  13.402   0.000
```

### Using Passthrough Pipes

Traditionally, a pipe operator sends the results (not the input) of each operation in sequence to the next operation. Sometimes, it is useful to implement a "pass though" instead, where the input from the first call is piped to the second call.

```r
(RepeatedData) %p>% estimateMeans(.) %p>% testMeans(.)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   6.900   0.305  49.000  22.594   0.000
## Outcome2  10.900   0.508  49.000  21.453   0.000
## Outcome3  11.620   0.494  49.000  23.524   0.000
```

```r
(RepeatedData) %p>% estimateMeans(.,conf.level=.99) %p>% testMeans(.,mu=5)
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.082   7.718
## Outcome2  10.900   0.508  49.000   9.538  12.262
## Outcome3  11.620   0.494  49.000  10.296  12.944
## 
## $`Hypothesis Tests for the Means`
##             Diff      SE      df       t       p
## Outcome1   1.900   0.305  49.000   6.221   0.000
## Outcome2   5.900   0.508  49.000  11.612   0.000
## Outcome3   6.620   0.494  49.000  13.402   0.000
```

Technically, the passthrough pipe is only required prior to the first analysis because the second one is the terminal call and thus nothing needs to "pass though". As a result, the second pipe operator could be native, the dot, or the passthrough pipe operator.

```r
(RepeatedData) %p>% describeMeans(.) %.>% estimateMeans(.)
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.900   2.159  -0.385  -0.661
## Outcome2  50.000  10.900   3.593  -0.551  -0.015
## Outcome3  50.000  11.620   3.493  -0.351  -0.496
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
```

```r
(RepeatedData) %p>% describeMeans(.) |> estimateMeans()
```

```
## $`Descriptive Statistics for the Data`
##                N       M      SD    Skew    Kurt
## Outcome1  50.000   6.900   2.159  -0.385  -0.661
## Outcome2  50.000  10.900   3.593  -0.551  -0.015
## Outcome3  50.000  11.620   3.493  -0.351  -0.496
```

```
## $`Confidence Intervals for the Means`
##                M      SE      df      LL      UL
## Outcome1   6.900   0.305  49.000   6.286   7.514
## Outcome2  10.900   0.508  49.000   9.879  11.921
## Outcome3  11.620   0.494  49.000  10.627  12.613
```
