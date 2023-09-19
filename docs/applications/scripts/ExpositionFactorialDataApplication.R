# Estimation Approach to Statistical Inference
## Exposition Factorial Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Outcome <- c(rnorm(30,mean=8,sd=2),rnorm(30,mean=11,sd=4),rnorm(30,mean=12,sd=4),rnorm(30,mean=8,sd=2),rnorm(30,mean=8,sd=3),rnorm(30,mean=7,sd=4))
FactorialData <- data.frame(FactorA,FactorB,Outcome)

FactorialB1 <- subset(FactorialData,FactorB=="B1")
FactorialB2 <- subset(FactorialData,FactorB=="B2")

### Descriptive Statistics

(FactorialB1) %$>% (Outcome~FactorA) |> describeMeans()
(FactorialB2) %$>% (Outcome~FactorA) |> describeMeans()

### Analyses of the Means

(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeans()
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeans()
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeans()
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeans()
(FactorialB1) %$>% (Outcome~FactorA) |> testMeansOmnibus()
(FactorialB2) %$>% (Outcome~FactorA) |> testMeansOmnibus()
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeans()

### Analyses of a Comparison

ComparisonB1 <- (FactorialB1) %$>% factor(FactorA,c("A1","A2"))
ComparisonB2 <- (FactorialB2) %$>% factor(FactorA,c("A1","A2"))
(FactorialB1) %$>% (Outcome~ComparisonB1) |> estimateMeanDifference()
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateMeanDifference()
(FactorialB1) %$>% (Outcome~ComparisonB1) |> plotMeanDifference()
(FactorialB2) %$>% (Outcome~ComparisonB2) |> plotMeanDifference()
(FactorialB1) %$>% (Outcome~ComparisonB1) |> testMeanDifference()
(FactorialB2) %$>% (Outcome~ComparisonB2) |> testMeanDifference()
(FactorialB1) %$>% (Outcome~ComparisonB1) |> estimateStandardizedMeanDifference()
(FactorialB2) %$>% (Outcome~ComparisonB2) |> estimateStandardizedMeanDifference()

### Analyses of a Contrast

A1vsOthers <- c(-1,.5,.5)
(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeanContrast(contrast=A1vsOthers)
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeanContrast(contrast=A1vsOthers)
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeanContrast(contrast=A1vsOthers)
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeanContrast(contrast=A1vsOthers)
(FactorialB1) %$>% (Outcome~FactorA) |> testMeanContrast(contrast=A1vsOthers)
(FactorialB2) %$>% (Outcome~FactorA) |> testMeanContrast(contrast=A1vsOthers)
(FactorialB1) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
(FactorialB2) %$>% (Outcome~FactorA) |> estimateStandardizedMeanContrast(contrast=A1vsOthers)
