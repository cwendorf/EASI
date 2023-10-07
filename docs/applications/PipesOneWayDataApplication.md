
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
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985

``` r
(Outcome~Factor) |> estimateMeans(conf.level=.99)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.078   7.522
    ## Level2  11.520   0.477  49.000  10.240  12.800
    ## Level3  11.900   0.540  49.000  10.453  13.347

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
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985

``` r
(Outcome~Factor) %.>% c(estimateMeans(.),testMeans(.))
```

    ## [[1]]
    ## Outcome ~ Factor
    ## 
    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   6.800   0.270  49.000  25.228   0.000
    ## Level2  11.520   0.477  49.000  24.129   0.000
    ## Level3  11.900   0.540  49.000  22.036   0.000

``` r
(Outcome~Factor) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))
```

    ## [[1]]
    ## Outcome ~ Factor
    ## 
    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.078   7.522
    ## Level2  11.520   0.477  49.000  10.240  12.800
    ## Level3  11.900   0.540  49.000  10.453  13.347
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   1.800   0.270  49.000   6.678   0.000
    ## Level2   6.520   0.477  49.000  13.656   0.000
    ## Level3   6.900   0.540  49.000  12.777   0.000

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
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   6.800   0.270  49.000  25.228   0.000
    ## Level2  11.520   0.477  49.000  24.129   0.000
    ## Level3  11.900   0.540  49.000  22.036   0.000

``` r
(Outcome~Factor) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.078   7.522
    ## Level2  11.520   0.477  49.000  10.240  12.800
    ## Level3  11.900   0.540  49.000  10.453  13.347
    ## 
    ## $`Hypothesis Tests for the Means`
    ##           Diff      SE      df       t       p
    ## Level1   1.800   0.270  49.000   6.678   0.000
    ## Level2   6.520   0.477  49.000  13.656   0.000
    ## Level3   6.900   0.540  49.000  12.777   0.000

In these examples, the through pipe is only required prior to the first
analysis because the second one is the terminal call and thus nothing
needs to “pass though”. As a result, the second pipe operator could be
the dot or the native pipe operator instead.

``` r
(Outcome~Factor) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD    Skew    Kurt
    ## Level1  50.000   6.800   1.906  -0.365  -0.434
    ## Level2  50.000  11.520   3.376  -0.308  -0.232
    ## Level3  50.000  11.900   3.819  -0.238  -0.344

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985

``` r
(Outcome~Factor) %.>>% describeMeans(.) |> estimateMeans()
```

    ## $`Descriptive Statistics for the Data`
    ##              N       M      SD    Skew    Kurt
    ## Level1  50.000   6.800   1.906  -0.365  -0.434
    ## Level2  50.000  11.520   3.376  -0.308  -0.232
    ## Level3  50.000  11.900   3.819  -0.238  -0.344

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Level1   6.800   0.270  49.000   6.258   7.342
    ## Level2  11.520   0.477  49.000  10.561  12.479
    ## Level3  11.900   0.540  49.000  10.815  12.985
