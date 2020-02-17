# Estimation Approach to Statistical Inference

[**Functions**](../../functions) | 
[**Tutorials**](../../tutorials) | 
[**Examples**](../../examples) | 
[**Advanced**](../../advanced)

---

## Factorial (Between-Subjects) Tutorial with Data

### Enter Data

This code inputs the variable names and creates a viewable data frame.
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

This code subsets the data into two different data frames (for simple effects analysis).
```r
DataSubsetB1 <- subset(FactorialData,FactorB=="B1")
DataSubsetB2 <- subset(FactorialData,FactorB=="B2")
```

### Analyses of Multiple Groups

This section produces analyses that are equivalent to one-sample analyses separately for each level of a factor.

#### Confidence Intervals for the Means

This code will provide a table of descriptive statistics and confidence intervals for each level of the factor.
```r
with(DataSubsetB1,estimateMeans(Outcome~FactorA))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE     LL     UL
A1 4.000 2.000 2.449 1.224 -1.897  5.897
A2 4.000 6.000 2.449 1.224  2.103  9.897
A3 4.000 7.000 2.449 1.224  3.103 10.897
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateMeans(Outcome~FactorA))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE    LL    UL
A1 4.000 4.000 2.449 1.224 0.103 7.897
A2 4.000 4.000 2.449 1.224 0.103 7.897
A3 4.000 5.000 2.449 1.224 1.103 8.897
```

The code defaults to 95% confidence intervals. This can be changed if desired.
```r
with(DataSubsetB1,estimateMeans(Outcome~FactorA,conf.level=.99))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE     LL     UL
A1 4.000 2.000 2.449 1.224 -5.152  9.152
A2 4.000 6.000 2.449 1.224 -1.152 13.152
A3 4.000 7.000 2.449 1.224 -0.152 14.152
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateMeans(Outcome~FactorA,conf.level=.99))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE     LL     UL
A1 4.000 4.000 2.449 1.224 -3.152 11.152
A2 4.000 4.000 2.449 1.224 -3.152 11.152
A3 4.000 5.000 2.449 1.224 -2.152 12.152
```

#### Plot of the Confidence Intervals for the Means

This code will produce a graph of the confidence intervals for each level of the factor.
```r
with(DataSubsetB1,plotMeans(Outcome~FactorA))
```
<kbd><img src="FactorialFigure1.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotMeans(Outcome~FactorA))
```
<kbd><img src="FactorialFigure2.jpeg"></kbd>

Of course, it is possible to change from the default confidence level. Additionally, it is possible to add a comparison line to represent a population (or test) value and to add a region of practical equivalence.
```r
with(DataSubsetB1,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7)))
```
<kbd><img src="FactorialFigure3.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7)))
```
<kbd><img src="FactorialFigure4.jpeg"></kbd>


#### Significance Tests for the Means

This code will produce a table of NHST separately for each level of the factor. In this case, all the means are tested against a value of zero.
```r
with(DataSubsetB1,testMeans(Outcome~FactorA))
```
```
HYPOTHESIS TESTS FOR THE MEANS

    Diff    SE     t    df     p
A1 2.000 1.224 1.633 3.000 0.201
A2 6.000 1.224 4.900 3.000 0.016
A3 7.000 1.224 5.717 3.000 0.011
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testMeans(Outcome~FactorA))
```
```
HYPOTHESIS TESTS FOR THE MEANS

    Diff    SE     t    df     p
A1 4.000 1.224 3.267 3.000 0.047
A2 4.000 1.224 3.267 3.000 0.047
A3 5.000 1.224 4.083 3.000 0.027
```

Often, the default test value of zero is not meaningful or plausible. This too can be altered (often in conjunction with what is presented in the plot).
```r
with(DataSubsetB1,testMeans(Outcome~FactorA,mu=5))
```
```
HYPOTHESIS TESTS FOR THE MEANS

     Diff    SE      t    df     p
A1 -3.000 1.224 -2.450 3.000 0.092
A2  1.000 1.224  0.817 3.000 0.474
A3  2.000 1.224  1.633 3.000 0.201
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testMeans(Outcome~FactorA,mu=5))
```
```
HYPOTHESIS TESTS FOR THE MEANS

     Diff    SE      t    df     p
A1 -1.000 1.224 -0.817 3.000 0.474
A2 -1.000 1.224 -0.817 3.000 0.474
A3  0.000 1.224  0.000 3.000 1.000
```

