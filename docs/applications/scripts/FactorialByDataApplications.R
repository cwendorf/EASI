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

### Analyses of the Means

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

### Analyses of the Omnibus Effect

describeMeansOmnibusBy(Outcome~FactorA,by=FactorB)
testMeansOmnibusBy(Outcome~FactorA,by=FactorB)
estimateMeansOmnibusBy(Outcome~FactorA,by=FactorB)

describeMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)
testMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)
estimateMeansOmnibusMultifactor(Outcome~FactorA,by=FactorB)
