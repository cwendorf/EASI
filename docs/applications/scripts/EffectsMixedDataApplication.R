# Estimation Approach to Statistical Inference
## Effects Mixed Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

MixedB1 <- subset(MixedData,Factor=="Level1")
MixedB2 <- subset(MixedData,Factor=="Level2")

### Descriptive Statistics

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeans()

### Analyses of the Means

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans()
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeans()

### Analyses of a Comparison

(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateMeanDifference()
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> plotMeanDifference()
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> testMeanDifference()
(MixedB1) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()
(MixedB2) %$>% cbind(Outcome1,Outcome2) |> estimateStandardizedMeanDifference()

### Analyses of a Contrast

O1vsOthers <- c(-1,.5,.5)
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeanContrast(contrast=O1vsOthers)
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeanContrast(contrast=O1vsOthers)
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeanContrast(contrast=O1vsOthers)
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateStandardizedMeanContrast(contrast=O1vsOthers)
