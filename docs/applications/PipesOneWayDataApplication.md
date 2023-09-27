## Pipes One Way Data Application

This page introduces a variety of native and simple pipe operators to implement basic analysis functions using one-way (between-subjects) data.

### Data Management

Enter the data.

```r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)
```

### Using the Native and Dot Pipes

In R versions 4.1 and greater, the native pipe operator can be used instead of standard syntax. Here, the variable (or data frame or formula) is included first, followed by the pipe operator, and then the function call (with any relevant additional parameters in parentheses). 

```r
(Outcome~Factor) |> estimateMeans()
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
```

```r
(Outcome~Factor) |> estimateMeans(conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.262   7.978
## Level2  10.840   0.497  49.000   9.509  12.171
## Level3  12.100   0.682  49.000  10.273  13.927
```

However, the native pipe operator does not easily permit the piping of the variable, data frame, or formula to multiple functions on the ride-hand side of the call simultaneously. EASI contains a very simple pipe operator that uses a period as a placeholder, permitting more advanced piping options.

```r
(Outcome~Factor) %.>% estimateMeans(.)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
```

```r
(Outcome~Factor) %.>% c(estimateMeans(.),testMeans(.))
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   7.120   0.320  49.000  22.232   0.000
## Level2  10.840   0.497  49.000  21.819   0.000
## Level3  12.100   0.682  49.000  17.750   0.000
```

```r
(Outcome~Factor) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.262   7.978
## Level2  10.840   0.497  49.000   9.509  12.171
## Level3  12.100   0.682  49.000  10.273  13.927
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.120   0.320  49.000   6.620   0.000
## Level2   5.840   0.497  49.000  11.755   0.000
## Level3   7.100   0.682  49.000  10.415   0.000
```

### Using Passthrough Pipes

Traditionally, a pipe operator sends the results (not the input) of each operation in sequence to the next operation. Sometimes, it is useful to implement a "pass though" instead, where the input from the first call is piped to the second call.

```r
(Outcome~Factor) %p>% estimateMeans(.) %p>% testMeans(.)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   7.120   0.320  49.000  22.232   0.000
## Level2  10.840   0.497  49.000  21.819   0.000
## Level3  12.100   0.682  49.000  17.750   0.000
```

```r
(Outcome~Factor) %p>% estimateMeans(.,conf.level=.99) %p>% testMeans(.,mu=5)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.262   7.978
## Level2  10.840   0.497  49.000   9.509  12.171
## Level3  12.100   0.682  49.000  10.273  13.927
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.120   0.320  49.000   6.620   0.000
## Level2   5.840   0.497  49.000  11.755   0.000
## Level3   7.100   0.682  49.000  10.415   0.000
```

Technically, the passthrough pipe is only required prior to the first analysis because the second one is the terminal call and thus nothing needs to "pass though". As a result, the second pipe operator could be native, the dot, or the passthrough pipe operator.

```r
(Outcome~Factor) %p>% describeMeans(.) %.>% estimateMeans(.)
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1  50.000   7.120   2.265  -0.078  -0.394
## Level2  50.000  10.840   3.513   0.006  -0.539
## Level3  50.000  12.100   4.820  -0.254  -0.823
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
```

```r
(Outcome~Factor) %p>% describeMeans(.) |> estimateMeans()
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1  50.000   7.120   2.265  -0.078  -0.394
## Level2  50.000  10.840   3.513   0.006  -0.539
## Level3  50.000  12.100   4.820  -0.254  -0.823
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.120   0.320  49.000   6.476   7.764
## Level2  10.840   0.497  49.000   9.842  11.838
## Level3  12.100   0.682  49.000  10.730  13.470
```
