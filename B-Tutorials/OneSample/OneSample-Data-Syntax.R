# Estimation Approach to Statistical Inference
## One Sample Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)
OneSampleData

### Analyses of the Group

#### Confidence Intervals for the Mean

estimateMeans(Outcome)
estimateMeans(Outcome,conf.level=.99)

#### Plot of the Confidence Intervals for the Mean

plotMeans(Outcome) # OneSample-Figure1,jpeg
plotMeans(Outcome,conf.level=.99,mu=5) # OneSample-Figure2.jpeg

#### Significance Tests for the Mean

testMeans(Outcome)
testMeans(Outcome,mu=5)

#### Effect Size for the Mean

standardizeMeans(Outcome)
standardizeMeans(Outcome,mu=5,conf.level=.99)
