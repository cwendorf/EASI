# Estimation Approach to Statistical Inference
## Paired Samples Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
PairedSummary <- rbind(Outcome1,Outcome2)
class(PairedSummary) <- "wss"
PairedSummary

PairedCorr <- declareCorrMatrix("Outcome1","Outcome2")
PairedCorr["Outcome1","Outcome2"] <- .500
PairedCorr

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeans(PairedSummary)
estimateMeans(PairedSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(PairedSummary)
plotMeans(PairedSummary,conf.level=.99,mu=6,rope=c(4,8))

#### Significance Tests for the Means

testMeans(PairedSummary)
testMeans(PairedSummary,mu=6)

#### Effect Size for the Means

standardizeMeans(PairedSummary)
standardizeMeans(PairedSummary,mu=6,conf.level=.99)

### Analyses of a Variable Comparison

#### Confidence Interval for the Mean Difference

estimateDifference(PairedSummary,PairedCorr)
estimateDifference(PairedSummary,PairedCorr,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(PairedSummary,PairedCorr)
plotDifference(PairedSummary,PairedCorr,conf.level=.99,rope=c(-2,2))

#### Significance Test for the Mean Difference

testDifference(PairedSummary,PairedCorr)
testDifference(PairedSummary,PairedCorr,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(PairedSummary,PairedCorr)
standardizeDifference(PairedSummary,PairedCorr,conf.level=.99)
