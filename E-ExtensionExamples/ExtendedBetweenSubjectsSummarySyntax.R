# Estimation Approach to Statistical Inference (EASI)
## Extended Between-Subjects Summary Example

### Three Group Example Summary Statistics

Group1 <- c(N=3,M=4,SD=1)
Group2 <- c(N=3,M=8,SD=1)
Group3 <- c(N=3,M=9,SD=1)
sumstats <- rbind(Group1,Group2,Group3)
class(sumstats) <- "bss"
sumstats

### Analyses of Pairwise Group Comparisons
### (equivalent to unadjusted t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(sumstats)
estimatePairwise(sumstats,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(sumstats)
plotPairwise(sumstats,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(sumstats)
testPairwise(sumstats,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

effectPairwise(sumstats)
effectPairwise(sumstats,conf.level=.99)
