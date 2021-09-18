# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## One Sample Tutorial with Summary Statistics

### Data Management

Outcome <- c(N=8,M=4.000,SD=3.117)
OneSampleSummary <- rbind(Outcome)
class(OneSampleSummary) <- "wss"

### Analyses of the Mean

#### Confidence Interval

estimateMeans(OneSampleSummary)
plotMeans(OneSampleSummary)

estimateMeans(OneSampleSummary,conf.level=.99)
plotMeans(OneSampleSummary,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Test

testMeans(OneSampleSummary)
testMeans(OneSampleSummary,mu=5)

#### Standardized Effect Size

estimateStandardizedMeans(OneSampleSummary)
estimateStandardizedMeans(OneSampleSummary,mu=5,conf.level=.99)
