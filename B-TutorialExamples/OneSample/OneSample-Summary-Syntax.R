# Estimation Approach to Statistical Inference (EASI)
## One Sample Example with Tutorial Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Outcome <- c(N=8,M=4.000,SD=3.117)
WithinSummary <- rbind(Outcome)
class(WithinSummary) <- "wss"
WithinSummary

### Analyses of the Group

#### Confidence Intervals for the Mean

estimateMeans(WithinSummary)
estimateMeans(WithinSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Mean

plotMeans(WithinSummary)
plotMeans(WithinSummary,conf.level=.99,mu=5)

#### Significance Tests for the Mean

testMeans(WithinSummary)
testMeans(WithinSummary,mu=5)

#### Effect Size for the Mean

standardizeMeans(WithinSummary)
standardizeMeans(WithinSummary,mu=5,conf.level=.99)
