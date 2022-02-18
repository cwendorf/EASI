# Estimation Approach to Statistical Inference
## Pairwise Repeated Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Descriptive Statistics

describeMeans(RepeatedData)

### Analyses of Pairwise Comparisons

plotMeansPairwiseDiffogram(RepeatedData,col=c("darkblue","darkred"))
plotMeansPairwise(RepeatedData,line=0)

estimateMeansPairwise(RepeatedData)
testMeansPairwise(RepeatedData)
estimateStandardizedMeansPairwise(RepeatedData)

### Analyses of Post Hoc Comparisons

plotMeansPosthocDiffogram(RepeatedData,col=c("darkblue","darkred"))
plotMeansPosthoc(RepeatedData,line=0)

estimateMeansPosthoc(RepeatedData)
testMeansPairwise(RepeatedData)
estimateStandardizedMeansPosthoc(RepeatedData)
