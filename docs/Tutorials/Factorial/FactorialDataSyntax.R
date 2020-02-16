# Estimation Approach to Statistical Inference
## Factorial (Between-Subjects) Tutorial with Data

### Enter Data

FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

DataSubsetB1 <- subset(FactorialData,FactorB=="B1")
DataSubsetB2 <- subset(FactorialData,FactorB=="B2")

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

with(DataSubsetB1,estimateMeans(Outcome~FactorA))
with(DataSubsetB2,estimateMeans(Outcome~FactorA))
with(DataSubsetB1,estimateMeans(Outcome~FactorA,conf.level=.99))
with(DataSubsetB2,estimateMeans(Outcome~FactorA,conf.level=.99))

#### Plot of the Confidence Intervals for the Means

with(DataSubsetB1,plotMeans(Outcome~FactorA)) # Factorial-Figure1.jpeg
with(DataSubsetB2,plotMeans(Outcome~FactorA)) # Factorial-Figure2.jpeg
with(DataSubsetB1,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7))) # Factorial-Figure3.jpeg
with(DataSubsetB2,plotMeans(Outcome~FactorA,conf.level=.99,mu=5,rope=c(3,7))) # Factorial-Figure4.jpeg

#### Significance Tests for the Means

with(DataSubsetB1,testMeans(Outcome~FactorA))
with(DataSubsetB2,testMeans(Outcome~FactorA))
with(DataSubsetB1,testMeans(Outcome~FactorA,mu=5))
with(DataSubsetB2,testMeans(Outcome~FactorA,mu=5))

#### Effect Size for the Means

with(DataSubsetB1,standardizeMeans(Outcome~FactorA))
with(DataSubsetB2,standardizeMeans(Outcome~FactorA))
with(DataSubsetB1,standardizeMeans(Outcome~FactorA,mu=5,conf.level=.99))
with(DataSubsetB1,standardizeMeans(Outcome~FactorA,mu=5,conf.level=.99))

### Analyses of a Group Comparison

ComparisonB1 <- with(DataSubsetB1,factor(FactorA,c("A1","A2")))
ComparisonB2 <- with(DataSubsetB2,factor(FactorA,c("A1","A2")))

#### Confidence Interval for a Mean Difference

with(DataSubsetB1,estimateMeans(Outcome~ComparisonB1))
with(DataSubsetB2,estimateMeans(Outcome~ComparisonB2))
with(DataSubsetB1,estimateDifference(Outcome~ComparisonB1,conf.level=.99))
with(DataSubsetB2,estimateDifference(Outcome~ComparisonB2,conf.level=.99))

#### Plot of the Confidence Interval for the Mean Difference

with(DataSubsetB1,plotDifference(Outcome~ComparisonB1)) # Factorial-Figure5.jpeg
with(DataSubsetB2,plotDifference(Outcome~ComparisonB2)) # Factorial-Figure6.jpeg
with(DataSubsetB1,plotDifference(Outcome~ComparisonB1,conf.level=.99,rope=c(-2,2))) # Factorial-Figure7.jpeg
with(DataSubsetB2,plotDifference(Outcome~ComparisonB2,conf.level=.99,rope=c(-2,2))) # Factorial-Figure8.jpeg

#### Significance Test for the Mean Difference

with(DataSubsetB1,testDifference(Outcome~ComparisonB1))
with(DataSubsetB2,testDifference(Outcome~ComparisonB2))
with(DataSubsetB1,testDifference(Outcome~ComparisonB1,mu=-2))
with(DataSubsetB2,testDifference(Outcome~ComparisonB2,mu=-2))

#### Effect Size for the Mean Difference

with(DataSubsetB1,standardizeDifference(Outcome~ComparisonB1))
with(DataSubsetB2,standardizeDifference(Outcome~ComparisonB2))
with(DataSubsetB1,standardizeDifference(Outcome~ComparisonB1,conf.level=.99))
with(DataSubsetB2,standardizeDifference(Outcome~ComparisonB2,conf.level=.99))

### Analyses of a Group Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast

with(DataSubsetB1,estimateContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB2,estimateContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB1,estimateContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
with(DataSubsetB2,estimateContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))

#### Plots of Confidence Intervals for a Contrast

with(DataSubsetB1,plotContrast(Outcome~FactorA,contrast=A1vsOthers)) # Factorial-Figure9.jpeg
with(DataSubsetB2,plotContrast(Outcome~FactorA,contrast=A1vsOthers)) # Factorial-Figure10.jpeg
with(DataSubsetB1,plotContrast(Outcome~FactorA,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2))) # Factorial-Figure11.jpeg
with(DataSubsetB2,plotContrast(Outcome~FactorA,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2))) # Factorial-Figure12.jpeg

#### Significance Test for a Contrast

with(DataSubsetB1,testContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB2,testContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB1,testContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))
with(DataSubsetB2,testContrast(Outcome~FactorA,contrast=A1vsOthers,mu=4))

#### Effect Size for a Contrast

with(DataSubsetB1,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB2,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers))
with(DataSubsetB1,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
with(DataSubsetB2,standardizeContrast(Outcome~FactorA,contrast=A1vsOthers,conf.level=.99))
