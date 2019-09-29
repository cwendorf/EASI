# Estimation Approach to Statistical Inference (EASI)
## Extended Between-Subjects Data Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")

### Three Group Example Data

Group <- c(rep("Group1",3),rep("Group2",3),rep("Group3",3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group)

BetweenData <- data.frame(Group,Outcome)
BetweenData

### Analyses of Pairwise Group Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Outcome~Group)
estimatePairwise(Outcome~Group,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Outcome~Group)
plotPairwise(Outcome~Group,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(Outcome~Group)
testPairwise(Outcome~Group,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(Outcome~Group)
standardizePairwise(Outcome~Group,conf.level=.99)
