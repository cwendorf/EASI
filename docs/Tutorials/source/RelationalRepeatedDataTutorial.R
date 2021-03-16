# Estimation Approach to Statistical Inference

library(EASI)

## Relational Repeated Measures (Within-Subjects) Tutorial with Data

### Data Management

#### Data Entry

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Plot of the Data

plotBoxes(Outcome1,Outcome2,Outcome3)
plotDensity(Outcome1,Outcome2,Outcome3,add=TRUE)
plotData(Outcome1,Outcome2,Outcome3,add=TRUE)

#### Descriptive Statistics

describeMeans(Outcome1,Outcome2,Outcome3)

### Analyses of the Omnibus Effect

#### Confidence Intervals

estimateMeans(Outcome1,Outcome2,Outcome3)
plotMeans(Outcome1,Outcome2,Outcome3)

#### Significance Test

describeMeansOmnibus(Outcome1,Outcome2,Outcome3)
testMeansOmnibus(Outcome1,Outcome2,Outcome3)

### Analyses of the Pairwise Comparisons

#### Confidence Intervals

estimateMeansPairwise(Outcome1,Outcome2,Outcome3)
plotMeansPairwise(Outcome1,Outcome2,Outcome3,mu=0)

#### Significance Tests

testMeansPairwise(Outcome1,Outcome2,Outcome3)

### Analyses of the Pairwise Comparisons Using Relational Intervals

#### Confidence and Relational Intervals

estimateMeansRelational(Outcome1,Outcome2,Outcome3)
plotMeansRelational(Outcome1,Outcome2,Outcome3)

estimateMeansRelational(Outcome1,Outcome2,Outcome3,conf.level=.99)
plotMeansRelational(Outcome1,Outcome2,Outcome3,conf.level=.99)
