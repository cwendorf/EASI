# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Set of Correlations Data Tutorial

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Descriptive Statistics

describeMeans(RepeatedData)
describeCorrelations(RepeatedData)

### Analyses of a Correlation

ComparisonData <- cbind(Outcome1,Outcome2)

#### Confidence Interval

estimateCorrelations(ComparisonData)
plotCorrelations(ComparisonData)

estimateCorrelations(ComparisonData,conf.level=.99)
plotCorrelations(ComparisonData,conf.level=.99,line=0,rope=c(-.2,.2))

#### Significance Test

testCorrelations(ComparisonData)

### Analyses of Several Correlations

#### Confidence Intervals

estimateCorrelations(RepeatedData)
plotCorrelations(RepeatedData)

estimateCorrelations(RepeatedData,conf.level=.99)
plotCorrelations(RepeatedData,conf.level=.99,line=0,rope=c(-.2,.2))

#### Significance Tests

testCorrelations(RepeatedData)
