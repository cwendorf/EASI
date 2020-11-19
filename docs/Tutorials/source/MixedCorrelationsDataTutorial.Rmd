# Estimation Approach to Statistical Inference

library(EASI)

## Mixed Design Tutorial with Data

### Data Management

#### Data Entry

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,3,1,6,6)
Outcome2 <- c(4,7,4,9,2,2,5,7)
Outcome3 <- c(4,9,6,9,2,4,7,7)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

MixedDataL1 <- subset(MixedData,Factor=="Level1")
MixedDataL2 <- subset(MixedData,Factor=="Level2")

#### Descriptive Statistics

with(MixedDataL1,describeMeans(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,describeMeans(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,describeCorrelations(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,describeCorrelations(Outcome1,Outcome2,Outcome3))

### Analyses of a Correlation

#### Confidence Intervals

with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2))
with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2))

with(MixedDataL1,plotCorrelations(Outcome1,Outcome2))
with(MixedDataL2,plotCorrelations(Outcome1,Outcome2))

with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))
with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))

with(MixedDataL1,plotCorrelations(Outcome1,Outcome2,conf.level=.99))
with(MixedDataL2,plotCorrelations(Outcome1,Outcome2,conf.level=.99))

#### Significance Tests

with(MixedDataL1,testCorrelations(Outcome1,Outcome2))
with(MixedDataL2,testCorrelations(Outcome1,Outcome2))

### Analyses of Several Correlations

#### Confidence Intervals

with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,plotCorrelations(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,plotCorrelations(Outcome1,Outcome2,Outcome3))

with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99))
with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99))

with(MixedDataL1,plotCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99))
with(MixedDataL2,plotCorrelations(Outcome1,Outcome2,Outcome3,conf.level=.99))

#### Significance Tests

with(MixedDataL1,testCorrelations(Outcome1,Outcome2,Outcome3))
with(MixedDataL2,testCorrelations(Outcome1,Outcome2,Outcome3))

### Analyses of a Correlation Difference

#### Confidence Intervals

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2))

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2))

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(Outcome1,Outcome2,conf.level=.99))

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
