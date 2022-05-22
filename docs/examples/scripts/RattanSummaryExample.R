# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Rattan Summary Statistics Example

### Data Management

Comfort <- c(N=18,M=3.333,SD=1.917)
Challenge <- c(N=17,M=5.265,SD=1.448)
Control <- c(N=19,M=4.447,SD=1.433)
RattanSummary <- rbind(Comfort,Challenge,Control)
class(RattanSummary) <- "bss"

### Analyses of the Different Groups

estimateMeans(RattanSummary)
plotMeans(RattanSummary,main="Motivation as a Function of Feedback Type",ylab="Motivation")

### Analysis of a Group Difference

ComfortvsChallenge <- rbind(Comfort,Challenge)
class(ComfortvsChallenge) <- "bss"
plotMeanComparison(ComfortvsChallenge,main="Influence of Comfort vs Challenge Feedback on Motivation",ylab="Motivation")
estimateStandardizedMeanDifference(ComfortvsChallenge)

### Analysis of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
plotMeanSubsets(RattanSummary,contrast=ComfortvsOthers,labels=c("Comfort","Others"),main="Influence of Comfort Feedback vs Other Types of Feedback on Motivation",ylab="Motivation")
estimateStandardizedMeanContrast(RattanSummary,contrast=ComfortvsOthers)
