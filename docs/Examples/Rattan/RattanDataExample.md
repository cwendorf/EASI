# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## OneWay (Between-Subjects) Example with Rattan Data

### Enter Data

```r
Feedback <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation <- c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback <- factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
RattanData <- data.frame(Feedback,Motivation)
RattanData
```
```
    Feedback Motivation
1    Comfort        5.5
2    Comfort        5.0
3    Comfort        5.5
4    Comfort        6.0
5    Comfort        1.0
6    Comfort        2.5
7    Comfort        4.5
8    Comfort        1.0
9    Comfort        3.5
10   Comfort        1.5
11   Comfort        5.5
12   Comfort        6.0
13   Comfort        1.5
14   Comfort        1.0
15   Comfort        3.5
16   Comfort        2.5
17   Comfort        3.0
18   Comfort        1.0
19 Challenge        2.0
20 Challenge        6.0
21 Challenge        4.5
22 Challenge        4.5
23 Challenge        6.0
24 Challenge        7.0
25 Challenge        3.0
26 Challenge        7.0
27 Challenge        3.5
28 Challenge        5.0
29 Challenge        4.5
30 Challenge        5.5
31 Challenge        6.5
32 Challenge        6.0
33 Challenge        6.0
34 Challenge        7.0
35 Challenge        5.5
36   Control        6.0
37   Control        2.5
38   Control        4.5
39   Control        3.5
40   Control        6.0
41   Control        5.0
42   Control        6.0
43   Control        3.5
44   Control        4.0
45   Control        3.0
46   Control        5.5
47   Control        3.0
48   Control        6.0
49   Control        3.0
50   Control        5.0
51   Control        6.0
52   Control        6.5
53   Control        3.5
54   Control        2.0
```

### Analyses of the Different Groups

```r
estimateMeans(Motivation~Feedback)
```
```
CONFIDENCE INTERVALS FOR THE MEANS

               N     M    SD    SE    LL    UL
Comfort   18.000 3.333 1.917 0.452 2.380 4.286
Challenge 17.000 5.265 1.448 0.351 4.521 6.009
Control   19.000 4.447 1.433 0.329 3.756 5.138
```
```r
plotMeans(Motivation~Feedback,ylab="Motivation")
```
<kbd><img src="RattanFigure1.jpeg"></kbd>

### Analysis of a Group Difference

```r
Comparison <- factor(Feedback,c("Comfort","Challenge"))
estimateDifference(Motivation~Comparison)
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

            Diff    SE     df    LL    UL
Comparison 1.932 0.572 31.521 0.766 3.098
```
```r
plotDifference(Motivation~Comparison,ylab="Motivation")
```
<kbd><img src="RattanFigure2.jpeg"></kbd>
```r
standardizeDifference(Motivation~Comparison)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

             Est    SE    LL    UL
Comparison 1.137 0.376 0.401 1.873
```

### Analysis of a Group Contrast

```r
ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE     df    LL    UL
Contrast 1.523 0.512 26.903 0.473 2.573
```
```r
plotContrast(Motivation~Feedback,contrast=ComfortvsOthers,labels=c("Comfort","Others"),ylab="Motivation")
```
<kbd><img src="RattanFigure3.jpeg"></kbd>
```r
testContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t     df     p
Contrast 1.523 0.512 2.975 26.903 0.006
```
```r
standardizeContrast(Motivation~Feedback,contrast=ComfortvsOthers)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 0.943 0.340 0.276 1.610
```