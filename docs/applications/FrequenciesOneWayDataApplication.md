## Frequencies OneWay Data Application

This page provides basic data plots and frequency distributions using one-way (between-subjects) data.

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

### Data Plots

Plot the data and enhance with color.

```r
(Outcome~Factor) |> plotData(offset=0,method="jitter",col=c("darkred","darkblue","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-Data-1.png)<!-- -->

### Frequency Distributions

Describe the frequency distributions.

```r
(Outcome~Factor) |> describeFrequencies()
```

```
## $`Frequency Distribution for the Data: Level1`
##       Freq    Perc CumFreq CumPerc
## 2    3.000   6.000   3.000   6.000
## 3    2.000   4.000   5.000  10.000
## 4    6.000  12.000  11.000  22.000
## 5    8.000  16.000  19.000  38.000
## 6    8.000  16.000  27.000  54.000
## 7    9.000  18.000  36.000  72.000
## 8    8.000  16.000  44.000  88.000
## 9    3.000   6.000  47.000  94.000
## 10   2.000   4.000  49.000  98.000
## 12   1.000   2.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Level2`
##       Freq    Perc CumFreq CumPerc
## 1    1.000   2.000   1.000   2.000
## 6    3.000   6.000   4.000   8.000
## 7    3.000   6.000   7.000  14.000
## 8    9.000  18.000  16.000  32.000
## 9    4.000   8.000  20.000  40.000
## 10   7.000  14.000  27.000  54.000
## 11   6.000  12.000  33.000  66.000
## 12   4.000   8.000  37.000  74.000
## 13   4.000   8.000  41.000  82.000
## 14   3.000   6.000  44.000  88.000
## 15   2.000   4.000  46.000  92.000
## 16   1.000   2.000  47.000  94.000
## 18   2.000   4.000  49.000  98.000
## 19   1.000   2.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Level3`
##       Freq    Perc CumFreq CumPerc
## 5    1.000   2.000   1.000   2.000
## 6    2.000   4.000   3.000   6.000
## 7    2.000   4.000   5.000  10.000
## 8    1.000   2.000   6.000  12.000
## 9    4.000   8.000  10.000  20.000
## 10   5.000  10.000  15.000  30.000
## 11   4.000   8.000  19.000  38.000
## 12   5.000  10.000  24.000  48.000
## 13   6.000  12.000  30.000  60.000
## 14   3.000   6.000  33.000  66.000
## 15   3.000   6.000  36.000  72.000
## 16   4.000   8.000  40.000  80.000
## 17   3.000   6.000  43.000  86.000
## 18   2.000   4.000  45.000  90.000
## 19   1.000   2.000  46.000  92.000
## 20   3.000   6.000  49.000  98.000
## 23   1.000   2.000  50.000 100.000
```

Plot the frequency distributions and enhance with color.

```r
(Outcome~Factor) |> plotFrequencies(offset=0,col=c("darkred","darkblue","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-Frequencies-1.png)<!-- -->