#### Effect Size for the Means

This code will produce a table of standardized mean differences separately for each level of the factor. In this case, the mean is compared to zero to form the effect size.
```r
with(DataSubsetB1,standardizeMeans(Outcome~FactorA))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

       d d(unb)    SE     LL    UL
A1 0.817  0.594 0.616 -0.387 1.934
A2 2.450  1.782 0.955  0.325 4.532
A3 2.858  2.079 1.063  0.464 5.227
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,standardizeMeans(Outcome~FactorA))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

       d d(unb)    SE    LL    UL
A1 1.633  1.188 0.761 0.013 3.177
A2 1.633  1.188 0.761 0.013 3.177
A3 2.042  1.485 0.854 0.176 3.847
```

Here too it is possible to alter the width of the confidence intervals and to establish a more plausible comparison value for the effect size.
```r
with(DataSubsetB1,standardizeMeans(Outcome~FactorA,mu=5,conf.level=.99))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

        d d(unb)    SE     LL    UL
A1 -1.225 -0.891 0.680 -3.011 0.547
A2  0.408  0.297 0.574 -0.968 1.734
A3  0.817  0.594 0.616 -0.732 2.320
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB1,standardizeMeans(Outcome~FactorA,mu=5,conf.level=.99))
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS

        d d(unb)    SE     LL    UL
A1 -1.225 -0.891 0.680 -3.011 0.547
A2  0.408  0.297 0.574 -0.968 1.734
A3  0.817  0.594 0.616 -0.732 2.320
```

### Analyses of a Group Comparison

This section produces analyses that are equivalent to comparisons of two levels of a factor.

This code creates a new factor that identifies the two levels for comparison.
```r
ComparisonB1 <- with(DataSubsetB1,factor(FactorA,c("A1","A2")))
ComparisonB2 <- with(DataSubsetB2,factor(FactorA,c("A1","A2")))
```

#### Confidence Interval for a Mean Difference

This code estimates the confidence interval of the difference.
```r
with(DataSubsetB1,estimateMeans(Outcome~ComparisonB1))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE     LL    UL
A1 4.000 2.000 2.449 1.224 -1.897 5.897
A2 4.000 6.000 2.449 1.224  2.103 9.897
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateMeans(Outcome~ComparisonB2))
```
```
CONFIDENCE INTERVALS FOR THE MEANS

       N     M    SD    SE    LL    UL
A1 4.000 4.000 2.449 1.224 0.103 7.897
A2 4.000 4.000 2.449 1.224 0.103 7.897
```

Of course, you can change the confidence level from the default 95% if desired.
```r
with(DataSubsetB1,estimateDifference(Outcome~ComparisonB1,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

            Diff    SE    df     LL     UL
Comparison 4.000 1.732 6.000 -2.420 10.420
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateDifference(Outcome~ComparisonB2,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE COMPARISON

            Diff    SE    df     LL    UL
Comparison 0.000 1.732 6.000 -6.420 6.420
```

#### Plot of the Confidence Interval for the Mean Difference

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified comparison.
```r
with(DataSubsetB1,plotDifference(Outcome~ComparisonB1))
```
<kbd><img src="FactorialFigure5.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotDifference(Outcome~ComparisonB2))
```
<kbd><img src="FactorialFigure6.jpeg"></kbd>

Once again, the confidence levels can be changed away from the default and a region of practical equivalence can be added.
```r
with(DataSubsetB1,plotDifference(Outcome~ComparisonB1,conf.level=.99,rope=c(-2,2)))
```
<kbd><img src="FactorialFigure7.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotDifference(Outcome~ComparisonB2,conf.level=.99,rope=c(-2,2)))
```
<kbd><img src="FactorialFigure8.jpeg"></kbd>

#### Significance Test for the Mean Difference

This code produces NHST for the identified comparison (using a default test value of zero).
```r
with(DataSubsetB1,testDifference(Outcome~ComparisonB1))
```
```
HYPOTHESIS TEST FOR THE COMPARISON

            Diff    SE     t    df     p
Comparison 4.000 1.732 2.310 6.000 0.060
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testDifference(Outcome~ComparisonB2))
```
```
HYPOTHESIS TEST FOR THE COMPARISON

            Diff    SE     t    df     p
Comparison 0.000 1.732 0.000 6.000 1.000
```

