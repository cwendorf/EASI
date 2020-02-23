># Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Relational Intervals - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions

### Enter Summary Statistics

```r
Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary
```
```
       N M    SD
Level1 4 2 2.449
Level2 4 6 2.449
Level3 4 7 2.449
attr(,"class")
[1] "bss"
```

### Relational Intervals

```r
estimateRelational(OneWaySummary)
```
```
CONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS

             M   CI.LL   CI.UL   RI.LL   RI.UL
Level1   2.000  -1.897   5.897   0.041   3.959
Level2   6.000   2.103   9.897   4.041   7.959
Level3   7.000   3.103  10.897   5.041   8.959
```

```r
plotMeans(OneWaySummary)
```
<kbd><img src="OneWayFigure1.jpeg"></kbd>
```r
addRelational(OneWaySummary)
```
<kbd><img src="OneWayFigure2.jpeg"></kbd>

```r
plotRelational(OneWaySummary)
```
<kbd><img src="OneWayFigure3.jpeg"></kbd>
```r
plotRelational(OneWaySummary,conf.level=.99,mu=70)
```
<kbd><img src="OneWayFigure4.jpeg"></kbd>
