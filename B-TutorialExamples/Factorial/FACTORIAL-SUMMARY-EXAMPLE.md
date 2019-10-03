# Estimation Approach to Statistical Inference  (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Other Examples**](https://github.com/cwendorf/EASI/tree/master/D-OtherExamples) 

---

## Factorial Between-Subjects Summary Statistics Example

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
```

### Enter Summary Statistics

```r
A1B1 <- c(N=4,M=2.000,SD=2.449)
A2B1 <- c(N=4,M=6.000,SD=2.449)
A1B2 <- c(N=4,M=7.000,SD=2.449)
A2B2 <- c(N=4,M=5.000,SD=2.449)
FactorialSummary <- rbind(A1B1,A2B1,A1B2,A2B2)
class(FactorialSummary) <- "bss"
FactorialSummary
```
```
     N M    SD
A1B1 4 2 2.449
A2B1 4 6 2.449
A1B2 4 7 2.449
A2B2 4 5 2.449
attr(,"class")
[1] "bss"
```

### Analyses of the Different Groups

```r
estimateMeans(FactorialSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

         N     M    SD    SE     LL     UL
A1B1 4.000 2.000 2.449 1.224 -1.897  5.897
A2B1 4.000 6.000 2.449 1.224  2.103  9.897
A1B2 4.000 7.000 2.449 1.224  3.103 10.897
A2B2 4.000 5.000 2.449 1.224  1.103  8.897
```
```r
plotMeans(FactorialSummary)
```
<kbd><img src="FactorialBetween-Figure1.jpg"></kbd>

### Analyses of the Marginal Means

```r
A1 <- c(.5,0,.5,0)
estimateContrast(FactorialSummary,contrast=A1)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.500 0.866 6.000 2.381 6.619
```
```r
A2 <- c(0,.5,0,.5)
estimateContrast(FactorialSummary,contrast=A2)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 5.500 0.866 6.000 3.381 7.619
```
```r
B1 <- c(.5,.5,0,0)
estimateContrast(FactorialSummary,contrast=B1)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.000 0.866 6.000 1.881 6.119
```
```r
B2<- c(0,0,.5,.5)
estimateContrast(FactorialSummary,contrast=B2)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 6.000 0.866 6.000 3.881 8.119
```

### Analyses of the Factor A Main Effect

```r
mainFactorA <- c(.5,-.5,.5,-.5)
estimateContrast(FactorialSummary,contrast=mainFactorA)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

            Est    SE     df     LL    UL
Contrast -1.000 1.224 12.000 -3.668 1.668
```
```r
plotContrast(FactorialSummary,contrast=mainFactorA)
```
<kbd><img src="FactorialBetween-Figure2.jpg"></kbd>
```r
testContrast(FactorialSummary,contrast=mainFactorA)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

            Est    SE      t     df     p
Contrast -1.000 1.224 -0.817 12.000 0.430
```
```r
standardizeContrast(FactorialSummary,contrast=mainFactorA)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

            Est    SE     LL    UL
Contrast -0.408 0.583 -1.552 0.735
```

### Analyses of the Factor B Main Effect

```r
mainFactorB <- c(-.5,-.5,.5,.5)
estimateContrast(FactorialSummary,contrast=mainFactorB)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE     df     LL    UL
Contrast 2.000 1.224 12.000 -0.668 4.668
```
```r
plotContrast(FactorialSummary,contrast=mainFactorB)
```
<kbd><img src="FactorialBetween-Figure3.jpg"></kbd>
```r
testContrast(FactorialSummary,contrast=mainFactorB)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t     df     p
Contrast 2.000 1.224 1.633 12.000 0.128
```
```r
standardizeContrast(FactorialSummary,contrast=mainFactorB)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE     LL    UL
Contrast 0.817 0.601 -0.361 1.994
```

### Analyses of the Factor A x B Interaction

```r
Interaction <- c(.5,-.5,-.5,.5)
estimateContrast(FactorialSummary,contrast=Interaction)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

            Est    SE     df     LL     UL
Contrast -3.000 1.224 12.000 -5.668 -0.332
```
```r
plotContrast(FactorialSummary,contrast=Interaction)
```
<kbd><img src="FactorialBetween-Figure4.jpg"></kbd>
```r
testContrast(FactorialSummary,contrast=Interaction)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

            Est    SE      t     df     p
Contrast -3.000 1.224 -2.450 12.000 0.031
```
```r
standardizeContrast(FactorialSummary,contrast=Interaction)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

            Est    SE     LL    UL
Contrast -1.225 0.629 -2.458 0.008
```
