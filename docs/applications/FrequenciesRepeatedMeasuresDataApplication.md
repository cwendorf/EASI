
## Frequencies Repeated Measures Data Application

This page provides basic data plots and frequency distributions using
repeated-measures (within-subjects) data.

- [Data Management](#data-management)
- [Data Plots](#data-plots)
- [Frequency Distributions](#frequency-distributions)

------------------------------------------------------------------------

### Data Management

Simulate some data.

``` r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Data Plots

Plot the data and enhance with color.

``` r
(RepeatedData) |> plotData(offset=0,method="overplot",connect=TRUE,col="darkblue")
```

![](figures/Frequencies-Repeated-Data-1.png)<!-- -->

### Frequency Distributions

Describe the frequency distributions.

``` r
(RepeatedData) |> describeFrequencies()
```

    ## $`Frequency Distribution for the Data: Outcome1`
    ##       Freq    Perc CumFreq CumPerc
    ## 2    3.000   6.000   3.000   6.000
    ## 3    1.000   2.000   4.000   8.000
    ## 4    3.000   6.000   7.000  14.000
    ## 5    3.000   6.000  10.000  20.000
    ## 6    7.000  14.000  17.000  34.000
    ## 7   10.000  20.000  27.000  54.000
    ## 8   11.000  22.000  38.000  76.000
    ## 9    7.000  14.000  45.000  90.000
    ## 10   3.000   6.000  48.000  96.000
    ## 11   2.000   4.000  50.000 100.000
    ## 
    ## $`Frequency Distribution for the Data: Outcome2`
    ##       Freq    Perc CumFreq CumPerc
    ## 0    1.000   2.000   1.000   2.000
    ## 1    1.000   2.000   2.000   4.000
    ## 3    2.000   4.000   4.000   8.000
    ## 4    3.000   6.000   7.000  14.000
    ## 6    2.000   4.000   9.000  18.000
    ## 7    2.000   4.000  11.000  22.000
    ## 8    2.000   4.000  13.000  26.000
    ## 9    8.000  16.000  21.000  42.000
    ## 10   9.000  18.000  30.000  60.000
    ## 11   3.000   6.000  33.000  66.000
    ## 12   6.000  12.000  39.000  78.000
    ## 13   3.000   6.000  42.000  84.000
    ## 14   3.000   6.000  45.000  90.000
    ## 16   2.000   4.000  47.000  94.000
    ## 17   1.000   2.000  48.000  96.000
    ## 18   1.000   2.000  49.000  98.000
    ## 19   1.000   2.000  50.000 100.000
    ## 
    ## $`Frequency Distribution for the Data: Outcome3`
    ##       Freq    Perc CumFreq CumPerc
    ## 0    2.000   4.000   2.000   4.000
    ## 4    1.000   2.000   3.000   6.000
    ## 5    1.000   2.000   4.000   8.000
    ## 6    1.000   2.000   5.000  10.000
    ## 7    3.000   6.000   8.000  16.000
    ## 8    4.000   8.000  12.000  24.000
    ## 9    1.000   2.000  13.000  26.000
    ## 10   5.000  10.000  18.000  36.000
    ## 11   7.000  14.000  25.000  50.000
    ## 12   6.000  12.000  31.000  62.000
    ## 13   7.000  14.000  38.000  76.000
    ## 14   4.000   8.000  42.000  84.000
    ## 15   1.000   2.000  43.000  86.000
    ## 16   2.000   4.000  45.000  90.000
    ## 17   3.000   6.000  48.000  96.000
    ## 18   1.000   2.000  49.000  98.000
    ## 19   1.000   2.000  50.000 100.000

Plot the frequency distributions and enhance with color.

``` r
(RepeatedData) |> plotFrequencies(offset=0,col="darkblue")
```

![](figures/Frequencies-Repeated-Frequencies-1.png)<!-- -->
