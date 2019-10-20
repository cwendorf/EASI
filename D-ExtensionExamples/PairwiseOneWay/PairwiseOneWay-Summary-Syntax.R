# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Between-Subjects Example with Summary Statistics

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/pairwiseExtension.R")

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummary <- rbind(Level1,Level2,Level3)
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
