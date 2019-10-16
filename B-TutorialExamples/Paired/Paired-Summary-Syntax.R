# Estimation Approach to Statistical Inference (EASI)
## Paired Samples Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
WithinSummary <- rbind(Outcome1,Outcome2)
class(WithinSummary) <- "wss"
WithinSummary

WithinCorr <- declareCorrMatrix("Outcome1","Outcome2")
WithinCorr["Outcome1","Outcome2"] <- .500
WithinCorr

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(WithinSummary)
estimateMeans(WithinSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(WithinSummary) # Paired-Figure1.jpeg
plotMeans(WithinSummary,conf.level=.99,mu=6) # Paired-Figure2.jpeg

#### Significance Tests for the Means

testMeans(WithinSummary)
testMeans(WithinSummary,mu=6)

#### Effect Size for the Means

standardizeMeans(WithinSummary)
standardizeMeans(WithinSummary,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

estimateDifference(WithinSummary,WithinCorr)
estimateDifference(WithinSummary,WithinCorr,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifference(WithinSummary,WithinCorr) # Paired-Figure3.jpeg
plotDifference(WithinSummary,WithinCorr,conf.level=.99) # Paired-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(WithinSummary,WithinCorr)
testDifference(WithinSummary,WithinCorr,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(WithinSummary,WithinCorr)
standardizeDifference(WithinSummary,WithinCorr,conf.level=.99)
