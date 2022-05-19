# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Mixed Design Correlations Data Tutorial

### Data Management

#### Data Entry

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,9,4,6,9)
Outcome2 <- c(4,7,4,9,6,3,3,8)
Outcome3 <- c(4,9,6,9,5,3,8,8)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

MixedDataL1 <- subset(MixedData,Factor=="Level1")
MixedDataL2 <- subset(MixedData,Factor=="Level2")

#### Descriptive Statistics

with(MixedDataL1,plotRainclouds(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,plotRainclouds(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,describeMeans(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,describeMeans(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,describeCorrelations(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,describeCorrelations(cbind(Outcome1,Outcome2,Outcome3)))

### Analyses of a Correlation

#### Confidence Intervals

with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2)))
with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2)))

with(MixedDataL1,plotCorrelations(cbind(Outcome1,Outcome2)))
with(MixedDataL2,plotCorrelations(cbind(Outcome1,Outcome2)))

with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))
with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))

with(MixedDataL1,plotCorrelations(cbind(Outcome1,Outcome2),conf.level=.99,line=0,rope=c(-.2,.2)))
with(MixedDataL2,plotCorrelations(cbind(Outcome1,Outcome2),conf.level=.99,line=0,rope=c(-.2,.2)))

#### Significance Tests

with(MixedDataL1,testCorrelations(cbind(Outcome1,Outcome2)))
with(MixedDataL2,testCorrelations(cbind(Outcome1,Outcome2)))

### Analyses of Several Correlations

#### Confidence Intervals

with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,plotCorrelations(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,plotCorrelations(cbind(Outcome1,Outcome2,Outcome3)))

with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99))
with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99))

with(MixedDataL1,plotCorrelations(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99,line=0,rope=c(-.2,.2)))
with(MixedDataL2,plotCorrelations(cbind(Outcome1,Outcome2,Outcome3),conf.level=.99,line=0,rope=c(-.2,.2)))

#### Significance Tests

with(MixedDataL1,testCorrelations(cbind(Outcome1,Outcome2,Outcome3)))
with(MixedDataL2,testCorrelations(cbind(Outcome1,Outcome2,Outcome3)))

### Analyses of a Correlation Difference

#### Confidence Intervals

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2)))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2)))

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2)))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2)))

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- with(MixedDataL1,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))
CorrEstimateL2 <- with(MixedDataL2,estimateCorrelations(cbind(Outcome1,Outcome2),conf.level=.99))

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
