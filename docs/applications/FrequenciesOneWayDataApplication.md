
## Frequencies OneWay Data Application

### Data Management

Simulate some data.

```r
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- round(rnorm(50,mean=7,sd=2),0)
Group2 <- round(rnorm(50,mean=11,sd=4),0)
Group3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Group1,Group2,Group3)
```

### Frequency Distributions

Describe and plot the frequency distributions.

```r
(Outcome~Factor) |> describeFrequencies()
```

```
## $`Frequency Distribution for the Data: Group1`
##       Freq    Perc CumFreq CumPerc
## 3    2.000   4.000   2.000   4.000
## 4    7.000  14.000   9.000  18.000
## 5    2.000   4.000  11.000  22.000
## 6   15.000  30.000  26.000  52.000
## 7    7.000  14.000  33.000  66.000
## 8    5.000  10.000  38.000  76.000
## 9    3.000   6.000  41.000  82.000
## 10   6.000  12.000  47.000  94.000
## 11   3.000   6.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Group2`
##       Freq    Perc CumFreq CumPerc
## 4    3.000   6.000   3.000   6.000
## 5    1.000   2.000   4.000   8.000
## 6    3.000   6.000   7.000  14.000
## 7    3.000   6.000  10.000  20.000
## 8    1.000   2.000  11.000  22.000
## 9   10.000  20.000  21.000  42.000
## 10   8.000  16.000  29.000  58.000
## 11   8.000  16.000  37.000  74.000
## 12   3.000   6.000  40.000  80.000
## 14   2.000   4.000  42.000  84.000
## 15   3.000   6.000  45.000  90.000
## 17   2.000   4.000  47.000  94.000
## 18   2.000   4.000  49.000  98.000
## 19   1.000   2.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Group3`
##       Freq    Perc CumFreq CumPerc
## 6    2.000   4.000   2.000   4.000
## 7    3.000   6.000   5.000  10.000
## 8    4.000   8.000   9.000  18.000
## 9    4.000   8.000  13.000  26.000
## 10   9.000  18.000  22.000  44.000
## 11   2.000   4.000  24.000  48.000
## 12   5.000  10.000  29.000  58.000
## 13   8.000  16.000  37.000  74.000
## 14   5.000  10.000  42.000  84.000
## 15   2.000   4.000  44.000  88.000
## 16   1.000   2.000  45.000  90.000
## 17   1.000   2.000  46.000  92.000
## 18   2.000   4.000  48.000  96.000
## 19   2.000   4.000  50.000 100.000
```

```r
(Outcome~Factor) |> plotFrequencies()
```

![](figures/Frequencies-OneWay-FrequenciesA-1.png)<!-- -->

Enhance the frequency distribution plot by adding color.

```r
(Outcome~Factor) |> plotFrequencies(offset=0,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-FrequenciesB-1.png)<!-- -->

### Percentiles and Boxes

Describe the percretiles and plot the boxes.

```r
(Outcome~Factor) |> describePercentiles()
```

```
## $`Percentiles for the Data`
##            Min     25%     50%     75%     Max
## Group1   3.000   6.000   6.000   8.000  11.000
## Group2   4.000   9.000  10.000  11.750  19.000
## Group3   6.000   9.250  12.000  13.750  19.000
```

```r
(Outcome~Factor) |> describeBoxes()
```

```
## $`Boxplot Statistics for the Data`
##             LW      LH     Mdn      UH      UW
## Group1   3.000   6.000   6.000   8.000  11.000
## Group2   5.000   9.000  10.000  12.000  15.000
## Group3   6.000   9.000  12.000  14.000  19.000
```

```r
(Outcome~Factor) |> plotBoxes()
```

![](figures/Frequencies-OneWay-BoxesA-1.png)<!-- -->

Enhance the frequency distribution plot by adding color.

```r
(Outcome~Factor) |> plotBoxes(values=FALSE,offset=0,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-BoxesB-1.png)<!-- -->
