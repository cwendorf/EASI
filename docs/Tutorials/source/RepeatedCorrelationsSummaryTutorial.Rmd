# Estimation Approach to Statistical Inference

library(EASI)

## Repeated Measures (Within-Subjects) Correlations Tutorial with Summary Statistics

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

### Analyses of a Correlation

CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"
CompCorr <- RepeatedCorr[c("Outcome1","Outcome2"),c("Outcome1","Outcome2")]

#### Confidence Interval

estimateCorrelations(CompSummary,CompCorr)
plotCorrelations(CompSummary,CompCorr)

estimateCorrelations(CompSummary,CompCorr,conf.level=.99)
plotCorrelations(CompSummary,CompCorr,conf.level=.99)

#### Significance Test

testCorrelations(CompSummary,CompCorr)

### Analyses of Several Correlations

#### Confidence Intervals

estimateCorrelations(RepeatedSummary,RepeatedCorr)
plotCorrelations(RepeatedSummary,RepeatedCorr)

estimateCorrelations(RepeatedSummary,RepeatedCorr,conf.level=.99)
plotCorrelations(RepeatedSummary,RepeatedCorr,conf.level=.99)

#### Significance Tests

testCorrelations(RepeatedSummary,RepeatedCorr)
