# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## FactorialBy - Factorial (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions and the Extension

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")
```

### Enter Summary Statistics

```r
A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummaryB1 <- rbind(A1,A2,A3)

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
BetweenSummaryB2 <- rbind(A1,A2,A3)

FactorialSummary <- list("B1"=BetweenSummaryB1,"B2"=BetweenSummaryB2)
class(FactorialSummary) <- "bss"
FactorialSummary
```
```
$B1
   N M    SD
A1 4 2 2.449
A2 4 6 2.449
A3 4 7 2.449

$B2
   N M    SD
A1 4 4 2.449
A2 4 4 2.449
A3 4 5 2.449

attr(,"class")
[1] "bss"
```

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

```r
estimateMeansBy(FactorialSummary)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

$B1
       N     M    SD    SE     LL     UL
A1 4.000 2.000 2.449 1.224 -1.897  5.897
A2 4.000 6.000 2.449 1.224  2.103  9.897
A3 4.000 7.000 2.449 1.224  3.103 10.897

$B2
       N     M    SD    SE    LL    UL
A1 4.000 4.000 2.449 1.224 0.103 7.897
A2 4.000 4.000 2.449 1.224 0.103 7.897
A3 4.000 5.000 2.449 1.224 1.103 8.897
```

```r
estimateMeansBy(FactorialSummary,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

$B1
       N     M    SD    SE     LL     UL
A1 4.000 2.000 2.449 1.224 -5.152  9.152
A2 4.000 6.000 2.449 1.224 -1.152 13.152
A3 4.000 7.000 2.449 1.224 -0.152 14.152

$B2
       N     M    SD    SE     LL     UL
A1 4.000 4.000 2.449 1.224 -3.152 11.152
A2 4.000 4.000 2.449 1.224 -3.152 11.152
A3 4.000 5.000 2.449 1.224 -2.152 12.152
```

#### Plot of the Confidence Intervals for the Means

```r
plotMeansBy(FactorialSummary) # Includes FactorialBy-Figure1.jpeg and FactorialBy-Figure2.jpeg
```
<kbd><img src="FactorialBy-Figure1.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure2.jpeg"></kbd>
```r
plotMeansBy(FactorialSummary,conf.level=.99,mu=5,rope=c(3,7)) # Includes FactorialBy-Figure3.jpeg and FactorialBy-Figure4.jpe
```
<kbd><img src="FactorialBy-Figure3.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure4.jpeg"></kbd>

#### Significance Tests for the Means

```r
testMeansBy(FactorialSummary)
```
```
HYPOTHESIS TESTS FOR THE MEANS

$B1
    Diff    SE     t    df     p
A1 2.000 1.224 1.633 3.000 0.201
A2 6.000 1.224 4.900 3.000 0.016
A3 7.000 1.224 5.717 3.000 0.011

$B2
    Diff    SE     t    df     p
A1 4.000 1.224 3.267 3.000 0.047
A2 4.000 1.224 3.267 3.000 0.047
A3 5.000 1.224 4.083 3.000 0.027
```

```r
testMeansBy(FactorialSummary,mu=5)
```
```
HYPOTHESIS TESTS FOR THE MEANS

$B1
     Diff    SE      t    df     p
A1 -3.000 1.224 -2.450 3.000 0.092
A2  1.000 1.224  0.817 3.000 0.474
A3  2.000 1.224  1.633 3.000 0.201

$B2
     Diff    SE      t    df     p
A1 -1.000 1.224 -0.817 3.000 0.474
A2 -1.000 1.224 -0.817 3.000 0.474
A3  0.000 1.224  0.000 3.000 1.000
```

#### Effect Size for the Means

```r
standardizeMeansBy(FactorialSummary)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

$B1
       d d(unb)    SE     LL    UL
A1 0.817  0.594 0.616 -0.387 1.934
A2 2.450  1.782 0.955  0.325 4.532
A3 2.858  2.079 1.063  0.464 5.227

$B2
       d d(unb)    SE    LL    UL
A1 1.633  1.188 0.761 0.013 3.177
A2 1.633  1.188 0.761 0.013 3.177
A3 2.042  1.485 0.854 0.176 3.847
```

```r
standardizeMeansBy(FactorialSummary,conf.level=.99,mu=5)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

$B1
        d d(unb)    SE     LL    UL
A1 -1.225 -0.891 0.680 -3.011 0.547
A2  0.408  0.297 0.574 -0.968 1.734
A3  0.817  0.594 0.616 -0.732 2.320

$B2
        d d(unb)    SE     LL    UL
A1 -0.408 -0.297 0.574 -1.734 0.968
A2 -0.408 -0.297 0.574 -1.734 0.968
A3  0.000  0.000 0.559 -1.288 1.288
```

### Analyses of a Group Comparison

```r
CompSummaryB1 <- BetweenSummaryB1[c("A1","A2"),]
CompSummaryB2 <- BetweenSummaryB2[c("A1","A2"),]
CompSummary <- list("B1"=CompSummaryB1,"B2"=CompSummaryB2)
class(CompSummary) <- "bss"
CompSummary
```
```
$B1
   N M    SD
A1 4 2 2.449
A2 4 6 2.449

$B2
   N M    SD
A1 4 4 2.449
A2 4 4 2.449

attr(,"class")
[1] "bss"
```

#### Confidence Interval for a Mean Difference

```r
estimateDifferenceBy(CompSummary)
```
```
CONFIDENCE INTERVALS FOR THE COMPARISONS

$B1
            Diff    SE    df     LL    UL
Comparison 4.000 1.732 6.000 -0.237 8.237

$B2
            Diff    SE    df     LL    UL
Comparison 0.000 1.732 6.000 -4.237 4.237
```

```r
estimateDifferenceBy(CompSummary,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE COMPARISONS

$B1
            Diff    SE    df     LL     UL
Comparison 4.000 1.732 6.000 -2.420 10.420

$B2
            Diff    SE    df     LL    UL
Comparison 0.000 1.732 6.000 -6.420 6.420
```

#### Plot of the Confidence Interval for the Mean Difference

```r
plotDifferenceBy(CompSummary) # Includes FactorialBy-Figure5.jpeg and FactorialBy-Figure6.jpeg
```
<kbd><img src="FactorialBy-Figure5.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure6.jpeg"></kbd>
```r
plotDifferenceBy(CompSummary,conf.level=.99,rope=c(-2,2)) # Includes FactorialBy-Figure7.jpeg and FactorialBy-Figure8.jpeg
```
<kbd><img src="FactorialBy-Figure7.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure8.jpeg"></kbd>

#### Significance Test for the Mean Difference

```r
testDifferenceBy(CompSummary)
```
```
HYPOTHESIS TESTS FOR THE COMPARISONS

$B1
            Diff    SE     t    df     p
Comparison 4.000 1.732 2.310 6.000 0.060

$B2
            Diff    SE     t    df     p
Comparison 0.000 1.732 0.000 6.000 1.000
```

```r
testDifferenceBy(CompSummary,mu=-2)
```
```
HYPOTHESIS TESTS FOR THE COMPARISONS

$B1
            Diff    SE     t    df     p
Comparison 6.000 1.732 3.465 6.000 0.013

$B2
            Diff    SE     t    df     p
Comparison 2.000 1.732 1.155 6.000 0.292
```

#### Effect Size for the Mean Difference

```r
standardizeDifferenceBy(CompSummary)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS

$B1
             Est    SE     LL    UL
Comparison 1.633 0.943 -0.215 3.481

$B2
             Est    SE     LL    UL
Comparison 0.000 0.816 -1.600 1.600
```

```r
standardizeDifferenceBy(CompSummary,conf.level=.99,mu=-2)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS

$B1
             Est    SE     LL    UL
Comparison 1.633 0.943 -0.795 4.062

$B2
             Est    SE     LL    UL
Comparison 0.000 0.816 -2.103 2.103
```

### Analyses of a Factor Contrast

```r
A1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for a Contrast

```r
estimateContrastBy(FactorialSummary,contrast=A1vsOthers)
```
```
CONFIDENCE INTERVALS FOR THE CONTRASTS

$B1
           Est    SE    df    LL    UL
Contrast 4.500 1.500 6.000 0.830 8.170

$B2
           Est    SE    df     LL    UL
Contrast 0.500 1.500 6.000 -3.170 4.170
```

```r
estimateContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE CONTRASTS

$B1
           Est    SE    df     LL     UL
Contrast 4.500 1.500 6.000 -1.060 10.060

$B2
           Est    SE    df     LL    UL
Contrast 0.500 1.500 6.000 -5.060 6.060
```

#### Plots of Confidence Intervals for a Contrast

```r
plotContrastBy(FactorialSummary,contrast=A1vsOthers) # Includes FactorialBy-Figure9.jpeg and FactorialBy-Figure10.jpeg
```
<kbd><img src="FactorialBy-Figure9.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure10.jpeg"></kbd>
```r
plotContrastBy(FactorialSummary,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)) # Includes FactorialBy-Figure11.jpeg and FactorialBy-Figure12.jpeg
```
<kbd><img src="FactorialBy-Figure11.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure12.jpeg"></kbd>

#### Significance Test for a Contrast

```r
testContrastBy(FactorialSummary,contrast=A1vsOthers)
```
```
HYPOTHESIS TESTS FOR THE CONTRASTS

$B1
           Est    SE     t    df     p
Contrast 4.500 1.500 3.001 6.000 0.024

$B2
           Est    SE     t    df     p
Contrast 0.500 1.500 0.333 6.000 0.750
```

```r
testContrastBy(FactorialSummary,contrast=A1vsOthers,mu=4)
```
```
HYPOTHESIS TESTS FOR THE CONTRASTS

$B1
           Est    SE     t    df     p
Contrast 0.500 1.500 0.333 6.000 0.750

$B2
            Est    SE      t    df     p
Contrast -3.500 1.500 -2.334 6.000 0.058
```

#### Effect Size for a Contrast

```r
standardizeContrastBy(FactorialSummary,contrast=A1vsOthers)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS

$B1
           Est    SE    LL    UL
Contrast 1.837 0.829 0.212 3.463

$B2
           Est    SE     LL    UL
Contrast 0.204 0.709 -1.185 1.593
```

```r
standardizeContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS

$B1
           Est    SE     LL    UL
Contrast 1.837 0.829 -0.298 3.973

$B2
           Est    SE     LL    UL
Contrast 0.204 0.709 -1.621 2.030
```