# Estimation Approach to Statistical Inference
## Independent Groups Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4))
Outcome <- c(0,0,3,5,4,7,4,9)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
BetweenData <- data.frame(Factor,Outcome)
BetweenData

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome~Factor)
estimateMeans(Outcome~Factor,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(Outcome~Factor) # Independent-Figure1.jpeg
plotMeans(Outcome~Factor,conf.level=.99,mu=5)# Independent-Figure2.jpeg

#### Significance Tests for the Means

testMeans(Outcome~Factor)
testMeans(Outcome~Factor,mu=5)

#### Effect Size for the Means

standardizeMeans(Outcome~Factor)
standardizeMeans(Outcome~Factor,mu=5,conf.level=.99)

### Analyses of a Factor Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

estimateDifference(Outcome~Factor)
estimateDifference(Outcome~Factor,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(Outcome~Factor) # Independent-Figure3.jpeg
plotDifference(Outcome~Factor,conf.level=.99) # Independent-Figure4.jpeg

#### Significance Test of the Mean Difference

testDifference(Outcome~Factor)
testDifference(Outcome~Factor,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome~Factor)
standardizeDifference(Outcome~Factor,conf.level=.99)
