# Estimation Approach to Statistical Inference (EASI)
## Extended Within-Subjects Data Example

### Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata

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

effectPairwise(Time1,Time2,Time3)
effectPairwise(Time1,Time2,Time3,conf.level=.99)
