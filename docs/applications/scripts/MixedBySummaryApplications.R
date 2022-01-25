# Estimation Approach to Statistical Inference
## Mixed Design (Between-Subjects and Within-Subjects) Summary Statistics Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
MixedSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL1) <- "wss"

Outcome1 <- c(N=4,M=4.000,SD=2.449)
Outcome2 <- c(N=4,M=4.000,SD=2.449)
Outcome3 <- c(N=4,M=5.000,SD=2.449)
MixedSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL2) <- "wss"

MixedSummary <- list("Level1"=MixedSummaryL1,"Level2"=MixedSummaryL2)
class(MixedSummary) <- "wss"
MixedSummary

MixedCorrL1 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL1["Outcome1",] <- c(1.000,.500,.389)
MixedCorrL1["Outcome2",] <- c(.500,1.000,.889)
MixedCorrL1["Outcome3",] <- c(.389,.889,1.000)

MixedCorrL2 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL2["Outcome1",] <- c(1.000,.889,.778)
MixedCorrL2["Outcome2",] <- c(.889,1.000,.889)
MixedCorrL2["Outcome3",] <- c(.778,.889,1.000)

MixedCorr <- list("Level1"=MixedCorrL1,"Level2"=MixedCorrL2)
MixedCorr

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



plotMeansMultifactor(MixedSummary,MixedCorr)

plotMeansMultifactor(MixedSummary,conf.level=.99,col=c("darkblue","darkred"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("darkblue","darkred"))

