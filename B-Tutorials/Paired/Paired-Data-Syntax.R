# EASI: Estimation Approach to Statistical Inference
## Paired Samples Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)
PairedData

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome1,Outcome2)
estimateMeans(Outcome1,Outcome2,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(Outcome1,Outcome2) # Paired-Figure1.jpeg
plotMeans(Outcome1,Outcome2,conf.level=.99,mu=6) # Paired-Figure2.jpeg

#### Significance Tests for the Means

testMeans(Outcome1,Outcome2)
testMeans(Outcome1,Outcome2,mu=6)

#### Effect Size for the Means

standardizeMeans(Outcome1,Outcome2)
standardizeMeans(Outcome1,Outcome2,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

estimateDifference(Outcome1,Outcome2)
estimateDifference(Outcome1,Outcome2,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(Outcome1,Outcome2) # Paired-Figure3.jpeg
plotDifference(Outcome1,Outcome2,conf.level=.99) # Paired-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(Outcome1,Outcome2) 
testDifference(Outcome1,Outcome2,mu=-2) 

#### Effect Size for the Mean Difference

standardizeDifference(Outcome1,Outcome2)
standardizeDifference(Outcome1,Outcome2,conf.level=.99)
