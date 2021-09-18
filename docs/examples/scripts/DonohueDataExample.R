# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Repeated Measures (Within-Subjects) Example with Donohue Data

### Data Management

Pretest <- c(7,11,11,13,15,17,18,18,19,19,19,19,21,22,25,25,25,26,27,29)
Posttest <- c(16,20,25,22,28,12,16,26,21,22,26,30,23,27,23,27,28,24,28,28)
Followup <- c(16,18,23,21,27,21,18,21,24,21,27,28,18,27,23,28,31,18,31,27)
DonohueData <- data.frame(Pretest,Posttest,Followup)

### Analyses of the Different Variables

estimateMeans(Pretest,Posttest,Followup)
plotMeans(Pretest,Posttest,Followup,main="Critical Thinking Scores at Pretest, Posttest, and Followup",ylab="Critical Thinking Score")
 
### Analysis of a Variable Difference

plotMeanComparison(Posttest,Followup,main="Critical Thinking Scores of Posttest vs Followup",ylab="Critical Thinking Score")
estimateStandardizedMeanDifference(Posttest,Followup)

### Analysis of a Variable Contrast

PrevsPostFollow <- c(-1,.5,.5)
plotMeanSubsets(Pretest,Posttest,Followup,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow"),main="Critical Thinking Scores of Prestest vs Posttest and Followup Combined",ylab="Critical Thinking Score")
estimateStandardizedMeanContrast(Pretest,Posttest,Followup,contrast=PrevsPostFollow)
