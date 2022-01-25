# Estimation Approach to Statistical Inference
## Factorial (Between-Subjects) Summary Statistics Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummaryB1 <- rbind(A1,A2,A3)

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
BetweenSummaryB2 <- rbind(A1,A2,A3)

FactorialSummary <- list("B1"=BetweenSummaryB1,"B2"=BetweenSummaryB2)
class(FactorialSummary) <- "bss"
FactorialSummary

### Analyses of the Omnibus and Simple Effects

describeMeansOmnibusMultifactor(FactorialSummary)
testMeansOmnibusMultifactor(FactorialSummary)
estimateMeansOmnibusMultifactor(FactorialSummary)

describeMeansOmnibusBy(FactorialSummary)
testMeansOmnibusBy(FactorialSummary)
estimateMeansOmnibusBy(FactorialSummary)

### Analyses of the Means

plotMeansMultifactor(FactorialSummary)
plotMeansMultifactor(FactorialSummary,conf.level=.99,col=c("black","gray60"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("black","gray60"))

estimateMeansBy(FactorialSummary)
plotMeansBy(FactorialSummary)
testMeansBy(FactorialSummary)
estimateStandardizedMeansBy(FactorialSummary)

### Analyses of a Comparison

CompSummaryB1 <- FactorialSummaryB1[c("A1","A2"),]
class(CompSummaryB1) <- "bss"
CompSummaryB2 <- FactorialSummaryB2[c("A1","A2"),]
class(CompSummaryB2) <- "bss"

CompSummary <- list("B1"=CompSummaryB1,"B2"=CompSummaryB2)
class(CompSummary) <- "bss"
CompSummary

estimateMeanDifferenceBy(CompSummary)
testMeanDifferenceBy(CompSummary)
plotMeanDifferenceBy(CompSummary)
estimateStandardizedMeanDifferenceBy(CompSummary)

### Analyses of a Contrast

L1vsOthers <- c(-1,.5,.5)
estimateMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
testMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
plotMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
estimateStandardizedMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
