# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## Summarize - OneWay (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Summarize-Extension.R")
```

### Enter Data

```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
OneWayData
```
```
   Factor Outcome
1  Level1       0
2  Level1       0
3  Level1       3
4  Level1       5
5  Level2       4
6  Level2       7
7  Level2       4
8  Level2       9
9  Level3       9
10 Level3       6
11 Level3       4
12 Level3       9

### Summaries of Multiple Groups

```r
summarizeData(Outcome~Factor)
```
```
SUMMARY STATISTICS FOR THE DATA

       Lower Whisker Lower Hinge Median Upper Hinge Upper Whisker
Level1             0           0    1.5           4             5
Level2             4           4    5.5           8             9
Level3             4           5    7.5           9             9
```

### Boxplots of Multiple Groups

```r
plotData(Outcome~Factor) # SummarizeOneWay-Figure1.jpeg
```
<kbd><img src="SummarizeOneWay-Figure1.jpeg"></kbd>
```r
plotData(Outcome~Factor,method="stack",col="black") # SummarizeOneWay-Figure2.jpeg
```
<kbd><img src="SummarizeOneWay-Figure2.jpeg"></kbd>