# Estimation Approach to Statistical Inference
## Pairwise Comparisons - Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr

### Analyses of Pairwise Variable Comparisons

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(RepeatedSummary,RepeatedCorr)
estimatePairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(RepeatedSummary,RepeatedCorr)
plotPairwise(RepeatedSummary,RepeatedCorr,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests of the Pairwise Comparisons

testPairwise(RepeatedSummary,RepeatedCorr)
testPairwise(RepeatedSummary,RepeatedCorr,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(RepeatedSummary,RepeatedCorr)
standardizePairwise(RepeatedSummary,RepeatedCorr,conf.level=.99)
