# Estimation Approach to Statistical Inference
## FactorialBy - Factorial (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")

### Enter Summary Statistics

A1 <- c(N=4,M=2.000,SD=2.449)
A2 <- c(N=4,M=6.000,SD=2.449)
A3 <- c(N=4,M=7.000,SD=2.449)
BetweenSummaryB1 <- rbind(A1,A2,A3)

A1 <- c(N=4,M=4.000,SD=2.449)
A2 <- c(N=4,M=4.000,SD=2.449)
A3 <- c(N=4,M=5.000,SD=2.449)
BetweenSummaryB2 <- rbind(A1,A2,A3)

FactorialSummary <- list("B1"=BetweenSummaryB1,"B2"=BetweenSummaryB2)
class(FactorialSummary) <- "bss"
FactorialSummary

### Analyses of Multiple Groups

#### Confidence Intervals for the Means

estimateMeansBy(FactorialSummary)
estimateMeansBy(FactorialSummary,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotMeansBy(FactorialSummary) # Includes FactorialBy-Figure1.jpeg and FactorialBy-Figure2.jpeg
plotMeansBy(FactorialSummary,conf.level=.99,mu=5,rope=c(3,7)) # Includes FactorialBy-Figure3.jpeg and FactorialBy-Figure4.jpeg

#### Significance Tests for the Means

testMeansBy(FactorialSummary)
testMeansBy(FactorialSummary,mu=5)

#### Effect Size for the Means

standardizeMeansBy(FactorialSummary)
standardizeMeansBy(FactorialSummary,conf.level=.99,mu=5)

### Analyses of a Group Comparison

CompSummaryB1 <- BetweenSummaryB1[c("A1","A2"),]
CompSummaryB2 <- BetweenSummaryB2[c("A1","A2"),]
CompSummary <- list("B1"=CompSummaryB1,"B2"=CompSummaryB2)
class(CompSummary) <- "bss"
CompSummary

#### Confidence Interval for a Mean Difference

estimateDifferenceBy(CompSummary)
estimateDifferenceBy(CompSummary,conf.level=.99)

#### Plot of the Confidence Interval for the Mean Difference

plotDifferenceBy(CompSummary) # Includes FactorialBy-Figure5.jpeg and FactorialBy-Figure6.jpeg
plotDifferenceBy(CompSummary,conf.level=.99,rope=c(-2,2)) # Includes FactorialBy-Figure7.jpeg and FactorialBy-Figure8.jpeg

#### Significance Test for the Mean Difference

testDifferenceBy(CompSummary)
testDifferenceBy(CompSummary,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifferenceBy(CompSummary)
standardizeDifferenceBy(CompSummary,conf.level=.99,mu=-2)

### Analyses of a Factor Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast

estimateContrastBy(FactorialSummary,contrast=A1vsOthers)
estimateContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrastBy(FactorialSummary,contrast=A1vsOthers) # Includes FactorialBy-Figure9.jpeg and FactorialBy-Figure10.jpeg
plotContrastBy(FactorialSummary,contrast=A1vsOthers,labels=c("A1","Others"),conf.level=.99,rope=c(-2,2)) # Includes FactorialBy-Figure11.jpeg and FactorialBy-Figure12.jpeg

#### Significance Test for a Contrast

testContrastBy(FactorialSummary,contrast=A1vsOthers)
testContrastBy(FactorialSummary,contrast=A1vsOthers,mu=4)

#### Effect Size for a Contrast

standardizeContrastBy(FactorialSummary,contrast=A1vsOthers)
standardizeContrastBy(FactorialSummary,contrast=A1vsOthers,conf.level=.99)
