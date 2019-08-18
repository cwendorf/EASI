# Estimation Approach to Statistical Inference (EASI)
## Extended Within-Subjects Summary Example

### Three Time Period Example Summary Statistics

Time1 <- c(N=5,M=6.4,SD=1.14)
Time2 <- c(N=5,M=7.8,SD=.837)
Time3 <- c(N=5,M=8.6,SD=.548)
sumstats <- rbind(Time1,Time2,Time3)
class(sumstats) <- "wss"
sumstats

corrstats <- declareCorrMatrix("Time1","Time2","Time3")
corrstats["Time1","Time2"] <- .891
corrstats["Time1","Time3"] <- .721
corrstats["Time2","Time3"] <- .873
corrstats <- fillCorrMatrix(corrstats)
corrstats

### Analyses of Pairwise Variable Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(sumstats,corrstats)
estimatePairwise(sumstats,corrstats,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(sumstats,corrstats)
plotPairwise(sumstats,corrstats,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(sumstats,corrstats)
testPairwise(sumstats,corrstats,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

effectPairwise(sumstats,corrstats)
effectPairwise(sumstats,corrstats,conf.level=.99)
