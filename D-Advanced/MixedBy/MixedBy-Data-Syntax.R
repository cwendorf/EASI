# Estimation Approach to Statistical Inference
## MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-By-Extension.R")

### Enter Data

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,1,3,6,6)
Outcome2 <- c(4,7,4,9,3,1,6,6)
Outcome3 <- c(4,9,6,9,3,3,6,8)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
MixedData

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor) # Includes MixedBy-Figure1.jpeg and MixedBy-Figure2.jpeg
plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99,mu=5,rope=c(3,7)) # Includes MixedBy-Figure3.jpeg and MixedBy-Figure4.jpeg

#### Significance Tests for the Means

testMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
testMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,mu=5)

#### Effect Size for the Means

standardizeMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
standardizeMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,mu=5,conf.level=.99)

### Analyses of a Variable Comparison

#### Confidence Interval for the Mean Difference

estimateDifferenceBy(Outcome1,Outcome2,by=Factor)
estimateDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifferenceBy(Outcome1,Outcome2,by=Factor) # Includes MixedBy-Figure5.jpeg and MixedBy-Figure6.jpeg
plotDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99,rope=c(-2,2)) # Includes MixedBy-Figure7.jpeg and MixedBy-Figure8.jpeg

#### Significance Test for the Mean Difference

testDifferenceBy(Outcome1,Outcome2,by=Factor)
testDifferenceBy(Outcome1,Outcome2,by=Factor,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifferenceBy(Outcome1,Outcome2,by=Factor)
standardizeDifferenceBy(Outcome1,Outcome2,by=Factor,conf.level=.99)

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers) # Includes MixedBy-Figure9.jpeg and MixedBy-Figure10.jpeg
plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)) # Includes MixedBy-Figure11.jpeg and MixedBy-Figure12.jpeg

#### Significance Test for the Contrast

testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,mu=4)

#### Effect Size for the Contrast

standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers)
standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=O1vsOthers,conf.level=.99)
