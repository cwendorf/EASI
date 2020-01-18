# Estimation Approach to Statistical Inference
## One Sample Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")

### Enter Summary Statistics

Outcome <- c(N=8,M=4.000,SD=3.117)
OneSampleSummary <- rbind(Outcome)
class(OneSampleSummary) <- "wss"
OneSampleSummary

### Analyses of the Group

#### Confidence Intervals for the Mean

estimateMeans(OneSampleSummary)
estimateMeans(OneSampleSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Mean

plotMeans(OneSampleSummary) # OneSample-Figure1.jpeg
plotMeans(OneSampleSummary,conf.level=.99,mu=5) # OneSample-Figure2.jpeg

#### Significance Tests for the Mean

testMeans(OneSampleSummary)
testMeans(OneSampleSummary,mu=5)

#### Effect Size for the Mean

standardizeMeans(OneSampleSummary)
standardizeMeans(OneSampleSummary,mu=5,conf.level=.99)
