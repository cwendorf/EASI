# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## OneWay (Between-Subjects) Example with Rattan Data

### Data Management

Feedback <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation <- c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback <- factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
RattanData <- data.frame(Feedback,Motivation)

### Analyses of the Different Groups

estimateMeans(Motivation~Feedback)
plotMeans(Motivation~Feedback,main="Motivation as a Function of Feedback Type",ylab="Motivation")

### Analysis of a Group Difference

Comparison <- factor(Feedback,c("Comfort","Challenge"))
plotMeanComparison(Motivation~Comparison,main="Influence of Comfort vs Challenge Feedback on Motivation",ylab="Motivation")
estimateStandardizedMeanDifference(Motivation~Comparison)

### Analysis of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
plotMeanSubsets(Motivation~Feedback,contrast=ComfortvsOthers,labels=c("Comfort","Others"),main="Influence of Comfort Feedback vs Other Types of Feedback on Motivation",ylab="Motivation")
estimateStandardizedMeanContrast(Motivation~Feedback,contrast=ComfortvsOthers)
