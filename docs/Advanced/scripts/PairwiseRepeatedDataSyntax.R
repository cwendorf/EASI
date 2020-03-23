# Estimation Approach to Statistical Inference
## Pairwise Comparisons - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)

RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Outcome1,Outcome2,Outcome3)
estimatePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Outcome1,Outcome2,Outcome3)
plotPairwise(Outcome1,Outcome2,Outcome3,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests of the Pairwise Comparisons

testPairwise(Outcome1,Outcome2,Outcome3)
testPairwise(Outcome1,Outcome2,Outcome3,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(Outcome1,Outcome2,Outcome3)
standardizePairwise(Outcome1,Outcome2,Outcome3,conf.level=.99)
