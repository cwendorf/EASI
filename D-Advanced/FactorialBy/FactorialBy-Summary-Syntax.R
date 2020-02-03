# Estimation Approach to Statistical Inference
## FactorialBy - Factorial (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")

### Enter Data

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

plotMeansMulti(FactorialSummary)
plotMeansMulti(FactorialSummary,conf.level=.99)

#### Significance Tests for the Means

testMeansBy(FactorialSummary)
testMeansBy(FactorialSummary,mu=5)

#### Effect Size for the Means

standardizeMeansBy(FactorialSummary)
standardizeMeansBy(FactorialSummary,conf.level=.99,mu=5)

### Analyses of a Group Comparison

#### Confidence Interval for a Mean Difference



#### Plot of the Confidence Interval for the Mean Difference



#### Significance Test for the Mean Difference



#### Effect Size for the Mean Difference



### Analyses of a Factor Contrast

A1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for a Contrast



#### Plots of Confidence Intervals for a Contrast



#### Significance Test for a Contrast



#### Effect Size for a Contrast


