
## Frequencies Repeated Measures Data Application

### Data Management

Simulate some data.

```r
Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
```

### Frequency Distributions

Describe and plot the frequency distributions.

```r
(RepeatedData) |> describeFrequencies()
```

```
## $`Frequency Distribution for the Data: Outcome1`
##       Freq    Perc CumFreq CumPerc
## 3    2.000   4.000   2.000   4.000
## 4    6.000  12.000   8.000  16.000
## 5    9.000  18.000  17.000  34.000
## 6    5.000  10.000  22.000  44.000
## 7    6.000  12.000  28.000  56.000
## 8    9.000  18.000  37.000  74.000
## 9    5.000  10.000  42.000  84.000
## 10   6.000  12.000  48.000  96.000
## 11   2.000   4.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Outcome2`
##       Freq    Perc CumFreq CumPerc
## 3    2.000   4.000   2.000   4.000
## 4    1.000   2.000   3.000   6.000
## 6    1.000   2.000   4.000   8.000
## 7    2.000   4.000   6.000  12.000
## 8    6.000  12.000  12.000  24.000
## 9    2.000   4.000  14.000  28.000
## 10   4.000   8.000  18.000  36.000
## 11   7.000  14.000  25.000  50.000
## 12   6.000  12.000  31.000  62.000
## 13   9.000  18.000  40.000  80.000
## 14   2.000   4.000  42.000  84.000
## 15   5.000  10.000  47.000  94.000
## 16   1.000   2.000  48.000  96.000
## 17   1.000   2.000  49.000  98.000
## 19   1.000   2.000  50.000 100.000
## 
## $`Frequency Distribution for the Data: Outcome3`
##       Freq    Perc CumFreq CumPerc
## 4    1.000   2.000   1.000   2.000
## 5    1.000   2.000   2.000   4.000
## 6    2.000   4.000   4.000   8.000
## 7    3.000   6.000   7.000  14.000
## 8    2.000   4.000   9.000  18.000
## 9    5.000  10.000  14.000  28.000
## 10   3.000   6.000  17.000  34.000
## 11   4.000   8.000  21.000  42.000
## 12   4.000   8.000  25.000  50.000
## 13   8.000  16.000  33.000  66.000
## 14   2.000   4.000  35.000  70.000
## 15   4.000   8.000  39.000  78.000
## 16   2.000   4.000  41.000  82.000
## 17   2.000   4.000  43.000  86.000
## 18   2.000   4.000  45.000  90.000
## 19   1.000   2.000  46.000  92.000
## 20   1.000   2.000  47.000  94.000
## 21   2.000   4.000  49.000  98.000
## 26   1.000   2.000  50.000 100.000
```

```r
(RepeatedData) |> plotFrequencies()
```

![](figures/Frequencies-Repeated-FrequenciesA-1.png)<!-- -->

Enhance the frequency distribution plot by adding color.

```r
(RepeatedData) |> plotFrequencies(offset=0,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Frequencies-Repeated-FrequenciesB-1.png)<!-- -->

### Percentiles and Boxes

Describe the percretiles and plot the boxes.

```r
(RepeatedData) |> describePercentiles()
```

```
## $`Percentiles for the Data`
##              Min     25%     50%     75%     Max
## Outcome1   3.000   5.000   7.000   8.750  11.000
## Outcome2   3.000   9.000  11.500  13.000  19.000
## Outcome3   4.000   9.000  12.500  15.000  26.000
```

```r
(RepeatedData) |> describeBoxes()
```

```
## $`Boxplot Statistics for the Data`
##               LW      LH     Mdn      UH      UW
## Outcome1   3.000   5.000   7.000   9.000  11.000
## Outcome2   3.000   9.000  11.500  13.000  19.000
## Outcome3   4.000   9.000  12.500  15.000  21.000
```

```r
(RepeatedData) |> plotBoxes()
```

![](figures/Frequencies-Repeated-BoxesA-1.png)<!-- -->

Enhance the frequency distribution plot by adding color.

```r
(RepeatedData) |> plotBoxes(values=FALSE,offset=0,scale=3,col=c("darkblue","darkred","darkgoldenrod"))
```

![](figures/Frequencies-Repeated-BoxesB-1.png)<!-- -->
