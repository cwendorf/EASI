# Estimation Approach to Statistical Inference  (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Basic Examples**](https://github.com/cwendorf/EASI/tree/master/B-BasicExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extensions**](https://github.com/cwendorf/EASI/tree/master/D-Extensions) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/E-ExtensionExamples) 

---

## Between-Subjects Factorial Example with Frenda Summary Statistics

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")
```

### Enter Summary Statistics

```r
A1B1 <- c(N=26,M=1.50,SD=1.38)
A2B1 <- c(N=25,M=1.38,SD=1.50)
A1B2 <- c(N=26,M=1.14,SD=0.96)
A2B2 <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(A1B1,A2B1,A1B2,A2B2)
class(FrendaSummary) <- "bss"
FrendaSummary
```
```
      N    M   SD
A1B1 26 1.50 1.38
A2B1 25 1.38 1.50
A1B2 26 1.14 0.96
A2B2 26 2.22 1.68
attr(,"class")
[1] "bss"
```

### Analyses of the Different Groups

```r
estimateMeans(FrendaSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

      N    M   SD    SE    LL    UL
A1B1 26 1.50 1.38 0.271 0.943 2.057
A2B1 25 1.38 1.50 0.300 0.761 1.999
A1B2 26 1.14 0.96 0.188 0.752 1.528
A2B2 26 2.22 1.68 0.329 1.541 2.899
```
```r
plotMeans(FrendaSummary)
```
<kbd><img src="FrendaFigure1.jpg"></kbd>

### Analyses of the Marginal Means

```r
Evening <- c(.5,0,.5,0)
estimateContrast(FrendaSummary,contrast=Evening)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE     df    LL    UL
Contrast 1.32 0.165 44.605 0.988 1.652
```
```r
Morning <- c(0,.5,0,.5)
estimateContrast(FrendaSummary,contrast=Morning)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

         Est    SE    df    LL    UL
Contrast 1.8 0.223 48.74 1.352 2.248
```
```r
Sleep <- c(.5,.5,0,0)
estimateContrast(FrendaSummary,contrast=Sleep)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE     df    LL    UL
Contrast 1.44 0.202 48.269 1.034 1.846
```
```r
Nosleep <- c(0,0,.5,.5)
estimateContrast(FrendaSummary,contrast=Nosleep)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

          Est   SE     df    LL    UL
Contrast 1.68 0.19 39.753 1.296 2.064
```

### Analyses of the Factor A (Evening vs Morning) Main Effect

```r
mainFactorA <- c(.5,-.5,.5,-.5)
estimateContrast(FrendaSummary,contrast=mainFactorA)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE     df     LL    UL
Contrast -0.48 0.277 87.919 -1.031 0.071
```
```r
testContrast(FrendaSummary,contrast=mainFactorA)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE      t     df     p
Contrast -0.48 0.277 -1.732 87.919 0.087
```
```r
plotContrast(FrendaSummary,contrast=mainFactorA)
```
<kbd><img src="FrendaFigure2.jpg"></kbd>

### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

```r
mainFactorB <- c(-.5,-.5,.5,.5)
estimateContrast(FrendaSummary,contrast=mainFactorB)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE     df     LL    UL
Contrast 0.24 0.277 87.919 -0.311 0.791
```
```r
testContrast(FrendaSummary,contrast=mainFactorB)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

          Est    SE     t     df     p
Contrast 0.24 0.277 0.866 87.919 0.389
```
```r
plotContrast(FrendaSummary,contrast=mainFactorB)
```
<kbd><img src="FrendaFigure3.jpg"></kbd>

### Analyses of the Factor A x B Interaction

```r
Interaction <- c(.5,-.5,-.5,.5)
estimateContrast(FrendaSummary,contrast=Interaction)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

         Est    SE     df    LL    UL
Contrast 0.6 0.277 87.919 0.049 1.151
```
```r
testContrast(FrendaSummary,contrast=Interaction)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

         Est    SE     t     df     p
Contrast 0.6 0.277 2.165 87.919 0.033
```
```r
plotContrast(FrendaSummary,contrast=Interaction)
```
<kbd><img src="FrendaFigure4.jpg"></kbd>
