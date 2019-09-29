# Estimation Approach to Statistical Inference (EASI)
## Single-Factor Between-Subjects Data Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Three Group Example Data

Group <- c(rep(1,3),rep(2,3),rep(3,3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))

BetweenData <- data.frame(Group,Outcome)
BetweenData

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome~Group)
estimateMeans(Outcome~Group,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(Outcome~Group)
plotMeans(Outcome~Group,conf.level=.99,mu=5)

#### Significance Tests for the Means

testMeans(Outcome~Group)
testMeans(Outcome~Group,mu=5)

#### Effect Size for the Means

standardizeMeans(Outcome~Group)
standardizeMeans(Outcome~Group,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

Comparison=factor(Group,c("Group1","Group2"))
estimateDifference(Outcome~Comparison)
estimateDifference(Outcome~Comparison,conf.level=.99)
Comparison=factor(Group,c("Group3","Group1"))
estimateDifference(Outcome~Comparison)

#### Plot of the Confidence Interval for the Mean Difference

Comparison=factor(Group,c("Group1","Group2"))
plotDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison,conf.level=.99)

#### Significance Test of the Mean Difference

testDifference(Outcome~Comparison)
testDifference(Outcome~Comparison,mu=2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome~Comparison)
standardizeDifference(Outcome~Comparison,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

G1 <- c(1,0,0)
estimateContrast(Outcome~Group,contrast=G1)
G2nG3 <- c(0,.5,.5)
estimateContrast(Outcome~Group,contrast=G2nG3)

#### Confidence Interval for a Contrast

G1vsOthers <- c(-1,.5,.5)
estimateContrast(Outcome~Group,contrast=G1vsOthers)
estimateContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

G1vsOthers <- c(-1,.5,.5)
plotContrast(Outcome~Group,contrast=G1vsOthers)
plotContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)

#### Significance Test for a Contrast

testContrast(Outcome~Group,contrast=G1vsOthers)
testContrast(Outcome~Group,contrast=G1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(Outcome~Group,contrast=G1vsOthers)
standardizeContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)
