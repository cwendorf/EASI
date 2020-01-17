# Estimation Approach to Statistical Inference
## FactorialBy - Factorial (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/byExtension.R")

### Enter Data

FactorA <- c(1,1,1,1,2,2,2,2,3,3,3,3,1,1,1,1,2,2,2,2,3,3,3,3)
FactorB <- c(1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,3,1,6,6,2,2,5,7,2,4,7,7)
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeansBy(Outcome~FactorA,by=FactorB)
estimateMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeansBy(Outcome~FactorA,by=FactorB) # Includes FactorialBy-Figure1.jpeg and FactorialBy-Figure2.jpeg
plotMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5) # Includes FactorialBy-Figure3.jpeg and FactorialBy-Figure4.jpeg

#### Significance Tests for the Means

testMeansBy(Outcome~FactorA,by=FactorB)
testMeansBy(Outcome~FactorA,by=FactorB,mu=5)

#### Effect Size for the Means

standardizeMeansBy(Outcome~FactorA,by=FactorB)
standardizeMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99,mu=5)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

Comparison=factor(FactorA,c("A1","A2"))
CompData=na.omit(data.frame(Outcome,Comparison,FactorB))
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB))
with(CompData,estimateDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99))

#### Plot of the Confidence Interval for the Mean Difference

with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB)) # Includes FactorialBy-Figure5.jpeg and FactorialBy-Figure6.jpeg
with(CompData,plotDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99)) # Includes FactorialBy-Figure7.jpeg and FactorialBy-Figure8.jpeg

#### Significance Test for the Mean Difference

with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB))
with(CompData,testDifferenceBy(Outcome~Comparison,by=FactorB,mu=-2))

#### Effect Size for the Mean Difference

with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB))
with(CompData,standardizeDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99,mu=-2))

### Analyses of a Factor Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Interval for a Contrast

A1vsOthers <- c(-1,.5,.5)
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers) # Includes FactorialBy-Figure9.jpeg and FactorialBy-Figure10.jpeg
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99) # Includes FactorialBy-Figure11.jpeg and FactorialBy-Figure12.jpeg

#### Significance Test for a Contrast

testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers)
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsOthers,conf.level=.99)
