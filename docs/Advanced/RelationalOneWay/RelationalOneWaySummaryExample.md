># Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Relational Intervals - OneWay (Between-Subjects) Example with Wendorf Summary Statistics

### Source the EASI Functions

### Enter Summary Statistics

```r
L1 <- c(N=10,M=67.000,SD=4.295)
L2 <- c(N=10,M=71.000,SD=5.375)
L3 <- c(N=10,M=72.500,SD=4.859)
L4 <- c(N=10,M=76.000,SD=6.583)
L5 <- c(N=10,M=65.500,SD=4.972)
RelationalOneWaySummary <- rbind(L1,L2,L3,L4,L5)
class(RelationalOneWaySummary) <- "bss"
RelationalOneWaySummary
```
```
    N    M    SD
L1 10 67.0 4.295
L2 10 71.0 5.375
L3 10 72.5 4.859
L4 10 76.0 6.583
L5 10 65.5 4.972
attr(,"class")
[1] "bss"
```

### Relational Intervals

```r
estimateRelational(RelationalOneWaySummary)
```
```
CONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS

      M  CI.LL  CI.UL  RI.LL  RI.UL
L1 67.0 63.928 70.072 64.625 69.375
L2 71.0 67.155 74.845 68.625 73.375
L3 72.5 69.024 75.976 70.125 74.875
L4 76.0 71.291 80.709 73.625 78.375
L5 65.5 61.943 69.057 63.125 67.875
```

```r
plotMeans(RelationalOneWaySummary) # RelationalOneWay-Figure1.jpeg
```
<kbd><img src="RelationalOneWay-Figure1.jpeg"></kbd>
```r
addRelational(RelationalOneWaySummary) # RelationalOneWay-Figure2.jpeg
```
<kbd><img src="RelationalOneWay-Figure2.jpeg"></kbd>
```r
plotRelational(RelationalOneWaySummary) # RelationalOneWay-Figure4.jpeg
```
<kbd><img src="RelationalOneWay-Figure4.jpeg"></kbd>
```r
plotRelational(RelationalOneWaySummary,conf.level=.99,mu=70) # RelationalOneWay-Figure5.jpeg
```
<kbd><img src="RelationalOneWay-Figure5.jpeg"></kbd>
