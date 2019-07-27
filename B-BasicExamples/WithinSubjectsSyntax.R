# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC WITHIN-SUBJECTS EXAMPLES

#### Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateLevels(Time1,Time2,Time3)
estimateLevels(Time1,Time2,Time3,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotLevels(Time1,Time2,Time3)
plotLevels(Time1,Time2,Time3,conf.level=.99,mu=6)

#### Significance Tests for the Means

testLevels(Time1,Time2,Time3)
testLevels(Time1,Time2,Time3,mu=6)

#### Effect Sizes for the Means

effectLevels(Time1,Time2,Time3)
effectLevels(Time1,Time2,Time3,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

estimateDifference(Time1,Time2)
estimateDifference(Time1,Time2,conf.level=.99)
estimateDifference(Time3,Time1)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(Time1,Time2)
plotDifference(Time1,Time2,conf.level=.99)

#### Significance Test for the Mean Difference

testDifference(Time1,Time2)
testDifference(Time1,Time2,mu=-2)

#### Effect Size for the Mean Difference

effectDifference(Time1,Time2)
effectDifference(Time1,Time2,conf.level=.99)

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Interval for the Contrast

T1vsT2 <- c(1,-1,0)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2,conf.level=.99)

#### Significance Test for the Contrast

testContrast(Time1,Time2,Time3,contrast=T1vsT2)
testContrast(Time1,Time2,Time3,contrast=T1vsT2,mu=-1)
