# Estimation Approach to Statistical Inference

library(EASI)

## Relational OneWay (Between-Subjects) Tutorial with Data

### Data Management

#### Data Entry

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

#### Plot of the Data

plotViolins(Outcome~Factor,main="Summaries of the Groups")
plotBoxes(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE,method="stack",pch=16)

#### Descriptive Statistics

describeMeans(Outcome~Factor)

### Analyses of the Omnibus Effect

#### Confidence Intervals

estimateMeans(Outcome~Factor)
plotMeans(Outcome~Factor)

#### Significance Test

describeMeansOmnibus(Outcome~Factor)
testMeansOmnibus(Outcome~Factor)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(Outcome~Factor)
plotMeansPairwise(Outcome~Factor,mu=0)

#### Significance Tests

testMeansPairwise(Outcome~Factor)

### Analyses of the Pairwise Comparisons Using Relational Intervals

#### Confidence and Relational Intervals

estimateMeansRelational(Outcome~Factor)
plotMeansRelational(Outcome~Factor)

estimateMeansRelational(Outcome~Factor,conf.level=.99)
plotMeansRelational(Outcome~Factor,conf.level=.99)
