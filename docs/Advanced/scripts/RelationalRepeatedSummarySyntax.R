# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr

### Relational Intervals

estimateRelational(RepeatedSummary,RepeatedCorr)

plotMeans(RepeatedSummary)
addRelational(RepeatedSummary,RepeatedCorr)

plotRelational(RepeatedSummary,RepeatedCorr)
plotRelational(RepeatedSummary,RepeatedCorr,conf.level=.99,mu=70)
