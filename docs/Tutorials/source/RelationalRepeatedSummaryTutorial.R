# Estimation Approach to Statistical Inference

library(EASI)

## Relational Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"

RepeatedCorr <- declareCorrelations("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrelations(RepeatedCorr)

### Analyses of the Omnibus Effect

#### Confidence Intervals

estimateMeans(RepeatedSummary)
plotMeans(RepeatedSummary)

#### Significance Test

describeMeansOmnibus(RepeatedSummary,RepeatedCorr)
testMeansOmnibus(RepeatedSummary,RepeatedCorr)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(RepeatedSummary,RepeatedCorr)
plotMeansPairwise(RepeatedSummary,RepeatedCorr,mu=0)

#### Significance Tests

testMeansPairwise(RepeatedSummary,RepeatedCorr)

### Analyses of the Pairwise Comparisons Using Relational Intervals

#### Confidence and Relational Intervals

estimateMeansRelational(RepeatedSummary,RepeatedCorr)
plotMeansRelational(RepeatedSummary,RepeatedCorr)

estimateMeansRelational(RepeatedSummary,RepeatedCorr,conf.level=.99)
plotMeansRelational(RepeatedSummary,RepeatedCorr,conf.level=.99)
