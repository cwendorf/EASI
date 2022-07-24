# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Donohue Summary Statistics Example

### Data Management

Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
DonohueSummary <- rbind(Pretest,Posttest,Followup)
class(DonohueSummary) <- "wss"

DonohueCorr <- declareCorrelations("Pretest","Posttest","Followup")
DonohueCorr["Pretest","Posttest"] <- .493
DonohueCorr["Pretest","Followup"] <- .536
DonohueCorr["Posttest","Followup"] <- .743
DonohueCorr <- fillCorrelations(DonohueCorr)

### Analyses of the Different Variables

estimateMeans(DonohueSummary)
plotMeans(DonohueSummary,main="Critical Thinking Scores at Pretest, Posttest, and Followup",ylim=c(0,30),values=FALSE)
 
### Analysis of a Variable Difference

PostvsFollowup <- DonohueSummary[c(2,3),]
class(PostvsFollowup) <- "wss"
estimateMeanComparison(PostvsFollowup,DonohueCorr)
plotMeanComparison(PostvsFollowup,DonohueCorr,main="Critical Thinking Scores of Posttest vs Followup",ylim=c(0,30),values=FALSE)
estimateStandardizedMeanDifference(PostvsFollowup,DonohueCorr)

### Analysis of a Variable Contrast

PrevsPostFollow <- c(-1,.5,.5)
estimateMeanSubsets(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
plotMeanSubsets(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow"),main="Critical Thinking Scores of Prestest vs Posttest and Followup Combined",ylab="Critical Thinking",ylim=c(0,30),values=FALSE)
estimateStandardizedMeanContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
