# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Mixed Design Correlations Summary Statistics Tutorial

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
MixedSummaryL1 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL1) <- "wss"

MixedCorrL1 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL1["Outcome1",] <- c(1.000,.500,.389)
MixedCorrL1["Outcome2",] <- c(.500,1.000,.889)
MixedCorrL1["Outcome3",] <- c(.389,.889,1.000)

Outcome1 <- c(N=4,M=7.000,SD=2.449)
Outcome2 <- c(N=4,M=5.000,SD=2.449)
Outcome3 <- c(N=4,M=6.000,SD=2.449)
MixedSummaryL2 <- rbind(Outcome1,Outcome2,Outcome3)
class(MixedSummaryL2) <- "wss"

MixedCorrL2 <- declareCorrelations("Outcome1","Outcome2","Outcome3")
MixedCorrL2["Outcome1",] <- c(1.000,.889,.500)
MixedCorrL2["Outcome2",] <- c(.889,1.000,.389)
MixedCorrL2["Outcome3",] <- c(.500,.389,1.000)

### Analyses of a Correlation

CompSummaryL1 <- MixedSummaryL1[c("Outcome1","Outcome2"),]
class(CompSummaryL1) <- "wss"
CompSummaryL2 <- MixedSummaryL2[c("Outcome1","Outcome2"),]
class(CompSummaryL2) <- "wss"

CompCorrL1 <- MixedCorrL1[c("Outcome1","Outcome2"),c("Outcome1","Outcome2")]
CompCorrL2 <- MixedCorrL2[c("Outcome1","Outcome2"),c("Outcome1","Outcome2")]

#### Confidence Intervals

estimateCorrelations(CompSummaryL1,CompCorrL1)
estimateCorrelations(CompSummaryL2,CompCorrL2)

plotCorrelations(CompSummaryL1,CompCorrL1)
plotCorrelations(CompSummaryL2,CompCorrL2)

estimateCorrelations(CompSummaryL1,CompCorrL1,conf.level=.99)
estimateCorrelations(CompSummaryL2,CompCorrL2,conf.level=.99)

plotCorrelations(CompSummaryL1,CompCorrL1,conf.level=.99,line=0,rope=c(-.2,.2))
plotCorrelations(CompSummaryL2,CompCorrL2,conf.level=.99,line=0,rope=c(-.2,.2))

#### Significance Tests

testCorrelations(CompSummaryL1,CompCorrL1)
testCorrelations(CompSummaryL2,CompCorrL2)

### Analyses of Several Correlations

#### Confidence Intervals

estimateCorrelations(MixedSummaryL1,MixedCorrL1)
estimateCorrelations(MixedSummaryL2,MixedCorrL2)

plotCorrelations(MixedSummaryL1,MixedCorrL1)
plotCorrelations(MixedSummaryL2,MixedCorrL2)

estimateCorrelations(MixedSummaryL1,MixedCorrL1,conf.level=.99)
estimateCorrelations(MixedSummaryL2,MixedCorrL2,conf.level=.99)

plotCorrelations(MixedSummaryL1,MixedCorrL1,conf.level=.99,line=0,rope=c(-.2,.2))
plotCorrelations(MixedSummaryL2,MixedCorrL2,conf.level=.99,line=0,rope=c(-.2,.2))

#### Significance Tests

testCorrelations(MixedSummaryL1,MixedCorrL1)
testCorrelations(MixedSummaryL2,MixedCorrL2)

### Analyses of a Correlation Difference

#### Confidence Intervals

CorrEstimateL1 <- estimateCorrelations(CompSummaryL1,CompCorrL1)
CorrEstimateL2 <- estimateCorrelations(CompSummaryL2,CompCorrL2)

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- estimateCorrelations(CompSummaryL1,CompCorrL1,conf.level=.99)
CorrEstimateL2 <- estimateCorrelations(CompSummaryL2,CompCorrL2,conf.level=.99)

estimateCorrelationDifference(CorrEstimateL1,CorrEstimateL2)
plotCorrelationDifference(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- estimateCorrelations(CompSummaryL1,CompCorrL1)
CorrEstimateL2 <- estimateCorrelations(CompSummaryL2,CompCorrL2)

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)

CorrEstimateL1 <- estimateCorrelations(CompSummaryL1,CompCorrL1,conf.level=.99)
CorrEstimateL2 <- estimateCorrelations(CompSummaryL2,CompCorrL2,conf.level=.99)

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2)
