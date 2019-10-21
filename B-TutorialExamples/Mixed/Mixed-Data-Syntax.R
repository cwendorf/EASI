# Estimation Approach to Statistical Inference (EASI)
## Mixed Design Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,3,1,6,6)
Outcome2 <- c(4,7,4,9,2,2,5,7)
Outcome3 <- c(4,9,6,9,2,4,7,7)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
MixedData

DataSubsetL1 <- subset(MixedData,Factor=="Level1")
DataSubsetL2 <- subset(MixedData,Factor=="Level2")

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

with(DataSubsetL1,estimateMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL2,estimateMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL1,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
with(DataSubsetL2,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))

#### Confidence Intervals for the Means

with(DataSubsetL1,estimateMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL2,estimateMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL1,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))
with(DataSubsetL2,estimateMeans(Outcome1,Outcome2,Outcome3,conf.level=.99))

#### Plots of Confidence Intervals for the Means

with(DataSubsetL1,plotMeans(Outcome1,Outcome2,Outcome3)) # Mixed-Figure1.jpeg
with(DataSubsetL2,plotMeans(Outcome1,Outcome2,Outcome3)) # Mixed-Figure2.jpeg
with(DataSubsetL1,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=6)) # Mixed-Figure3.jpeg
with(DataSubsetL2,plotMeans(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=6)) # Mixed-Figure4.jpeg

#### Significance Tests for the Means

with(DataSubsetL1,testMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL2,testMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL1,testMeans(Outcome1,Outcome2,Outcome3,mu=6))
with(DataSubsetL2,testMeans(Outcome1,Outcome2,Outcome3,mu=6))

#### Effect Size for the Means

with(DataSubsetL1,standardizeMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL2,standardizeMeans(Outcome1,Outcome2,Outcome3))
with(DataSubsetL1,standardizeMeans(Outcome1,Outcome2,Outcome3,mu=6,conf.level=.99))
with(DataSubsetL2,standardizeMeans(Outcome1,Outcome2,Outcome3,mu=6,conf.level=.99))

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

with(DataSubsetL1,estimateDifference(Outcome1,Outcome2))
with(DataSubsetL2,estimateDifference(Outcome1,Outcome2))
with(DataSubsetL1,estimateDifference(Outcome1,Outcome2,conf.level=.99))
with(DataSubsetL2,estimateDifference(Outcome1,Outcome2,conf.level=.99))

#### Plots of Confidence Intervals for the Mean Difference

with(DataSubsetL1,plotDifference(Outcome1,Outcome2)) # Mixed-Figure5.jpeg
with(DataSubsetL2,plotDifference(Outcome1,Outcome2)) # Mixed-Figure6.jpeg
with(DataSubsetL1,plotDifference(Outcome1,Outcome2,conf.level=.99)) # Mixed-Figure7.jpeg
with(DataSubsetL2,plotDifference(Outcome1,Outcome2,conf.level=.99)) # Mixed-Figure8.jpeg

#### Significance Test for the Mean Difference

with(DataSubsetL1,testDifference(Outcome1,Outcome2))
with(DataSubsetL2,testDifference(Outcome1,Outcome2))
with(DataSubsetL1,testDifference(Outcome1,Outcome2,mu=-2))
with(DataSubsetL2,testDifference(Outcome1,Outcome2,mu=-2))

#### Effect Size for the Mean Difference

with(DataSubsetL1,standardizeDifference(Outcome1,Outcome2))
with(DataSubsetL2,standardizeDifference(Outcome1,Outcome2))
with(DataSubsetL1,standardizeDifference(Outcome1,Outcome2,conf.level=.99))
with(DataSubsetL2,standardizeDifference(Outcome1,Outcome2,conf.level=.99))

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

with(DataSubsetL1,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL2,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL1,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
with(DataSubsetL2,estimateContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))

#### Plots of Confidence Intervals for a Contrast

with(DataSubsetL1,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)) # Mixed-Figure9.jpeg
with(DataSubsetL2,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)) # Mixed-Figure10.jpeg
with(DataSubsetL1,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99)) # Mixed-Figure11.jpeg
with(DataSubsetL2,plotContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99)) # Mixed-Figure12.jpeg

#### Significance Test for the Contrast

with(DataSubsetL1,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL2,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL1,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=-1))
with(DataSubsetL2,testContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=-1))

#### Effect Size for the Contrast

with(DataSubsetL1,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL2,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers))
with(DataSubsetL1,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
with(DataSubsetL2,standardizeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,conf.level=.99))
