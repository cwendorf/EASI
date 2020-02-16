# Estimation Approach to Statistical Inference
## MixedBy - Mixed Design (Between-Subjects and Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
WithinSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)

Outcome1 <- c(N=4,M=4.000,SD=2.449)
Outcome2 <- c(N=4,M=4.000,SD=2.449)
Outcome3 <- c(N=4,M=5.000,SD=2.449)
WithinSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)

MixedSummary <- list("Level1"=WithinSummaryL1,"Level2"=WithinSummaryL2)
class(MixedSummary) <- "wss"
MixedSummary

WithinCorrL1 <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorrL1["Outcome1",] <- c(1.000,.500,.389)
WithinCorrL1["Outcome2",] <- c(.500,1.000,.889)
WithinCorrL1["Outcome3",] <- c(.389,.889,1.000)

WithinCorrL2 <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
WithinCorrL2["Outcome1",] <- c(1.000,.889,.778)
WithinCorrL2["Outcome2",] <- c(.889,1.000,.889)
WithinCorrL2["Outcome3",] <- c(.778,.889,1.000)

MixedCorr <- list("Level1"=WithinCorrL1,"Level2"=WithinCorrL2)
class(MixedCorr) <- "wss"
MixedCorr

### Analyses of Multiple Variables

#### Confidence Intervals for the Means

estimateMeansBy(MixedSummary)
estimateMeansBy(MixedSummary,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeansBy(MixedSummary) # Includes MixedBy-Figure1.jpeg and MixedBy-Figure2.jpeg
plotMeansBy(MixedSummary,conf.level=.99,mu=5,rope=c(3,7)) # Includes MixedBy-Figure3.jpeg and MixedBy-Figure4.jpeg

#### Significance Tests for the Means

testMeansBy(MixedSummary)
testMeansBy(MixedSummary,mu=5)

#### Effect Size for the Means

standardizeMeansBy(MixedSummary)
standardizeMeansBy(MixedSummary,mu=5,conf.level=.99)

### Analyses of a Variable Comparison

CompSummaryL1 <- WithinSummaryL1[c("Outcome1","Outcome2"),]
CompSummaryL2 <- WithinSummaryL2[c("Outcome1","Outcome2"),]
CompSummary <- list("Level1"=WithinSummaryL1,"Level2"=WithinSummaryL2)
class(CompSummary) <- "wss"

#### Confidence Interval for the Mean Difference

estimateDifferenceBy(CompSummary,MixedCorr)
estimateDifferenceBy(CompSummary,MixedCorr,conf.level=.99)

#### Plots of Confidence Intervals for the Mean Difference

plotDifferenceBy(CompSummary,MixedCorr) # Includes MixedBy-Figure5.jpeg and MixedBy-Figure6.jpeg
plotDifferenceBy(CompSummary,MixedCorr,conf.level=.99,rope=c(-2,2)) # Includes MixedBy-Figure7.jpeg and MixedBy-Figure8.jpeg

#### Significance Test for the Mean Difference

testDifferenceBy(CompSummary,MixedCorr)
testDifferenceBy(CompSummary,MixedCorr,mu=-2)

#### Effect Size for the Mean Difference

standardizeDifferenceBy(CompSummary,MixedCorr)
standardizeDifferenceBy(CompSummary,MixedCorr,conf.level=.99)

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)

#### Confidence Interval for the Contrast

estimateContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
estimateContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers) # Includes MixedBy-Figure9.jpeg and MixedBy-Figure10.jpeg
plotContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers,labels=c("Outcome1","Others"),conf.level=.99,rope=c(-2,2)) # Includes MixedBy-Figure11.jpeg and MixedBy-Figure12.jpeg

#### Significance Test for the Contrast

testContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
testContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers,mu=4)

#### Effect Size for the Contrast

standardizeContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers)
standardizeContrastBy(MixedSummary,MixedCorr,contrast=O1vsOthers,conf.level=.99)
