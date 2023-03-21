
## Frequencies OneWay Data Application

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

### Frequency Distributions

Describe and plot the frequency distributions.

```r
(Outcome~Factor) |> describeFrequencies()
```

```
## $`Frequency Distribution for the Data: Level1`
##       Freq    Perc CumFreq CumPerc
## 4    2.000   4.000   2.000   4.000
## 5    4.000   8.000   6.000  12.000
## 6    6.000  12.000  12.000  24.000
## 7    9.000  18.000  21.000  42.000
## 8   10.000  20.000  31.000  62.000
## 9   11.000  22.000  42.000  84.000
## 10   8.000  16.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Level2`
##       Freq    Perc CumFreq CumPerc
## 1    1.000   2.000   1.000   2.000
## 2    1.000   2.000   2.000   4.000
## 3    2.000   4.000   4.000   8.000
## 5    2.000   4.000   6.000  12.000
## 6    4.000   8.000  10.000  20.000
## 7    1.000   2.000  11.000  22.000
## 8    5.000  10.000  16.000  32.000
## 9    4.000   8.000  20.000  40.000
## 10   7.000  14.000  27.000  54.000
## 11   7.000  14.000  34.000  68.000
## 12   6.000  12.000  40.000  80.000
## 13   2.000   4.000  42.000  84.000
## 14   1.000   2.000  43.000  86.000
## 15   3.000   6.000  46.000  92.000
## 16   3.000   6.000  49.000  98.000
## 18   1.000   2.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Level3`
##       Freq    Perc CumFreq CumPerc
## 3    1.000   2.000   1.000   2.000
## 4    1.000   2.000   2.000   4.000
## 5    1.000   2.000   3.000   6.000
## 6    1.000   2.000   4.000   8.000
## 8    5.000  10.000   9.000  18.000
## 9    4.000   8.000  13.000  26.000
## 10   4.000   8.000  17.000  34.000
## 11   5.000  10.000  22.000  44.000
## 12   9.000  18.000  31.000  62.000
## 13   6.000  12.000  37.000  74.000
## 14   1.000   2.000  38.000  76.000
## 15   4.000   8.000  42.000  84.000
## 16   4.000   8.000  46.000  92.000
## 17   2.000   4.000  48.000  96.000
## 19   1.000   2.000  49.000  98.000
## 21   1.000   2.000  50.000 100.000
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
## Level1   4.000   7.000   8.000   9.000  10.000
## Level2   1.000   8.000  10.000  12.000  18.000
## Level3   3.000   9.250  12.000  13.750  21.000
```

```r
(Outcome~Factor) |> describeBoxes()
```

```
## $`Boxplot Statistics for the Data`
##             LW      LH     Mdn      UH      UW
## Level1   4.000   7.000   8.000   9.000  10.000
## Level2   2.000   8.000  10.000  12.000  18.000
## Level3   3.000   9.000  12.000  14.000  21.000
```

```r
(Outcome~Factor) |> plotBoxes()
```

![](figures/Frequencies-OneWay-BoxesA-1.png)<!-- -->

Enhance the frequency distribution plot by adding color.

```r
(Outcome~Factor) |> plotBoxes(values=FALSE,offset=0,scale=3,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Frequencies-OneWay-BoxesB-1.png)<!-- -->
