# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## FactorialBy - Factorial (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")
```

### Enter Data

```r
FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData
```
```
   FactorA FactorB Outcome
1       A1      B1       0
2       A1      B1       0
3       A1      B1       3
4       A1      B1       5
5       A2      B1       4
6       A2      B1       7
7       A2      B1       4
8       A2      B1       9
9       A3      B1       4
10      A3      B1       9
11      A3      B1       6
12      A3      B1       9
13      A1      B2       3
14      A1      B2       1
15      A1      B2       6
16      A1      B2       6
17      A2      B2       2
18      A2      B2       2
19      A2      B2       5
20      A2      B2       7
21      A3      B2       2
22      A3      B2       4
23      A3      B2       7
24      A3      B2       7
```

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

```r
estimateMeansBy(Outcome~FactorA,by=FactorB)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

$B1
   N M    SD    SE     LL     UL
A1 4 2 2.449 1.224 -1.897  5.897
A2 4 6 2.449 1.224  2.103  9.897
A3 4 7 2.449 1.224  3.103 10.897

$B2
   N M    SD    SE    LL    UL
A1 4 4 2.449 1.224 0.103 7.897
A2 4 4 2.449 1.224 0.103 7.897
A3 4 5 2.449 1.224 1.103 8.897
```

```r
estimateMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

$B1
   N M    SD    SE     LL     UL
A1 4 2 2.449 1.224 -5.152  9.152
A2 4 6 2.449 1.224 -1.152 13.152
A3 4 7 2.449 1.224 -0.152 14.152

$B2
   N M    SD    SE     LL     UL
A1 4 4 2.449 1.224 -3.152 11.152
A2 4 4 2.449 1.224 -3.152 11.152
A3 4 5 2.449 1.224 -2.152 12.152
```

#### Plot of the Confidence Intervals for the Means

```r
plotMeansBy(Outcome~FactorA,by=FactorB) # Includes FactorialBy-Figure1.jpeg and FactorialBy-Figure2.jpeg
```
<kbd><img src="FactorialBy-Figure1.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure2.jpeg"></kbd>
```r
plotMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5) # Includes FactorialBy-Figure3.jpeg and FactorialBy-Figure4.jpeg
```
<kbd><img src="FactorialBy-Figure3.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure4.jpeg"></kbd>

#### Significance Tests for the Means

```r
testMeansBy(Outcome~FactorA,by=FactorB)
```
```
HYPOTHESIS TESTS FOR THE MEANS

$B1
   Diff    SE     t df     p
A1    2 1.224 1.633  3 0.201
A2    6 1.224 4.900  3 0.016
A3    7 1.224 5.717  3 0.011

$B2
   Diff    SE     t df     p
A1    4 1.224 3.267  3 0.047
A2    4 1.224 3.267  3 0.047
A3    5 1.224 4.083  3 0.027
```

```r
testMeansBy(Outcome~FactorA,by=FactorB,mu=5)
```
```
HYPOTHESIS TESTS FOR THE MEANS

$B1
   Diff    SE      t df     p
A1   -3 1.224 -2.450  3 0.092
A2    1 1.224  0.817  3 0.474
A3    2 1.224  1.633  3 0.201

$B2
   Diff    SE      t df     p
A1   -1 1.224 -0.817  3 0.474
A2   -1 1.224 -0.817  3 0.474
A3    0 1.224  0.000  3 1.000
```

#### Effect Size for the Means

```r
standardizeMeansBy(Outcome~FactorA,by=FactorB)
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
standardizeMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5)
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

#### Confidence Interval for a Mean Difference

```r
Comparison=factor(FactorA,c("A1","A2"))
CompData=na.omit(data.frame(Outcome,Comparison,FactorB))
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB))
```
```
CONFIDENCE INTERVALS FOR THE COMPARISONS

$B1
           Diff    SE df     LL    UL
Comparison   -4 1.732  6 -8.237 0.237

$B2
           Diff    SE df     LL    UL
Comparison    0 1.732  6 -4.237 4.237
```

