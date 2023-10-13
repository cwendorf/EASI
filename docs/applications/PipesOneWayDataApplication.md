
## Pipes One Way Data Application

This page introduces a variety of native and simple pipe operators to
implement basic analysis functions using one-way (between-subjects)
data.

- [Data Management](#data-management)
- [Using the Native and Dot Pipes](#using-the-native-and-dot-pipes)
- [Using Through Pipes](#using-through-pipes)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)
```

### Using the Native and Dot Pipes

In R versions 4.1 and greater, the native pipe operator can be used
instead of standard syntax. Here, the variable (or data frame or
formula) is included first, followed by the pipe operator, and then the
function call (with any relevant additional parameters in parentheses).

``` r
(Outcome~Factor) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144

``` r
(Outcome~Factor) |> estimateMeans(conf.level=.99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   6.829   8.531
    ## Level2  11.320   0.600  49.000   9.711  12.929
    ## Level3  11.960   0.589  49.000  10.382  13.538

However, the native pipe operator does not easily permit the piping of
the variable, data frame, or formula to multiple functions on the
ride-hand side of the call simultaneously. EASI contains a very simple
pipe operator that uses a period as a placeholder, permitting more
advanced piping options.

``` r
(Outcome~Factor) %.>% estimateMeans(.)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144

``` r
(Outcome~Factor) %.>% {c(estimateMeans(.),testMeans(.))}
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   7.680   0.317  49.000  24.194   0.000
    ## Level2  11.320   0.600  49.000  18.857   0.000
    ## Level3  11.960   0.589  49.000  20.306   0.000

``` r
(Outcome~Factor) %.>% {c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))}
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   6.829   8.531
    ## Level2  11.320   0.600  49.000   9.711  12.929
    ## Level3  11.960   0.589  49.000  10.382  13.538
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   2.680   0.317  49.000   8.443   0.000
    ## Level2   6.320   0.600  49.000  10.528   0.000
    ## Level3   6.960   0.589  49.000  11.817   0.000

### Using Through Pipes

Traditionally, a pipe operator sends the results (not the input) of each
operation in sequence to the next operation. Sometimes, it is useful to
implement a “pass though” instead, where the input for the first call is
also piped to the second call.

``` r
(Outcome~Factor) %.>>% estimateMeans(.) %.>>% testMeans(.)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   7.680   0.317  49.000  24.194   0.000
    ## Level2  11.320   0.600  49.000  18.857   0.000
    ## Level3  11.960   0.589  49.000  20.306   0.000

``` r
(Outcome~Factor) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   6.829   8.531
    ## Level2  11.320   0.600  49.000   9.711  12.929
    ## Level3  11.960   0.589  49.000  10.382  13.538
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   2.680   0.317  49.000   8.443   0.000
    ## Level2   6.320   0.600  49.000  10.528   0.000
    ## Level3   6.960   0.589  49.000  11.817   0.000

In these examples, the through pipe is only required prior to the first
analysis because the second one is the terminal call and thus nothing
needs to “pass though”. As a result, the second pipe operator could be
the dot or the native pipe operator instead.

``` r
(Outcome~Factor) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD    Skew    Kurt
    ## Level1  50.000   7.680   2.245  -0.427  -0.346
    ## Level2  50.000  11.320   4.245   0.164  -0.288
    ## Level3  50.000  11.960   4.165  -0.304  -0.418

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144

``` r
(Outcome~Factor) %.>>% describeMeans(.) |> estimateMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD    Skew    Kurt
    ## Level1  50.000   7.680   2.245  -0.427  -0.346
    ## Level2  50.000  11.320   4.245   0.164  -0.288
    ## Level3  50.000  11.960   4.165  -0.304  -0.418

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   7.680   0.317  49.000   7.042   8.318
    ## Level2  11.320   0.600  49.000  10.114  12.526
    ## Level3  11.960   0.589  49.000  10.776  13.144