If the default value of zero is not plausible, it too can be changed.
```r
with(DataSubsetB1,testDifference(Outcome~ComparisonB1,mu=-2))
```
```
HYPOTHESIS TEST FOR THE COMPARISON

            Diff    SE     t    df     p
Comparison 6.000 1.732 3.465 6.000 0.013
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testDifference(Outcome~ComparisonB2,mu=-2))
```
```
HYPOTHESIS TEST FOR THE COMPARISON

            Diff    SE     t    df     p
Comparison 2.000 1.732 1.155 6.000 0.292
```

#### Effect Size for the Mean Difference

This code calculates a standardized mean difference for the comparison and its confidence interval.
```r
with(DataSubsetB1,standardizeDifference(Outcome~ComparisonB1))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

             Est    SE     LL    UL
Comparison 1.633 0.943 -0.215 3.481
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,standardizeDifference(Outcome~ComparisonB2))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

             Est    SE     LL    UL
Comparison 0.000 0.816 -1.600 1.600
```

The width of the confidence interval for the effect size can be altered if desired.
```r
with(DataSubsetB1,standardizeDifference(Outcome~ComparisonB1,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

             Est    SE     LL    UL
Comparison 1.633 0.943 -0.795 4.062
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,standardizeDifference(Outcome~ComparisonB2,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

             Est    SE     LL    UL
Comparison 0.000 0.816 -2.103 2.103
```

### Analyses of a Group Contrast

This section produces analyses that are equivalent to analyses involving multiple levels of a factor.

This code identifies a contrast among the groups.
```r
A1vsOthers <- c(-1,.5,.5)
```

#### Confidence Interval for a Contrast

This code produces a confidence interval for that contrast.
```r
with(DataSubsetB1,estimateContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df    LL    UL
Contrast 4.500 1.500 6.000 0.830 8.170
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL    UL
Contrast 0.500 1.500 6.000 -3.170 4.170
```

As in all other cases, the default value of the confidence interval can be changed.
```r
with(DataSubsetB1,estimateContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL     UL
Contrast 4.500 1.500 6.000 -1.060 10.060
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,estimateContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE CONTRAST

           Est    SE    df     LL    UL
Contrast 0.500 1.500 6.000 -5.060 6.060
```

#### Plots of Confidence Intervals for a Contrast

This code obtains and plots the confidence intervals for the groups and the mean difference in the identified contrast.
```r
with(DataSubsetB1,plotContrast(Outcome~FactorA,contrast=A1vsOthers))
```
<kbd><img src="FactorialFigure9.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotContrast(Outcome~FactorA,contrast=A1vsOthers))
```
<kbd><img src="FactorialFigure10.jpeg"></kbd>

The width of the confidence interval for the contrast can be altered and a region of practical equivalence can be added.
```r
with(DataSubsetB1,plotContrast(Outcome~FactorA,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)))
```
<kbd><img src="FactorialFigure11.jpeg"></kbd>

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,plotContrast(Outcome~FactorA,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)))
```
<kbd><img src="FactorialFigure12.jpeg"></kbd>

#### Significance Test for a Contrast

This code produces a NHST for the identified contrast. It tests the contrast against a value of zero by default.
```r
with(DataSubsetB1,testContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 4.500 1.500 3.001 6.000 0.024
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 0.500 1.500 0.333 6.000 0.750
```

If desired, the contrast can be tested against other values.
```r
with(DataSubsetB1,testContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))
```
```
HYPOTHESIS TEST FOR THE CONTRAST

           Est    SE     t    df     p
Contrast 0.500 1.500 0.333 6.000 0.750
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,testContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))
```
```
HYPOTHESIS TEST FOR THE CONTRAST

            Est    SE      t    df     p
Contrast -3.500 1.500 -2.334 6.000 0.058
```

#### Effect Size for a Contrast

This code calculates a standardized contrast and its confidence interval.
```r
with(DataSubsetB1,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE    LL    UL
Contrast 1.837 0.829 0.212 3.463
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE     LL    UL
Contrast 0.204 0.709 -1.185 1.593
```

The width of the confidence interval for the effect size can be altered if desired.
```r
with(DataSubsetB1,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE     LL    UL
Contrast 1.837 0.829 -0.298 3.973
```

And repeat the analysis for the second subset.
```r
with(DataSubsetB2,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST

           Est    SE     LL    UL
Contrast 0.204 0.709 -1.621 2.030
```
