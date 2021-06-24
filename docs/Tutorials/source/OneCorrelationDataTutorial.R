# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## One Correlation Tutorial with Data

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
PairedData <- data.frame(Outcome1,Outcome2)

#### Plot of the Data

plotScatter(Outcome1,Outcome2)
plotScatter(Outcome1,Outcome2,interval=TRUE)
plotScatter(Outcome1,Outcome2,interval=TRUE,conf.level=.99)

#### Descriptive Statistics

describeMeans(Outcome1,Outcome2)
describeCorrelations(Outcome1,Outcome2)

### Analyses of a Correlation

#### Confidence Interval

estimateCorrelations(Outcome1,Outcome2)
plotCorrelations(Outcome1,Outcome2)

estimateCorrelations(Outcome1,Outcome2,conf.level=.99)
plotCorrelations(Outcome1,Outcome2,conf.level=.99,mu=0,rope=c(-.2,.2))

#### Significance Test

testCorrelations(Outcome1,Outcome2)
