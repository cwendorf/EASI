# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Set of Correlations Tutorial with Data

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Descriptive Statistics

describeMeans(Outcome1,Outcome2,Outcome3)
describeCorrelations(Outcome1,Outcome2,Outcome3)

### Analyses of a Correlation

#### Confidence Interval

estimateCorrelations(Outcome1,Outcome2)
plotCorrelations(Outcome1,Outcome2)

estimateCorrelations(Outcome1,Outcome2,conf.level=.99)
plotCorrelations(Outcome1,Outcome2,conf.level=.99,mu=0,rope=c(-.2,.2))

#### Significance Test

testCorrelations(Outcome1,Outcome2)

### Analyses of Several Correlations

#### Confidence Intervals

estimateCorrelations(Outcome1,Outcome2,Outcome3)
plotCorrelations(Outcome1,Outcome2,Outcome3)

estimateCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99)
plotCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=0,rope=c(-.2,.2))

#### Significance Tests

testCorrelations(Outcome1,Outcome2,Outcome3)
