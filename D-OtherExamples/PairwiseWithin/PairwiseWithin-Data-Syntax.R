# Estimation Approach to Statistical Inference (EASI)
## Pairwise Comparisons Within-Subjects Data Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-EXTENSIONS.R")

### Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

WithinData <- data.frame(Time1,Time2,Time3)
WithinData

### Analyses of Pairwise Variable Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Time1,Time2,Time3)
estimatePairwise(Time1,Time2,Time3,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Time1,Time2,Time3)
plotPairwise(Time1,Time2,Time3,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(Time1,Time2,Time3)
testPairwise(Time1,Time2,Time3,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(Time1,Time2,Time3)
standardizePairwise(Time1,Time2,Time3,conf.level=.99)
