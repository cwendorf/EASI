
## Pipes Repeated Measures Data Application

This page introduces a variety of native and simple pipe operators to
implement basic analysis functions using repeated measures
(within-subjects) data.

- [Data Management](#data-management)
- [Using the Native and Dot Pipes](#using-the-native-and-dot-pipes)
- [Using Through Pipes](#using-through-pipes)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Using the Native and Dot Pipes

In R versions 4.1 and greater, the native pipe operator can be used
instead of standard syntax. Here, the variable (or data frame or
formula) is included first, followed by the pipe operator, and then the
function call (with any relevant additional parameters in parentheses).

``` r
(RepeatedData) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782

``` r
(RepeatedData) |> estimateMeans(conf.level=.99)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.122   7.678
    ## Outcome2  11.460   0.607  49.000   9.834  13.086
    ## Outcome3  11.660   0.558  49.000  10.164  13.156

However, the native pipe operator does not easily permit the piping of
the variable, data frame, or formula to multiple functions on the
ride-hand side of the call simultaneously. EASI contains a very simple
pipe operator that uses a period as a placeholder, permitting more
advanced piping options.

``` r
(RepeatedData) %.>% estimateMeans(.)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782

``` r
(RepeatedData) %.>% {c(estimateMeans(.),testMeans(.))}
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   6.900   0.290  49.000  23.767   0.000
    ## Outcome2  11.460   0.607  49.000  18.883   0.000
    ## Outcome3  11.660   0.558  49.000  20.891   0.000

``` r
(RepeatedData) %.>% {c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))}
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.122   7.678
    ## Outcome2  11.460   0.607  49.000   9.834  13.086
    ## Outcome3  11.660   0.558  49.000  10.164  13.156
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   1.900   0.290  49.000   6.545   0.000
    ## Outcome2   6.460   0.607  49.000  10.644   0.000
    ## Outcome3   6.660   0.558  49.000  11.933   0.000

### Using Through Pipes

Traditionally, a pipe operator sends the results (not the input) of each
operation in sequence to the next operation. Sometimes, it is useful to
implement a “pass though” instead, where the input for the first call is
also piped to the second call.

``` r
(RepeatedData) %.>>% estimateMeans(.) %.>>% testMeans(.)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   6.900   0.290  49.000  23.767   0.000
    ## Outcome2  11.460   0.607  49.000  18.883   0.000
    ## Outcome3  11.660   0.558  49.000  20.891   0.000

``` r
(RepeatedData) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.122   7.678
    ## Outcome2  11.460   0.607  49.000   9.834  13.086
    ## Outcome3  11.660   0.558  49.000  10.164  13.156
    ## 
    ## $`Hypothesis Tests for the Means`
    ##             Diff      SE      df       t       p
    ## Outcome1   1.900   0.290  49.000   6.545   0.000
    ## Outcome2   6.460   0.607  49.000  10.644   0.000
    ## Outcome3   6.660   0.558  49.000  11.933   0.000

In these examples, the through pipe is only required prior to the first
analysis because the second one is the terminal call and thus nothing
needs to “pass though”. As a result, the second pipe operator could be
the dot or the native pipe operator instead.

``` r
(RepeatedData) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  50.000   6.900   2.053   0.066  -0.105
    ## Outcome2  50.000  11.460   4.291  -0.096   0.330
    ## Outcome3  50.000  11.660   3.947  -0.224  -0.222

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782

``` r
(RepeatedData) %.>>% describeMeans(.) |> estimateMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##                N       M      SD    Skew    Kurt
    ## Outcome1  50.000   6.900   2.053   0.066  -0.105
    ## Outcome2  50.000  11.460   4.291  -0.096   0.330
    ## Outcome3  50.000  11.660   3.947  -0.224  -0.222

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   6.900   0.290  49.000   6.317   7.483
    ## Outcome2  11.460   0.607  49.000  10.240  12.680
    ## Outcome3  11.660   0.558  49.000  10.538  12.782
