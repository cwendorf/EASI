# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Relational Intervals - Repeated (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

```r
Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary
```
```
         N M    SD
Outcome1 4 2 2.449
Outcome2 4 6 2.449
Outcome3 4 7 2.449
attr(,"class")
[1] "wss"
```
```r
RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr
```
```         Outcome1 Outcome2 Outcome3
Outcome1    1.000    0.500    0.056
Outcome2    0.500    1.000    0.389
Outcome3    0.056    0.389    1.000
```

### Relational Intervals

```r
estimateRelational(RepeatedSummary,RepeatedCorr)
```
```
CONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS

               M   CI.LL   CI.UL   RI.LL   RI.UL
Outcome1   2.000  -1.897   5.897   0.246   3.754
Outcome2   6.000   2.103   9.897   4.246   7.754
Outcome3   7.000   3.103  10.897   5.246   8.754
```

```r
plotMeans(RepeatedSummary)
```
<kbd><img src="RelationalRepeatedFigure1.jpeg"></kbd>
```r
addRelational(RepeatedSummary,RepeatedCorr)
```
<kbd><img src="RelationalRepeatedFigure2.jpeg"></kbd>
```r
plotRelational(RepeatedSummary,RepeatedCorr)
```
<kbd><img src="RelationalRepeatedFigure3.jpeg"></kbd>
```r
plotRelational(RepeatedSummary,RepeatedCorr,conf.level=.99,mu=70)
```
<kbd><img src="RelationalRepeatedFigure4.jpeg"></kbd>
