# Estimation Approach to Statistical Inference (EASI)
## Independent Groups Example with Tutorial Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Group <- c(rep(1,4),rep(2,4))
Outcome <- c(0,0,3,5,4,7,4,9)
Group <- factor(Group,levels=c(1,2),labels=c("Group1","Group2"))

BetweenData <- data.frame(Group,Outcome)
BetweenData

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome~Group)
estimateMeans(Outcome~Group,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(Outcome~Group)
plotMeans(Outcome~Group,conf.level=.99,mu=5)

#### Significance Tests for the Means

testMeans(Outcome~Group)
testMeans(Outcome~Group,mu=5)

#### Effect Size for the Means

standardizeMeans(Outcome~Group)
standardizeMeans(Outcome~Group,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

estimateDifference(Outcome~Group)
estimateDifference(Outcome~Group,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(Outcome~Group)
plotDifference(Outcome~Group,conf.level=.99)

#### Significance Test of the Mean Difference

testDifference(Outcome~Group)
testDifference(Outcome~Group,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome~Group)
standardizeDifference(Outcome~Group,conf.level=.99)
