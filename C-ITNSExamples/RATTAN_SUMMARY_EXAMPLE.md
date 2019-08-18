# Estimation Approach to Statistical Inference  (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Between-Subjects Example with Rattan Summary Statistics

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")
```

### Enter Summary Statistics

```r
Comfort <- c(N=18,M=3.333,SD=1.917)
Challenge <- c(N=17,M=5.265,SD=1.448)
Control <- c(N=19,M=4.447,SD=1.433)
sumstats <- rbind(Comfort,Challenge,Control)
class(sumstats) <- "bss"
sumstats
```
```
           N     M    SD
Comfort   18 3.333 1.917
Challenge 17 5.265 1.448
Control   19 4.447 1.433
attr(,"class")
[1] "bss"
```

### Analyses of the Different Groups

```r
estimateMeans(sumstats)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

           N     M    SD    SE    LL    UL
Comfort   18 3.333 1.917 0.452 2.380 4.287
Challenge 17 5.265 1.448 0.351 4.520 6.009
Control   19 4.447 1.433 0.329 3.757 5.138
```
```r
plotMeans(sumstats)
```
<kbd><img src="RattanFigure1.jpg"></kbd>

### Analysis of a Group Difference

```r
compstats <- rbind(Comfort,Challenge)
class(compstats) <- "bss"
estimateDifference(compstats)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

  Diff     SE     df     LL     UL 
-1.931  0.572 31.521 -3.098 -0.765 
```
```r
plotDifference(ccompstats)
```
<kbd><img src="RattanFigure2.jpg"></kbd>
```r
effectDifference(compstats)
```
```
STANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON

    d     g    LL    UL 
1.133 1.107 0.439 1.925 
```

### Analysis of a Group Contrast

```r
ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(sumstats,contrast=ComfortvsOthers)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE     df    LL    UL
Contrast 1.523 0.512 26.903 0.473 2.573
```
```r
plotContrast(sumstats,contrast=ComfortvsOthers)
```
<kbd><img src="RattanFigure3.jpg"></kbd>
```r
testContrast(sumstats,contrast=ComfortvsOthers)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t     df     p
Contrast 1.523 0.512 2.975 26.903 0.006
```
