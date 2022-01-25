# Estimation Approach to Statistical Inference
## Factorial (Between-Subjects) Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Data Entry

FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

#### Descriptive Statistics

describeMeansBy(Outcome~FactorA,by=FactorB)

### Analyses of the Omnibus and Simple Effects

describeMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)
testMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)
estimateMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)

describeMeansOmnibusBy(Outcome~FactorA,by=FactorB)
testMeansOmnibusBy(Outcome~FactorA,by=FactorB)
estimateMeansOmnibusBy(Outcome~FactorA,by=FactorB)

### Analyses of the Means

plotMeansMultifactor(Outcome~FactorA,by=FactorB)
plotMeansMultifactor(Outcome~FactorA,by=FactorB,conf.level=.99,col=c("black","gray60"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("black","gray60"))

estimateMeansBy(Outcome~FactorA,by=FactorB)
plotMeansBy(Outcome~FactorA,by=FactorB)
testMeansBy(Outcome~FactorA,by=FactorB)
estimateStandardizedMeansBy(Outcome~FactorA,by=FactorB)

### Analyses of a Comparison

Comparison=factor(Factor,c("Level1","Level2"))
estimateMeanDifferenceBy(Outcome~FactorA,by=FactorB)
plotMeanDifferenceBy(Outcome~FactorA,by=FactorB)
testMeanDifferenceBy(Outcome~FactorA,by=FactorB)
estimateStandardizedMeanDifferenceBy(Outcome~FactorA,by=FactorB)

### Analyses of a Contrast

L1vsOthers <- c(-1,.5,.5)
estimateMeanContrastBy(Outcome~FactorA,by=FactorB,contrast=L1vsOthers)
plotMeanContrastBy(Outcome~FactorA,by=FactorB,contrast=L1vsOthers)
testMeanContrastBy(Outcome~FactorA,by=FactorB,contrast=L1vsOthers)
estimateStandardizedMeanContrastBy(Outcome~FactorA,by=FactorB,contrast=L1vsOthers)
