# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Independent Groups Tutorial with Summary Statistics

### Data Management

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
IndependentSummary <- rbind(Level1,Level2)
class(IndependentSummary) <- "bss"
IndependentSummary

### Analyses of the Means

#### Confidence Intervals

estimateMeans(IndependentSummary)
plotMeans(IndependentSummary)

estimateMeans(IndependentSummary,conf.level=.99)
plotMeans(IndependentSummary,conf.level=.99,mu=5,rope=c(3,7))

#### Significance Tests

testMeans(IndependentSummary)
testMeans(IndependentSummary,mu=5)

#### Standardized Effect Sizes

estimateStandardizedMeans(IndependentSummary)
estimateStandardizedMeans(IndependentSummary,mu=5,conf.level=.99)
 
### Analyses of the Comparison

#### Confidence Intervals

estimateMeanDifference(IndependentSummary)
plotMeanDifference(IndependentSummary)

estimateMeanDifference(IndependentSummary,conf.level=.99)
plotMeanDifference(IndependentSummary,conf.level=.99,mu=0,rope=c(-2,2))

estimateMeanComparison(IndependentSummary)
plotMeanComparison(IndependentSummary)

estimateMeanComparison(IndependentSummary,conf.level=.99)
plotMeanComparison(IndependentSummary,conf.level=.99,rope=c(-2,2))

#### Significance Test

testMeanDifference(IndependentSummary)
testMeanDifference(IndependentSummary,mu=2)

#### Standardized Effect Size

estimateStandardizedMeanDifference(IndependentSummary)
estimateStandardizedMeanDifference(IndependentSummary,conf.level=.99)
