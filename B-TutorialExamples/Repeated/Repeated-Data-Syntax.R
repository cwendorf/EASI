# Estimation Approach to Statistical Inference (EASI)
## Repeated Measures (Single-Factor Within-Subjects) Data Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Three Time Period Example Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)

WithinData <- data.frame(Outcome1,Outcome2,Outcome3)
WithinData

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome1,Outcome2,Outcome3)
estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(Outcome1,Outcome2,Outcome3)
plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=6)

#### Significance Tests for the Means

testMeans(Outcome1,Outcome2,Outcome3)
testMeans(Outcome1,Outcome2,Outcome3,mu=6)

#### Effect Size for the Means

standardizeMeans(Outcome1,Outcome2,Outcome3)
standardizeMeans(Outcome1,Outcome2,Outcome3,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

estimateDifference(Outcome1,Outcome2)
estimateDifference(Outcome1,Outcome2,conf.level=.99)
estimateDifference(Outcome3,Outcome1)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(Outcome1,Outcome2)
plotDifference(Outcome1,Outcome2,conf.level=.99)

#### Significance Test for the Mean Difference

testDifference(Outcome1,Outcome2)
testDifference(Outcome1,Outcome2,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome1,Outcome2)
standardizeDifference(Outcome1,Outcome2,conf.level=.99)

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

O1 <- c(1,0,0)
estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1)
O2nO3 <- c(0,.5,.5)
estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O2nO3)

#### Confidence Interval for the Contrast

O1vsOthers <- c(-1,.5,.5)
estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

O1vsOthers <- c(-1,.5,.5)
plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)

#### Significance Test for the Contrast

testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=-1)

#### Effect Size for the Contrast

standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)
