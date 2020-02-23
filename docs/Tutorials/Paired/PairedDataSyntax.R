# Estimation Approach to Statistical Inference
## Paired Samples Tutorial with Data

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)
PairedData

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeans(Outcome1,Outcome2)
estimateMeans(Outcome1,Outcome2,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(Outcome1,Outcome2) # Paired-Figure1.jpeg
plotMeans(Outcome1,Outcome2,conf.level=.99,mu=6,rope=c(4,8)) # Paired-Figure2.jpeg

#### Significance Tests for the Means

testMeans(Outcome1,Outcome2)
testMeans(Outcome1,Outcome2,mu=6)

#### Effect Size for the Means

standardizeMeans(Outcome1,Outcome2)
standardizeMeans(Outcome1,Outcome2,mu=6,conf.level=.99)

### Analyses of a Variable Comparison

#### Confidence Interval for the Mean Difference

estimateDifference(Outcome1,Outcome2)
estimateDifference(Outcome1,Outcome2,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(Outcome1,Outcome2) # Paired-Figure3.jpeg
plotDifference(Outcome1,Outcome2,conf.level=.99,rope=c(-2,2)) # Paired-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(Outcome1,Outcome2) 
testDifference(Outcome1,Outcome2,mu=-2) 

#### Effect Size for the Mean Difference

standardizeDifference(Outcome1,Outcome2)
standardizeDifference(Outcome1,Outcome2,conf.level=.99)
