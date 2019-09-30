# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Within-Subjects Summary Statistics Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")

### Three Time Period Example Summary Statistics

Time1 <- c(N=5,M=6.4,SD=1.14)
Time2 <- c(N=5,M=7.8,SD=.837)
Time3 <- c(N=5,M=8.6,SD=.548)
WithinSummary <- rbind(Time1,Time2,Time3)
class(WithinSummary) <- "wss"
WithinSummary

WithinCorr <- declareCorrMatrix("Time1","Time2","Time3")
WithinCorr["Time1","Time2"] <- .891
WithinCorr["Time1","Time3"] <- .721
WithinCorr["Time2","Time3"] <- .873
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
