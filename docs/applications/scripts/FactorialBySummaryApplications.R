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

### Analyses of the Means

#### Confidence Intervals

estimateMeansBy(FactorialSummary)
plotMeansBy(FactorialSummary)

estimateMeansBy(FactorialSummary,conf.level=.99)
plotMeansBy(FactorialSummary,conf.level=.99)

#### Significance Tests

testMeansBy(FactorialSummary)
testMeansBy(FactorialSummary,mu=7)

#### Standardized Effect Sizes

estimateStandardizedMeansBy(FactorialSummary)
estimateStandardizedMeansBy(FactorialSummary,conf.level=.99,mu=7)

### Analyses of a Comparison


CompSummaryB1 <- FactorialSummaryB1[c("A1","A2"),]
class(CompSummaryB1) <- "bss"
CompSummaryB2 <- FactorialSummaryB2[c("A1","A2"),]
class(CompSummaryB2) <- "bss"

Comparison=factor(Factor,c("Level1","Level2"))

estimateMeanDifferenceBy(FactorialSummary)
testMeanDifferenceBy(FactorialSummary)
plotMeanDifferenceBy(FactorialSummary)

estimateStandardizedMeanDifferenceBy(FactorialSummary)

### Analyses of a Contrast

L1vsOthers <- c(-1,.5,.5)

estimateMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
testMeanContrastBy(FactorialSummary,contrast=L1vsOthers)
plotMeanContrastBy(FactorialSummary,contrast=L1vsOthers)

estimateStandardizedMeanContrastBy(FactorialSummary,contrast=L1vsOthers)

### Analyses of the Omnibus Effect

describeMeansOmnibusBy(FactorialSummary)
testMeansOmnibusBy(FactorialSummary)
estimateMeansEffectBy(FactorialSummary)

describeMeansOmnibusMultifactor(FactorialSummary)
testMeansOmnibusMultifactor(FactorialSummary)
estimateMeansEffectMultifactor(FactorialSummary)



plotMeansMultifactor(FactorialSummary)

plotMeansMultifactor(FactorialSummary,conf.level=.99,col=c("darkblue","darkred"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkblue","darkred"))