```r
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99))
```
```
CONFIDENCE INTERVALS FOR THE COMPARISONS

$B1
           Diff    SE df     LL   UL
Comparison   -4 1.732  6 -10.42 2.42

$B2
           Diff    SE df    LL   UL
Comparison    0 1.732  6 -6.42 6.42
```

#### Plot of the Confidence Interval for the Mean Difference

```r
with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB)) # Includes FactorialBy-Figure5.jpeg and FactorialBy-Figure6.jpeg
```
<kbd><img src="FactorialBy-Figure5.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure6.jpeg"></kbd>

```r
with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99)) # Includes FactorialBy-Figure7.jpeg and FactorialBy-Figure8.jpeg
```
<kbd><img src="FactorialBy-Figure7.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure8.jpeg"></kbd>

#### Significance Test for the Mean Difference

```r
with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB))
```
```
HYPOTHESIS TESTS FOR THE COMPARISONS

$B1
           Diff    SE     t df    p
Comparison   -4 1.732 -2.31  6 0.06

$B2
           Diff    SE t df p
Comparison    0 1.732 0  6 1
```

```r
with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB,mu=2))
```
```
HYPOTHESIS TESTS FOR THE COMPARISONS

$B1
           Diff    SE      t df     p
Comparison   -6 1.732 -3.465  6 0.013

$B2
           Diff    SE      t df     p
Comparison   -2 1.732 -1.155  6 0.292
```

#### Effect Size for the Mean Difference

```r
with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS

$B1
              Est    SE     LL    UL
Comparison -1.633 0.943 -3.481 0.215

$B2
           Est    SE   LL  UL
Comparison   0 0.816 -1.6 1.6
```

```r
with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99,mu=2))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS

$B1
              Est    SE     LL    UL
Comparison -1.633 0.943 -4.062 0.795

$B2
           Est    SE     LL    UL
Comparison   0 0.816 -2.103 2.103
```

### Analyses of a Factor Contrast

#### Confidence Interval for a Contrast

```r
A1vsOthers <- c(-1,.5,.5)
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
```
```
CONFIDENCE INTERVALS FOR THE CONTRASTS

$B1
         Est  SE df   LL   UL
Contrast 4.5 1.5  6 0.83 8.17

$B2
         Est  SE df    LL   UL
Contrast 0.5 1.5  6 -3.17 4.17
```

```r
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE CONTRASTS

$B1
         Est  SE df    LL    UL
Contrast 4.5 1.5  6 -1.06 10.06

$B2
         Est  SE df    LL   UL
Contrast 0.5 1.5  6 -5.06 6.06
```

#### Plots of Confidence Intervals for a Contrast

```r
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers) # Includes FactorialBy-Figure9.jpeg and FactorialBy-Figure10.jpeg
```
<kbd><img src="FactorialBy-Figure9.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure10.jpeg"></kbd>
```r
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99) # Includes FactorialBy-Figure11.jpeg and FactorialBy-Figure12.jpeg
```
<kbd><img src="FactorialBy-Figure11.jpeg"></kbd>
<kbd><img src="FactorialBy-Figure12.jpeg"></kbd>

#### Significance Test for a Contrast

```r
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
```
```
HYPOTHESIS TESTS FOR THE CONTRASTS

$B1
         Est  SE     t df     p
Contrast 4.5 1.5 3.001  6 0.024

$B2
         Est  SE     t df    p
Contrast 0.5 1.5 0.333  6 0.75
```

```r
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,mu=4)
```
```
HYPOTHESIS TESTS FOR THE CONTRASTS

$B1
         Est  SE     t df    p
Contrast 0.5 1.5 0.333  6 0.75

$B2
          Est  SE      t df     p
Contrast -3.5 1.5 -2.334  6 0.058
```

#### Effect Size for a Contrast

```r
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
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
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS

$B1
           Est    SE     LL    UL
Contrast 1.837 0.829 -0.298 3.973

$B2
           Est    SE     LL   UL
Contrast 0.204 0.709 -1.621 2.03
```