# Estimation Approach to Statistical Inference
## Pairwise OneWay Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Descriptive Statistics

describeMeans(Outcome~Factor)

### Analyses of Pairwise Comparisons

plotMeansPairwiseDiffogram(Outcome~Factor,col=c("darkblue","darkred"))
plotMeansPairwise(Outcome~Factor,line=0)

estimateMeansPairwise(Outcome~Factor)
testMeansPairwise(Outcome~Factor)
estimateStandardizedMeansPairwise(Outcome~Factor)

### Analyses of Post Hoc Comparisons

plotMeansPosthocDiffogram(Outcome~Factor,col=c("darkblue","darkred"))
plotMeansPosthoc(Outcome~Factor,line=0)

estimateMeansPosthoc(Outcome~Factor)
testMeansPairwise(Outcome~Factor)
estimateStandardizedMeansPosthoc(Outcome~Factor)
