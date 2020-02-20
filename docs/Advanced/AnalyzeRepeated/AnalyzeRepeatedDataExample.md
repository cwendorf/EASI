# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Analyze - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

```r
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData
```
```
  Outcome1 Outcome2 Outcome3
1        0        4        9
2        0        7        6
3        3        4        4
4        5        9        9
```

### Analyses of Multiple Variables

```r
analyzeMeans(Outcome1,Outcome2,Outcome3)
```
```
$title
[1] "ANALYSIS OF MEANS"

$estimateMeans
             N     M    SD    SE     LL     UL
Outcome1 4.000 2.000 2.449 1.224 -1.897  5.897
Outcome2 4.000 6.000 2.449 1.224  2.103  9.897
Outcome3 4.000 7.000 2.449 1.224  3.103 10.897

$testMeans
          Diff    SE     t    df     p
Outcome1 2.000 1.224 1.633 3.000 0.201
Outcome2 6.000 1.224 4.900 3.000 0.016
Outcome3 7.000 1.224 5.717 3.000 0.011

$standardizeMeans
             d d(unb)    SE     LL    UL
Outcome1 0.817  0.594 0.616 -0.387 1.934
Outcome2 2.450  1.782 0.955  0.325 4.532
Outcome3 2.858  2.079 1.063  0.464 5.227
```
<kbd><img src="AnalyzeRepeatedFigure1.jpeg"></kbd>

```r
analyzeMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99,rope=c(3,7))
```
```
$title
[1] "ANALYSIS OF MEANS"

$estimateMeans
             N     M    SD    SE     LL     UL
Outcome1 4.000 2.000 2.449 1.224 -5.152  9.152
Outcome2 4.000 6.000 2.449 1.224 -1.152 13.152
Outcome3 4.000 7.000 2.449 1.224 -0.152 14.152
mu       4.000 5.000 0.000 0.000  5.000  5.000

$testMeans
             Diff    SE      t    df     p
Outcome1   -3.000 1.224 -2.450 3.000 0.092
Outcome2    1.000 1.224  0.817 3.000 0.474
Outcome3    2.000 1.224  1.633 3.000 0.201
conf.level -4.010 0.000   -Inf 3.000 0.000

$standardizeMeans
              d d(unb)    SE     LL    UL
Outcome1 -1.225 -0.891 0.680 -3.011 0.547
Outcome2  0.408  0.297 0.574 -0.968 1.734
Outcome3  0.817  0.594 0.616 -0.732 2.320
```
<kbd><img src="AnalyzeRepeatedFigure2.jpeg"></kbd>

### Analyses of a Variable Comparison

```r
analyzeDifference(Outcome1,Outcome2)
```
```
$title
[1] "ANALYSIS OF A DIFFERENCE"

$estimateDifference
             Diff    SE    df     LL     UL
Comparison -4.000 1.224 3.000 -7.897 -0.103

$testDifference
             Diff    SE      t    df     p
Comparison -4.000 1.224 -3.267 3.000 0.047

$standardizeDifference
              Est    SE     LL     UL
Comparison -1.633 0.782 -3.166 -0.101
```
<kbd><img src="AnalyzeRepeatedFigure3.jpeg"></kbd>

```r
analyzeDifference(Outcome1,Outcome2,mu=-2,conf.level=.99,rope=c(-2,2))
```
```
$title
[1] "ANALYSIS OF A DIFFERENCE"

$estimateDifference
             Diff    SE    df      LL    UL
Comparison -4.000 1.224 3.000 -11.152 3.152

$testDifference
             Diff    SE      t    df     p
Comparison -2.000 1.224 -1.633 3.000 0.201

$standardizeDifference
              Est    SE     LL    UL
Comparison -1.633 0.782 -3.647 0.380
```
<kbd><img src="AnalyzeRepeatedFigure4.jpeg"></kbd>

### Analyses of a Variable Contrast

```r
O1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
```
```
$title
[1] "ANALYSIS OF A CONTRAST"

$estimateContrast
           Est    SE    df    LL    UL
Contrast 4.500 1.307 3.000 0.341 8.659

$testContrast
           Est    SE     t    df     p
Contrast 4.500 1.307 3.444 3.000 0.041

$standardizeContrast
           Est    SE    LL    UL
Contrast 1.837 0.741 0.386 3.289
```
<kbd><img src="AnalyzeRepeatedFigure5.jpeg"></kbd>

```r
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
```
```
$title
[1] "ANALYSIS OF A CONTRAST"

$estimateContrast
           Est    SE    df     LL     UL
Contrast 4.500 1.307 3.000 -3.133 12.133

$testContrast
           Est    SE     t    df     p
Contrast 0.500 1.307 0.383 3.000 0.727

$standardizeContrast
           Est    SE     LL    UL
Contrast 1.837 0.741 -0.071 3.746
```
<kbd><img src="AnalyzeRepeatedFigure6.jpeg"></kbd>