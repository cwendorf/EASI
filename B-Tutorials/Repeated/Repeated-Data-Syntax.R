# Estimation Approach to Statistical Inference
## Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome1,Outcome2,Outcome3)
estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(Outcome1,Outcome2,Outcome3) # Repeated-Figure1.jpeg
plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=5) # Repeated-Figure2.jpeg

#### Significance Tests for the Means

testMeans(Outcome1,Outcome2,Outcome3)
testMeans(Outcome1,Outcome2,Outcome3,mu=5)

#### Effect Size for the Means

standardizeMeans(Outcome1,Outcome2,Outcome3)
standardizeMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

estimateDifference(Outcome1,Outcome2)
estimateDifference(Outcome1,Outcome2,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(Outcome1,Outcome2) # Repeated-Figure3.jpeg
plotDifference(Outcome1,Outcome2,conf.level=.99) # Repeated-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(Outcome1,Outcome2)
testDifference(Outcome1,Outcome2,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome1,Outcome2)
standardizeDifference(Outcome1,Outcome2,conf.level=.99)

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers) # Repeated-Figure5.jpeg
plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99) # Repeated-Figure6.jpeg

#### Significance Test for the Contrast

testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4)

#### Effect Size for the Contrast

standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99)
