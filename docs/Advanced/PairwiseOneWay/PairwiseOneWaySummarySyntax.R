# Estimation Approach to Statistical Inference
## Pairwise Comparisons - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary

### Analyses of Pairwise Comparisons

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(OneWaySummary)
estimatePairwise(OneWaySummary,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(OneWaySummary) # PairwiseOneWay-Figure1.jpeg
plotPairwise(OneWaySummary,mu=-2,conf.level=.99,rope=c(-4,0)) # PairwiseOneWay-Figure2.jpeg

#### Significance Tests of the Pairwise Comparisons

testPairwise(OneWaySummary)
testPairwise(OneWaySummary,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(OneWaySummary)
standardizePairwise(OneWaySummary,conf.level=.99)
