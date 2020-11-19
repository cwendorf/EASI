# Estimation Approach to Statistical Inference

library(EASI)

## Relational OneWay (Between-Subjects) Tutorial with Summary Statistics

### Data Management

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"

### Analyses of the Omnibus Effect

#### Confidence Intervals

estimateMeans(OneWaySummary)
plotMeans(OneWaySummary)

#### Significance Tests for the Omnibus Effect

describeMeansOmnibus(OneWaySummary)
testMeansOmnibus(OneWaySummary)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(OneWaySummary)
plotMeansPairwise(OneWaySummary,mu=0)

#### Significance Tests

testMeansPairwise(OneWaySummary)

### Analyses of the Pairwise Comparisons Using Relational Intervals

#### Confidence and Relational Intervals

estimateMeansRelational(OneWaySummary)
plotMeansRelational(OneWaySummary)

estimateMeansRelational(OneWaySummary,conf.level=.99)
plotMeansRelational(OneWaySummary,conf.level=.99)
