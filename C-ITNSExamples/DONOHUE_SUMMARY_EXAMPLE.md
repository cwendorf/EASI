# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Within-Subjects Example with Donohue Summary Statistics

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")
```

### Enter Summary Statistics

```r
Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
sumstats <- rbind(Pretest,Posttest,Followup)
class(sumstats) <- "wss"
sumstats
```
```
          N    M    SD
Pretest  20 19.3 5.904
Posttest 20 23.6 4.762
Followup 20 23.4 4.616
attr(,"class")
[1] "wss"
```
```r
corrstats <- declareCorrMatrix("Pretest","Posttest","Followup")
corrstats["Pretest","Posttest"] <- .493
corrstats["Pretest","Followup"] <- .536
corrstats["Posttest","Followup"] <- .743
corrstats <- fillCorrMatrix(corrstats)
corrstats
```
```
         Pretest Posttest Followup
Pretest    1.000    0.493    0.536
Posttest   0.493    1.000    0.743
Followup   0.536    0.743    1.0``
```

### Analyses of the Different Variables

```r
estimateMeans(sumstats)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

          N    M    SD    SE     LL     UL
Pretest  20 19.3 5.904 1.320 16.537 22.063
Posttest 20 23.6 4.762 1.065 21.371 25.829
Followup 20 23.4 4.616 1.032 21.240 25.560
```
```r
plotMeans(sumstats)
```
<kbd><img src="DonohueFigure1.jpg"></kbd>
 
### Analysis of a Variable Difference

```r
compstats <- sumstats[c(2,3),]
class(compstats) <- "wss"
estimateDifference(compstats,corrstats)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

  Diff     SE     df     LL     UL 
 0.200  0.753 19.000 -1.375  1.775 
```
```r
plotDifference(compstats,corrstats)
```
<kbd><img src="DonohueFigure2.jpg"></kbd>
```r
effectDifference(compstats,corrstats)
```
```
STANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON

     d      g     LL     UL 
 0.043  0.042 -0.281  0.369 
```

### Analysis of a Variable Contrast

```r
PrevsPostFollow <- c(1,-.5,.5)
estimateContrast(sumstats,corrstats,contrast=PrevsPostFollow)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE df     LL     UL
Contrast 19.2 1.386 19 16.299 22.101
```
```r
plotContrast(sumstats,corrstats,contrast=PrevsPostFollow)
```
<kbd><img src="DonohueFigure3.jpg"></kbd>
```r
testContrast(sumstats,corrstats,contrast=PrevsPostFollow)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

          Est    SE      t df p
Contrast 19.2 1.386 13.851 19 0
```