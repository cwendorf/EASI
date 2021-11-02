# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Paired Samples Tutorial with Summary Statistics

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
PairedSummary <- rbind(Outcome1,Outcome2)
class(PairedSummary) <- "wss"

PairedCorr <- declareCorrelations("Outcome1","Outcome2")
PairedCorr["Outcome1","Outcome2"] <- .500
 
### Analyses of the Means

#### Confidence Intervals

estimateMeans(PairedSummary)
plotMeans(PairedSummary)

estimateMeans(PairedSummary,conf.level=.99)
plotMeans(PairedSummary,conf.level=.99,line=6,rope=c(4,8))

#### Significance Tests

testMeans(PairedSummary)
testMeans(PairedSummary,mu=6)

#### Standardized Effect Sizes

estimateStandardizedMeans(PairedSummary)
estimateStandardizedMeans(PairedSummary,mu=6,conf.level=.99)

### Analyses of the Comparison

#### Confidence Intervals

estimateMeanDifference(PairedSummary,PairedCorr)
plotMeanDifference(PairedSummary,PairedCorr)

estimateMeanDifference(PairedSummary,PairedCorr,conf.level=.99)
plotMeanDifference(PairedSummary,PairedCorr,conf.level=.99,line=0,rope=c(-2,2))

estimateMeanComparison(PairedSummary,PairedCorr)
plotMeanComparison(PairedSummary,PairedCorr)

estimateMeanComparison(PairedSummary,PairedCorr,conf.level=.99)
plotMeanComparison(PairedSummary,PairedCorr,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(PairedSummary,PairedCorr)
testMeanDifference(PairedSummary,PairedCorr,mu=-2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(PairedSummary,PairedCorr)
estimateStandardizedMeanDifference(PairedSummary,PairedCorr,conf.level=.99)
