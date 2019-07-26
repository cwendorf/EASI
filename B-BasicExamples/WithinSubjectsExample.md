# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC WITHIN-SUBJECTS EXAMPLES

#### Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata

  Time1 Time2 Time3
1     5     7     8
2     6     7     8
3     6     8     9
4     7     8     9
5     8     9     9

### Analyses of Multiple Variables
# (equivalent to one-sample analyses for each level of a factor)

estimateLevels(Time1,Time2,Time3)

CONFIDENCE INTERVALS FOR THE LEVELS

      N   M    SD    SE    LL    UL
Time1 5 6.4 1.140 0.510 4.984 7.816
Time2 5 7.8 0.837 0.374 6.761 8.839
Time3 5 8.6 0.548 0.245 7.920 9.280

plotLevels(Time1,Time2,Time3)

[See WithinSubjectsGraph1.jpeg]

testLevels(Time1,Time2,Time3)

HYPOTHESIS TESTS FOR THE LEVELS

      Diff    SE      t df p
Time1  6.4 0.510 12.551  4 0
Time2  7.8 0.374 20.846  4 0
Time3  8.6 0.245 35.109  4 0

effectLevels(Time1,Time2,Time3)

STANDARDIZED MEAN DIFFERENCES FOR THE LEVELS

       d      g    LL     UL
1  5.614  4.479 2.574 13.031
2  9.319  7.435 4.389 21.463
3 15.693 12.522 7.463 36.039

estimateLevels(Time1,Time2,Time3,conf.level=.99)

CONFIDENCE INTERVALS FOR THE LEVELS

      N   M    SD    SE    LL    UL
Time1 5 6.4 1.140 0.510 4.052 8.748
Time2 5 7.8 0.837 0.374 6.077 9.523
Time3 5 8.6 0.548 0.245 7.472 9.728

plotLevels(Time1,Time2,Time3,conf.level=.99,mu=6)

[See WithinSubjectsGraph2.jpeg]

testLevels(Time1,Time2,Time3,mu=6)

HYPOTHESIS TESTS FOR THE LEVELS

      Diff    SE      t df     p
Time1  0.4 0.510  0.784  4 0.477
Time2  1.8 0.374  4.811  4 0.009
Time3  2.6 0.245 10.614  4 0.000

effectLevels(Time1,Time2,Time3,mu=6,conf.level=.99)

STANDARDIZED MEAN DIFFERENCES FOR THE LEVELS

      d     g     LL     UL
1 0.351 0.280 -1.374  2.865
2 2.151 1.716  0.504  8.191
3 4.745 3.786  1.798 16.958

### Analyses of a Variable Comparison
# (equivalent to analyses for two levels of a factor)

estimateLevels(Time1,Time2)

CONFIDENCE INTERVALS FOR THE LEVELS

      N   M    SD    SE    LL    UL
Time1 5 6.4 1.140 0.510 4.984 7.816
Time2 5 7.8 0.837 0.374 6.761 8.839

estimateDifference(Time1,Time2)

CONFIDENCE INTERVAL FOR THE COMPARISON

  Diff     SE     df     LL     UL 
-1.400  0.245  4.000 -2.080 -0.720 

plotDifference(Time1,Time2)

[See WithinSubjectsGraph3.jpeg]

testDifference(Time1,Time2)

HYPOTHESIS TEST FOR THE COMPARISON

  Diff     SE      t     df      p 
-1.400  0.245 -5.715  4.000  0.005 

effectDifference(Time1,Time2)

STANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON

     d      g     LL     UL 
-1.400 -1.264 -2.566 -0.735 

estimateDifference(Time1,Time2,conf.level=.99)

CONFIDENCE INTERVAL FOR THE COMPARISON

  Diff     SE     df     LL     UL 
-1.400  0.245  4.000 -2.528 -0.272 

plotDifference(Time1,Time2,conf.level=.99)

[See WithinSubjectsGraph4.jpeg]

testDifference(Time1,Time2,mu=-2)

HYPOTHESIS TEST FOR THE COMPARISON

  Diff     SE      t     df      p 
-1.400  0.245  2.449  4.000  0.070 

effectDifference(Time1,Time2,conf.level=.99)

STANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON

     d      g     LL     UL 
-1.400 -1.264 -3.298 -0.608 

estimateLevels(Time3,Time1)

CONFIDENCE INTERVALS FOR THE LEVELS

      N   M    SD    SE    LL    UL
Time3 5 8.6 0.548 0.245 7.920 9.280
Time1 5 6.4 1.140 0.510 4.984 7.816

estimateDifference(Time3,Time1)

CONFIDENCE INTERVAL FOR THE COMPARISON

 Diff    SE    df    LL    UL 
2.200 0.374 4.000 1.161 3.239 

plotDifference(Time3,Time1)

[See WithinSubjectsGraph5.jpeg]

testDifference(Time3,Time1)

HYPOTHESIS TEST FOR THE COMPARISON

 Diff    SE     t    df     p 
2.200 0.374 5.880 4.000 0.004 

effectDifference(Time3,Time1)

STANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON

    d     g    LL    UL 
2.460 2.220 1.326 4.468 

### Analyses of a Variable Contrast
# (equivalent to analyses for multiple levels of a factor)

T1vsT2 <- c(1,-1,0)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2)

CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE df    LL    UL
Contrast -1.4 0.245  4 -2.08 -0.72

testContrast(Time1,Time2,Time3,contrast=T1vsT2)

HYPOTHESIS TEST FOR THE CONTRAST

          Est    SE      t df     p
Contrast -1.4 0.245 -5.715  4 0.005

T1vsT2 <- c(1,-1,0)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2,conf.level=.99)

CONFIDENCE INTERVAL FOR THE CONTRAST

          Est    SE df     LL     UL
Contrast -1.4 0.245  4 -2.528 -0.272

testContrast(Time1,Time2,Time3,contrast=T1vsT2,mu=-1)

HYPOTHESIS TEST FOR THE CONTRAST

          Est    SE      t df     p
Contrast -0.4 0.245 -1.633  4 0.178
