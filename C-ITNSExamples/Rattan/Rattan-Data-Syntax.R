# EASI: Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Example with Rattan Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Feedback <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation <- c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback <- factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
RattanData <- data.frame(Feedback,Motivation)
RattanData

### Analyses of the Different Groups

estimateMeans(Motivation~Feedback)
plotMeans(Motivation~Feedback) # Rattan-Figure1.jpeg

### Analysis of a Group Comparison

Comparison <- factor(Feedback,c("Comfort","Challenge"))
estimateDifference(Motivation~Comparison)
plotDifference(Motivation~Comparison) # Rattan-Figure2.jpeg
standardizeDifference(Motivation~Comparison)

### Analyses of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(Motivation~Feedback,contrast=ComfortvsOthers)
plotContrast(Motivation~Feedback,contrast=ComfortvsOthers,labels=c("Comfort","Others")) # Rattan-Figure3.jpeg
testContrast(Motivation~Feedback,contrast=ComfortvsOthers)
standardizeContrast(Motivation~Feedback,contrast=ComfortvsOthers)
