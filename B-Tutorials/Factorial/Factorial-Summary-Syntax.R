# Estimation Approach to Statistical Inference
## Factorial (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")

### Enter Summary Statistics

A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummaryB1 <- rbind(A1,A2,A3)
class(BetweenSummaryB1) <- "bss"
BetweenSummaryB1

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
BetweenSummaryB2 <- rbind(A1,A2,A3)
class(BetweenSummaryB2) <- "bss"
BetweenSummaryB2

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

estimateMeans(BetweenSummaryB1)
estimateMeans(BetweenSummaryB2)
estimateMeans(BetweenSummaryB1,conf.level=.99)
estimateMeans(BetweenSummaryB2,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeans(BetweenSummaryB1) # Factorial-Figure1.jpeg
plotMeans(BetweenSummaryB2) # Factorial-Figure2.jpeg
plotMeans(BetweenSummaryB1,conf.level=.99,mu=5,rope=c(3,7)) # Factorial-Figure3.jpeg
plotMeans(BetweenSummaryB2,conf.level=.99,mu=5,rope=c(3,7)) # Factorial-Figure4.jpeg

#### Significance Tests for the Means

testMeans(BetweenSummaryB1)
testMeans(BetweenSummaryB2)
testMeans(BetweenSummaryB1,mu=5)
testMeans(BetweenSummaryB2,mu=5)

#### Effect Size for the Means

standardizeMeans(BetweenSummaryB1)
standardizeMeans(BetweenSummaryB2)
standardizeMeans(BetweenSummaryB1,mu=5,conf.level=.99)
standardizeMeans(BetweenSummaryB2,mu=5,conf.level=.99)

### Analyses of a Group Comparison

CompSummaryB1 <- BetweenSummaryB1[c("A1","A2"),]
class(CompSummaryB1) <- "bss"
CompSummaryB2 <- BetweenSummaryB2[c("A1","A2"),]
class(CompSummaryB2) <- "bss"

#### Confidence Interval for a Mean Difference

estimateDifference(CompSummaryB1)
estimateDifference(CompSummaryB2)
estimateDifference(CompSummaryB1,conf.level=.99)
estimateDifference(CompSummaryB2,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(CompSummaryB1) # Factorial-Figure5.jpeg
plotDifference(CompSummaryB2) # Factorial-Figure6.jpeg
plotDifference(CompSummaryB1,conf.level=.99,rope=c(-2,2)) # Factorial-Figure7.jpeg
plotDifference(CompSummaryB2,conf.level=.99,rope=c(-2,2)) # Factorial-Figure8.jpeg

#### Significance Test of the Mean Difference

testDifference(CompSummaryB1)
testDifference(CompSummaryB2)
testDifference(CompSummaryB1,mu=-2)
testDifference(CompSummaryB2,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifference(CompSummaryB1)
standardizeDifference(CompSummaryB2)
standardizeDifference(CompSummaryB1,conf.level=.99)
standardizeDifference(CompSummaryB2,conf.level=.99)

### Analyses of a Group Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast

estimateContrast(BetweenSummaryB1,contrast=A1vsOthers)
estimateContrast(BetweenSummaryB2,contrast=A1vsOthers)
estimateContrast(BetweenSummaryB1,contrast=A1vsOthers,conf.level=.99)
estimateContrast(BetweenSummaryB2,contrast=A1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(BetweenSummaryB1,contrast=A1vsOthers) # Factorial-Figure9.jpeg
plotContrast(BetweenSummaryB2,contrast=A1vsOthers) # Factorial-Figure10.jpeg
plotContrast(BetweenSummaryB1,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)) # Factorial-Figure11.jpeg
plotContrast(BetweenSummaryB2,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)) # Factorial-Figure12.jpeg

#### Significance Test for a Contrast

testContrast(BetweenSummaryB1,contrast=A1vsOthers)
testContrast(BetweenSummaryB2,contrast=A1vsOthers)
testContrast(BetweenSummaryB1,contrast=A1vsOthers,mu=4)
testContrast(BetweenSummaryB2,contrast=A1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrast(BetweenSummaryB1,contrast=A1vsOthers)
standardizeContrast(BetweenSummaryB2,contrast=A1vsOthers)
standardizeContrast(BetweenSummaryB1,contrast=A1vsOthers,conf.level=.99)
standardizeContrast(BetweenSummaryB2,contrast=A1vsOthers,conf.level=.99)
