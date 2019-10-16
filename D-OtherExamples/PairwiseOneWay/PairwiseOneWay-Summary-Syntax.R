# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Between-Subjects Summary Statistics Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")

### Enter Summary Statistics

Group1 <- c(N=3,M=2.000,SD=2.449)
Group2 <- c(N=3,M=6.000,SD=2.449)
Group3 <- c(N=3,M=7.000,SD=2.449)
BetweenSummary <- rbind(Group1,Group2,Group3)
class(BetweenSummary) <- "bss"
BetweenSummary

### Analyses of Pairwise Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(BetweenSummary)
estimatePairwise(BetweenSummary,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(BetweenSummary)
plotPairwise(BetweenSummary,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(BetweenSummary)
testPairwise(BetweenSummary,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(BetweenSummary)
standardizePairwise(BetweenSummary,conf.level=.99)
