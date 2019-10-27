# Estimation Approach to Statistical Inference (EASI)
## OneWay (Between-Subjects) Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
BetweenData <- data.frame(Factor,Outcome)
BetweenData

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(Outcome~Factor)
estimateMeans(Outcome~Factor,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(Outcome~Factor) # OneWay-Figure1.jpeg
plotMeans(Outcome~Factor,conf.level=.99,mu=5) # OneWay-Figure2.jpeg

#### Significance Tests for the Means

testMeans(Outcome~Factor)
testMeans(Outcome~Factor,mu=5)

#### Effect Size for the Means

standardizeMeans(Outcome~Factor)
standardizeMeans(Outcome~Factor,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

Comparison=factor(Factor,c("Level1","Level2"))

#### Confidence Interval for a Mean Difference

estimateDifference(Outcome~Comparison)
estimateDifference(Outcome~Comparison,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(Outcome~Comparison) # OneWay-Figure3.jpeg
plotDifference(Outcome~Comparison,conf.level=.99) # OneWay-Figure4.jpeg

#### Significance Test for the Mean Difference

testDifference(Outcome~Comparison)
testDifference(Outcome~Comparison,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(Outcome~Comparison)
standardizeDifference(Outcome~Comparison,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

L1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast

estimateContrast(Outcome~Factor,contrast=L1vsOthers)
estimateContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(Outcome~Factor,contrast=L1vsOthers) # OneWay-Figure5.jpeg
plotContrast(Outcome~Factor,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99) # OneWay-Figure6.jpeg

#### Significance Test for a Contrast

testContrast(Outcome~Factor,contrast=L1vsOthers)
testContrast(Outcome~Factor,contrast=L1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(Outcome~Factor,contrast=L1vsOthers)
standardizeContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)
