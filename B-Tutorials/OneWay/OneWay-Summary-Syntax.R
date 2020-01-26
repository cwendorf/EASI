# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

estimateMeans(OneWaySummary)
estimateMeans(OneWaySummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(OneWaySummary) # OneWay-Figure1.jpeg
plotMeans(OneWaySummary,conf.level=.99,mu=5,rope=c(3,7)) # OneWay-Figure2.jpeg

#### Significance Tests for the Means

testMeans(OneWaySummary)
testMeans(OneWaySummary,mu=5)

#### Effect Size for the Means

standardizeMeans(OneWaySummary)
standardizeMeans(OneWaySummary,mu=5,conf.level=.99)

### Analyses of a Group Comparison

CompSummary <- OneWaySummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"

#### Confidence Interval for a Mean Difference

estimateDifference(CompSummary)
estimateDifference(CompSummary,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(CompSummary) # OneWay-Figure3.jpeg
plotDifference(CompSummary,conf.level=.99,rope=c(-2,2)) # OneWay-Figure4.jpeg

#### Significance Test of the Mean Difference

testDifference(CompSummary)
testDifference(CompSummary,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummary)
standardizeDifference(CompSummary,conf.level=.99)

### Analyses of a Group Contrast

L1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast

estimateContrast(OneWaySummary,contrast=L1vsOthers)
estimateContrast(OneWaySummary,contrast=L1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(OneWaySummary,contrast=L1vsOthers) # OneWay-Figure5.jpeg
plotContrast(OneWaySummary,contrast=L1vsOthers,labels=c("Level1","Others"),conf.level=.99,rope=c(-2,2)) # OneWay-Figure6.jpeg

#### Significance Test for a Contrast

testContrast(OneWaySummary,contrast=L1vsOthers)
testContrast(OneWaySummary,contrast=L1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(OneWaySummary,contrast=L1vsOthers)
standardizeContrast(OneWaySummary,contrast=L1vsOthers,conf.level=.99)
