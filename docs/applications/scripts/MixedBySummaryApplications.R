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

### Analyses of the Omnibus and Simple Effects

describeMeansOmnibusMultifactor(MixedSummary)
testMeansOmnibusMultifactor(MixedSummary)
estimateMeansOmnibusMultifactor(MixedSummary)

describeMeansOmnibusBy(MixedSummary)
testMeansOmnibusBy(MixedSummary)
estimateMeansOmnibusBy(MixedSummary)

### Analyses of the Means

plotMeansMultifactor(MixedSummary,MixedCorr)
plotMeansMultifactor(MixedSummary,conf.level=.99,col=c("black","gray60"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("black","gray60"))

estimateMeansBy(MixedSummary)
plotMeansBy(MixedSummary)
testMeansBy(MixedSummary)
estimateStandardizedMeansBy(MixedSummary)

### Analyses of a Comparison


estimateMeanDifferenceBy(CompSummary,MixedCorr)
testMeanDifferenceBy(CompSummary,MixedCorr)
plotMeanDifferenceBy(CompSummary,MixedCorr)
estimateStandardizedMeanDifferenceBy(CompSummary,MixedCorr)

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)
estimateMeanContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
testMeanContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
plotMeanContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
estimateStandardizedMeanContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
