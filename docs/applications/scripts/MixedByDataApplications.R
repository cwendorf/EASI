# Estimation Approach to Statistical Inference
## Mixed Design (Between-Subjects and Within-Subjects) Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,1,3,6,6)
Outcome2 <- c(4,7,4,9,3,1,6,6)
Outcome3 <- c(4,9,6,9,3,3,6,8)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

#### Descriptive Statistics

describeMeansBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)

### Analyses of the Omnibus and Simple Effects

describeMeansOmnibusMultifactor(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
testMeansOmnibusMultifactor(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
estimateMeansOmnibusMultifactor(cbind(Outcome1,Outcome2,Outcome3),by=Factor)

describeMeansOmnibusBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
testMeansOmnibusBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
estimateMeansOmnibusBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)

### Analyses of the Means

plotMeansMultifactor(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
plotMeansMultifactor(cbind(Outcome1,Outcome2,Outcome3),by=Factor,conf.level=.99,col=c("black","gray60"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("black","gray60"))

estimateMeansBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
plotMeansBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
testMeansBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)
estimateStandardizedMeansBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor)

### Analyses of a Comparison

estimateMeanDifferenceBy(cbind(Outcome1,Outcome2),by=Factor)
testMeanDifferenceBy(cbind(Outcome1,Outcome2),by=Factor)
plotMeanDifferenceBy(cbind(Outcome1,Outcome2),by=Factor)
estimateStandardizedMeanDifferenceBy(cbind(Outcome1,Outcome2),by=Factor)

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)
estimateMeanContrastBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor,contrast=O1vsOthers)
testMeanContrastBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor,contrast=O1vsOthers)
plotMeanContrastBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor,contrast=O1vsOthers)
estimateStandardizedMeanContrastBy(cbind(Outcome1,Outcome2,Outcome3),by=Factor,contrast=O1vsOthers)
