# Estimation Approach to Statistical Inference
## One Sample Tutorial with Data

### Enter Data

Outcome <- c(0,0,3,5,4,7,4,9)
OneSampleData <- data.frame(Outcome)
OneSampleData

### Analyses of the Group

#### Confidence Intervals for the Mean

estimateMeans(Outcome)
estimateMeans(Outcome,conf.level=.99)

#### Plot of the Confidence Intervals for the Mean

plotMeans(Outcome)
plotMeans(Outcome,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests for the Mean

testMeans(Outcome)
testMeans(Outcome,mu=5)

#### Effect Size for the Mean

standardizeMeans(Outcome)
standardizeMeans(Outcome,mu=5,conf.level=.99)
