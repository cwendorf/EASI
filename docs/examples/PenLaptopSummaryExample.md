
## PenLaptop Summary Statistics Example

This page analyzes a two-group between-subjects (independent groups)
design using summary statistics input.

- [PenLaptop1 Sample](#penlaptop1-sample)
- [PenLaptop2 Sample](#penlaptop2-sample)
- [PenLaptop3 Sample](#penlaptop3-sample)

------------------------------------------------------------------------

### PenLaptop1 Sample

PenLaptop1 focuses on the difference between two groups in the first
sample. First, create a table of summary statistics.

``` r
Pen <- c(N=34,M=8.812,SD=4.749)
Laptop <- c(N=31,M=14.519,SD=7.286)
PenLaptop1Summary <- rbind(Pen,Laptop)
class(PenLaptop1Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the
difference between the two conditions.

``` r
estimateMeanComparison(PenLaptop1Summary)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Pen      8.812   0.814  33.000   7.155  10.469
    ## Laptop  14.519   1.309  30.000  11.846  17.192
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   5.707   1.541  50.812   2.612   8.802

``` r
plotMeanComparison(PenLaptop1Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %",ylim=c(0,20),values=FALSE)
```

![](figures/PenLaptop1-Summary-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect
size for the difference.

``` r
estimateStandardizedMeanDifference(PenLaptop1Summary)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   0.928   0.270   0.398   1.458

### PenLaptop2 Sample

PenLaptop2 focuses on the difference between two groups in the second
sample. Thus, create a table of summary statistics.

``` r
Pen <- c(N=48,M=6.881,SD=4.219)
Laptop <- c(N=103,M=12.088,SD=5.525)
PenLaptop2Summary <- rbind(Pen,Laptop)
class(PenLaptop2Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the
difference between the two conditions.

``` r
estimateMeanComparison(PenLaptop2Summary)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Pen      6.881   0.609  47.000   5.656   8.106
    ## Laptop  12.088   0.544 102.000  11.008  13.168
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   5.207   0.817 117.548   3.589   6.825

``` r
plotMeanComparison(PenLaptop2Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %",ylim=c(0,20),values=FALSE)
```

![](figures/PenLaptop2-Summary-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect
size for the difference.

``` r
estimateStandardizedMeanDifference(PenLaptop2Summary)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.059   0.179   0.709   1.409

### PenLaptop3 Sample

PenLaptop3 focuses on the difference between two groups in the third
sample. Thus, create a table of summary statistics.

``` r
Pen <- c(N=54,M=4.178,SD=2.549)
Laptop <- c(N=55,M=11.622,SD=5.681)
PenLaptop3Summary <- rbind(Pen,Laptop)
class(PenLaptop3Summary) <- "bss"
```

The primary emphasis of the analysis is to estimate and represent the
difference between the two conditions.

``` r
estimateMeanComparison(PenLaptop3Summary)
```

    ## $`Confidence Intervals for the Means`
    ##              M      SE      df      LL      UL
    ## Pen      4.178   0.347  53.000   3.482   4.874
    ## Laptop  11.622   0.766  54.000  10.086  13.158
    ## 
    ## $`Confidence Interval for the Mean Difference`
    ##               Diff      SE      df      LL      UL
    ## Comparison   7.444   0.841  75.195   5.769   9.119

``` r
plotMeanComparison(PenLaptop3Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %",ylim=c(0,20),values=FALSE)
```

![](figures/PenLaptop3-Summary-Comparison-1.png)<!-- -->

The secondary emphasis of the analysis is provide a standardized effect
size for the difference.

``` r
estimateStandardizedMeanDifference(PenLaptop3Summary)
```

    ## $`Confidence Interval for the Standardized Mean Difference`
    ##                  d      SE      LL      UL
    ## Comparison   1.691   0.237   1.226   2.156
