
## Frequencies OneWay Data Application

This page provides basic data plots and frequency distributions using
one-way (between-subjects) data.

- [Data Management](#data-management)
- [Data Plots](#data-plots)
- [Frequency Distributions](#frequency-distributions)

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

### Data Plots

Plot the data and enhance with color.

``` r
(Outcome~Factor) |> plotData(offset=0,method="jitter",col=c("darkred","darkblue","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-Data-1.png)<!-- -->

### Frequency Distributions

Describe the frequency distributions.

``` r
(Outcome~Factor) |> describeFrequencies()
```

    ## $`Frequency Distribution for the Data: Level1`
    ##       Freq    Perc CumFreq CumPerc
    ## 3    2.000   4.000   2.000   4.000
    ## 4    3.000   6.000   5.000  10.000
    ## 5    4.000   8.000   9.000  18.000
    ## 6   10.000  20.000  19.000  38.000
    ## 7    6.000  12.000  25.000  50.000
    ## 8    9.000  18.000  34.000  68.000
    ## 9    7.000  14.000  41.000  82.000
    ## 10   5.000  10.000  46.000  92.000
    ## 11   3.000   6.000  49.000  98.000
    ## 12   1.000   2.000  50.000 100.000
    ## 
    ## $`Frequency Distribution for the Data: Level2`
    ##       Freq    Perc CumFreq CumPerc
    ## 3    1.000   2.000   1.000   2.000
    ## 4    3.000   6.000   4.000   8.000
    ## 5    1.000   2.000   5.000  10.000
    ## 6    3.000   6.000   8.000  16.000
    ## 7    1.000   2.000   9.000  18.000
    ## 8    6.000  12.000  15.000  30.000
    ## 9    5.000  10.000  20.000  40.000
    ## 10   6.000  12.000  26.000  52.000
    ## 11   2.000   4.000  28.000  56.000
    ## 12   2.000   4.000  30.000  60.000
    ## 13   6.000  12.000  36.000  72.000
    ## 14   4.000   8.000  40.000  80.000
    ## 15   1.000   2.000  41.000  82.000
    ## 16   3.000   6.000  44.000  88.000
    ## 17   2.000   4.000  46.000  92.000
    ## 18   1.000   2.000  47.000  94.000
    ## 19   2.000   4.000  49.000  98.000
    ## 23   1.000   2.000  50.000 100.000
    ## 
    ## $`Frequency Distribution for the Data: Level3`
    ##       Freq    Perc CumFreq CumPerc
    ## 1    1.000   2.000   1.000   2.000
    ## 5    3.000   6.000   4.000   8.000
    ## 7    2.000   4.000   6.000  12.000
    ## 8    3.000   6.000   9.000  18.000
    ## 9    4.000   8.000  13.000  26.000
    ## 10   3.000   6.000  16.000  32.000
    ## 11   4.000   8.000  20.000  40.000
    ## 12   8.000  16.000  28.000  56.000
    ## 13   6.000  12.000  34.000  68.000
    ## 14   2.000   4.000  36.000  72.000
    ## 15   2.000   4.000  38.000  76.000
    ## 16   1.000   2.000  39.000  78.000
    ## 17   5.000  10.000  44.000  88.000
    ## 18   1.000   2.000  45.000  90.000
    ## 19   2.000   4.000  47.000  94.000
    ## 20   3.000   6.000  50.000 100.000

Plot the frequency distributions and enhance with color.

``` r
(Outcome~Factor) |> plotFrequencies(offset=0,col=c("darkred","darkblue","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-Frequencies-1.png)<!-- -->
