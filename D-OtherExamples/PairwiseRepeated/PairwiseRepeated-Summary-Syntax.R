# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Within-Subjects Summary Statistics Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/pairwiseExtension.R")

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(WithinSummary) <- "wss"
WithinSummary

WithinCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorr["Outcome1","Outcome2"] <- .500
WithinCorr["Outcome1","Outcome3"] <- .056
WithinCorr["Outcome2","Outcome3"] <- .389
WithinCorr <- fillCorrMatrix(WithinCorr)
WithinCorr

### Analyses of Pairwise Variable Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(WithinSummary,WithinCorr)
estimatePairwise(WithinSummary,WithinCorr,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(WithinSummary,WithinCorr)
plotPairwise(WithinSummary,WithinCorr,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(WithinSummary,WithinCorr)
testPairwise(WithinSummary,WithinCorr,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(WithinSummary,WithinCorr)
standardizePairwise(WithinSummary,WithinCorr,conf.level=.99)
