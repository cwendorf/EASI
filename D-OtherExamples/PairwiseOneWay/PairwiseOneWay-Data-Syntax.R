# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Between-Subjects Example with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/pairwiseExtension.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))

BetweenData <- data.frame(Factor,Outcome)
BetweenData

### Analyses of Pairwise Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Outcome~Factor)
estimatePairwise(Outcome~Factor,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Outcome~Factor) # PairwiseOneWay-Figure1.jpeg
plotPairwise(Outcome~Factor,mu=-2,conf.level=.99) # PairwiseOneWay-Figure2.jpeg

#### Significance Tests of the Pairwise Comparisons

testPairwise(Outcome~Factor)
testPairwise(Outcome~Factor,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(Outcome~Factor)
standardizePairwise(Outcome~Factor,conf.level=.99)
