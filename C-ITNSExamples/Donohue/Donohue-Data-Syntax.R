# Estimation Approach to Statistical Inference (EASI)
## Repeated (Within-Subjects) Example with Donohue Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Pretest <- c(7,11,11,13,15,17,18,18,19,19,19,19,21,22,25,25,25,26,27,29)
Posttest <- c(16,20,25,22,28,12,16,26,21,22,26,30,23,27,23,27,28,24,28,28)
Followup <- c(16,18,23,21,27,21,18,21,24,21,27,28,18,27,23,28,31,18,31,27)
DonohueData <- data.frame(Pretest,Posttest,Followup)
DonohueData

### Analyses of the Different Variables

estimateMeans(Pretest,Posttest,Followup)
plotMeans(Pretest,Posttest,Followup) # Donohue-Figure1.jpeg

### Analysis of a Variable Difference

estimateDifference(Posttest,Followup)
plotDifference(Posttest,Followup) # Donohue-Figure2.jpeg
standardizeDifference(Posttest,Followup)

### Analysis of a Variable Contrast

PrevsPostFollow <- c(-1,.5,.5)
estimateContrast(Pretest,Posttest,Followup,contrast=PrevsPostFollow)
plotContrast(Pretest,Posttest,Followup,contrast=PrevsPostFollow,labels=c("Pretest","Post&Follow")) # Donohue-Figure3.jpeg
testContrast(Pretest,Posttest,Followup,contrast=PrevsPostFollow)
standardizeContrast(Pretest,Posttest,Followup,contrast=PrevsPostFollow)
