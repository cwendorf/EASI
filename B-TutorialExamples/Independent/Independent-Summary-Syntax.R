# Estimation Approach to Statistical Inference (EASI)
## Independent Groups Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
BetweenSummary <- rbind(Level1,Level2)
class(BetweenSummary) <- "bss"
BetweenSummary

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(BetweenSummary)
estimateMeans(BetweenSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(BetweenSummary)
plotMeans(BetweenSummary,conf.level=.99,mu=5)

#### Significance Tests for the Means

testMeans(BetweenSummary) # Independent-Figure1.jpeg
testMeans(BetweenSummary,mu=5) # Independent-Figure2.jpeg

#### Effect Size for the Means

standardizeMeans(BetweenSummary)
standardizeMeans(BetweenSummary,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

estimateDifference(BetweenSummary)
estimateDifference(BetweenSummary,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(BetweenSummary) # Independent-Figure3.jpeg
plotDifference(BetweenSummary,conf.level=.99) # Independent-Figure4.jpeg

#### Significance Test of the Mean Difference

testDifference(BetweenSummary)
testDifference(BetweenSummary,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(BetweenSummary)
standardizeDifference(BetweenSummary,conf.level=.99)
