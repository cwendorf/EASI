# EASI: Estimation Approach to Statistical Inference
## Repeated (Within-Subjects) Example with Donohue Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
DonohueSummary <- rbind(Pretest,Posttest,Followup)
class(DonohueSummary) <- "wss"
DonohueSummary

DonohueCorr <- declareCorrMatrix("Pretest","Posttest","Followup")
DonohueCorr["Pretest","Posttest"] <- .493
DonohueCorr["Pretest","Followup"] <- .536
DonohueCorr["Posttest","Followup"] <- .743
DonohueCorr <- fillCorrMatrix(DonohueCorr)
DonohueCorr

### Analyses of the Different Variables

estimateMeans(DonohueSummary)
plotMeans(DonohueSummary) # Donohue-Figure1.jpeg

### Analysis of a Variable Difference

PostvsFollowup <- DonohueSummary[c(2,3),]
class(PostvsFollowup) <- "wss"
estimateDifference(PostvsFollowup,DonohueCorr)
plotDifference(PostvsFollowup,DonohueCorr) # Donohue-Figure2.jpeg
standardizeDifference(PostvsFollowup,DonohueCorr)

### Analysis of a Variable Contrast

PrevsPostFollow <- c(-1,.5,.5)
estimateContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
plotContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow")) # Donohue-Figure3.jpeg
testContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
standardizeContrast(DonohueSummary,DonohueCorr,contrast=PrevsPostFollow)
