# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Summarize - OneWay (Between-Subjects) Tutorial with Data

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
```

### Summaries of Multiple Groups

```r
summarizeData(Outcome~Factor)
```
```
SUMMARY STATISTICS FOR THE DATA

       Lower Whisker Lower Hinge  Median Upper Hinge Upper Whisker
Level1         0.000       0.000   1.500       4.000         5.000
Level2         4.000       4.000   5.500       8.000         9.000
Level3         4.000       5.000   7.500       9.000         9.000
```

### Boxplots of Multiple Groups

```r
plotBoxes(Outcome~Factor)
```
<kbd><img src="SummarizeOneWayFigure1.jpeg"></kbd>
```r
addData(Outcome~Factor,method="stack")
```
<kbd><img src="SummarizeOneWayFigure2.jpeg"></kbd>