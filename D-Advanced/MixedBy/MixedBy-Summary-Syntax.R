# Estimation Approach to Statistical Inference
## MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)

MixedSummary <- list("Level1"=WithinSummaryL1,"Level2"=WithinSummaryL2)
class(MixedSummary) <- "wss"
MixedSummary

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeansBy(MixedSummary)
estimateMeansBy(MixedSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeansMulti(MixedSummary)
plotMeansMulti(MixedSummary,conf.level=.99)

#### Significance Tests for the Means

testMeansBy(MixedSummary)
testMeansBy(MixedSummary,mu=5)

#### Effect Size for the Means

standardizeMeansBy(MixedSummary)
standardizeMeansBy(MixedSummary,mu=5,conf.level=.99)

### Analyses of a Variable Comparison

#### Confidence Interval for the Mean Difference



#### Plots of Confidence Intervals for the Mean Difference



#### Significance Test for the Mean Difference



#### Effect Size for the Mean Difference



### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast



#### Plots of Confidence Intervals for a Contrast



#### Significance Test for the Contrast



#### Effect Size for the Contrast


