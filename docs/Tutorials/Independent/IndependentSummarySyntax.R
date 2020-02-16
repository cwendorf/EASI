# Estimation Approach to Statistical Inference
## Independent Groups Tutorial with Summary Statistics

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
IndependentSummary <- rbind(Level1,Level2)
class(IndependentSummary) <- "bss"
IndependentSummary

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

estimateMeans(IndependentSummary)
estimateMeans(IndependentSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(IndependentSummary) # Independent-Figure1.jpeg
plotMeans(IndependentSummary,conf.level=.99,mu=5,rope=c(3,7)) # Independent-Figure2.jpeg

#### Significance Tests for the Means

testMeans(IndependentSummary) 
testMeans(IndependentSummary,mu=5) 

#### Effect Size for the Means

standardizeMeans(IndependentSummary)
standardizeMeans(IndependentSummary,mu=5,conf.level=.99)

### Analyses of a Group Comparison

#### Confidence Interval for a Mean Difference

estimateDifference(IndependentSummary)
estimateDifference(IndependentSummary,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(IndependentSummary) # Independent-Figure3.jpeg
plotDifference(IndependentSummary,conf.level=.99,rope=c(-2,2)) # Independent-Figure4.jpeg

#### Significance Test of the Mean Difference

testDifference(IndependentSummary)
testDifference(IndependentSummary,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(IndependentSummary)
standardizeDifference(IndependentSummary,conf.level=.99)
