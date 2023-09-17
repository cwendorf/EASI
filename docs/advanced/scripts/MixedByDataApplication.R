# Estimation Approach to Statistical Inference
## MixedBy Data Application

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

cbind(Outcome1,Outcome2,Outcome3) |> describeMeansBy(by=Factor)

### Analyses of the Omnibus and Simple Effects

cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusMultifactor(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusMultifactor(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusMultifactor(by=Factor)

cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusBy(by=Factor)

### Analyses of the Means

cbind(Outcome1,Outcome2,Outcome3) |> plotMeansMultifactor(by=Factor,col=c("black","gray60"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("black","gray60"))

cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> plotMeansBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> testMeansBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeansBy(by=Factor)

### Analyses of a Comparison

cbind(Outcome1,Outcome2) |> estimateMeanDifferenceBy(by=Factor)
cbind(Outcome1,Outcome2) |> testMeanDifferenceBy(by=Factor)
cbind(Outcome1,Outcome2) |> plotMeanDifferenceBy(by=Factor)
cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifferenceBy(by=Factor)

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrastBy(by=Factor,contrast=O1vsOthers)
cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrastBy(by=Factor,contrast=O1vsOthers)
cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrastBy(by=Factor,contrast=O1vsOthers)
cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrastBy(by=Factor,contrast=O1vsOthers)
