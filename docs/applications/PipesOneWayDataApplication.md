## Pipes One Way Data Application

This page introduces a variety of native and simple pipe operators to implement basic analysis functions using one-way (between-subjects) data.

### Data Management

Simulate some data.

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
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
```

```r
(Outcome~Factor) |> estimateMeans(conf.level=.99)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.446   8.034
## Level2  11.780   0.499  49.000  10.442  13.118
## Level3  11.880   0.607  49.000  10.253  13.507
```

However, the native pipe operator does not easily permit the piping of the variable, data frame, or formula to multiple functions on the ride-hand side of the call simultaneously. EASI contains a very simple pipe operator that uses a period as a placeholder, permitting more advanced piping options.

```r
(Outcome~Factor) %.>% estimateMeans(.)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
```

```r
(Outcome~Factor) %.>% c(estimateMeans(.),testMeans(.))
```

```
## [[1]]
## Outcome ~ Factor
## 
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   7.240   0.296  49.000  24.433   0.000
## Level2  11.780   0.499  49.000  23.597   0.000
## Level3  11.880   0.607  49.000  19.565   0.000
```

```r
(Outcome~Factor) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))
```

```
## [[1]]
## Outcome ~ Factor
## 
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.446   8.034
## Level2  11.780   0.499  49.000  10.442  13.118
## Level3  11.880   0.607  49.000  10.253  13.507
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.240   0.296  49.000   7.559   0.000
## Level2   6.780   0.499  49.000  13.581   0.000
## Level3   6.880   0.607  49.000  11.331   0.000
```

### Using Through Pipes

Traditionally, a pipe operator sends the results (not the input) of each operation in sequence to the next operation. Sometimes, it is useful to implement a "pass though" instead, where the input for the first call is also piped to the second call.

```r
(Outcome~Factor) %.>>% estimateMeans(.) %.>>% testMeans(.)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   7.240   0.296  49.000  24.433   0.000
## Level2  11.780   0.499  49.000  23.597   0.000
## Level3  11.880   0.607  49.000  19.565   0.000
```

```r
(Outcome~Factor) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.446   8.034
## Level2  11.780   0.499  49.000  10.442  13.118
## Level3  11.880   0.607  49.000  10.253  13.507
## 
## $`Hypothesis Tests for the Means`
##           Diff      SE      df       t       p
## Level1   2.240   0.296  49.000   7.559   0.000
## Level2   6.780   0.499  49.000  13.581   0.000
## Level3   6.880   0.607  49.000  11.331   0.000
```

In these examples, the through pipe is only required prior to the first analysis because the second one is the terminal call and thus nothing needs to "pass though". As a result, the second pipe operator could be the dot or the native pipe operator instead.

```r
(Outcome~Factor) %.>>% describeMeans(.) %.>% estimateMeans(.)
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1  50.000   7.240   2.095   0.209  -0.152
## Level2  50.000  11.780   3.530   0.053  -0.427
## Level3  50.000  11.880   4.294   0.239  -0.533
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
```

```r
(Outcome~Factor) %.>>% describeMeans(.) |> estimateMeans()
```

```
## $`Descriptive Statistics for the Data`
##              N       M      SD    Skew    Kurt
## Level1  50.000   7.240   2.095   0.209  -0.152
## Level2  50.000  11.780   3.530   0.053  -0.427
## Level3  50.000  11.880   4.294   0.239  -0.533
```

```
## $`Confidence Intervals for the Means`
##              M      SE      df      LL      UL
## Level1   7.240   0.296  49.000   6.645   7.835
## Level2  11.780   0.499  49.000  10.777  12.783
## Level3  11.880   0.607  49.000  10.660  13.100
```
