# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## BodyWell Two Sample Summary Statistics Example

### Data Management

BodySatisfactionL1 <- c(N=59,M=3.434,SD=0.668)
WellbeingL1 <- c(N=59,M=4.934,SD=1.250)
BodyWellTwoSummaryL1 <- rbind(BodySatisfactionL1,WellbeingL1)
class(BodyWellTwoSummaryL1) <- "wss"

BodyWellTwoCorrL1 <- declareCorrelations("BodySatisfactionL1","WellbeingL1")
BodyWellTwoCorrL1["BodySatisfactionL1","WellbeingL1"] <- .415

BodySatisfactionL2 <- c(N=47,M=3.819,SD=0.587)
WellbeingL2 <- c(N=47,M=5.206,SD=1.033)
BodyWellTwoSummaryL2 <- rbind(BodySatisfactionL2,WellbeingL2)
class(BodyWellTwoSummaryL2) <- "wss"

BodyWellTwoCorrL2 <- declareCorrelations("BodySatisfactionL2","WellbeingL2")
BodyWellTwoCorrL2["BodySatisfactionL2","WellbeingL2"] <- .528

### Analyses of a Correlation Comparison

CorrEstimateL1 <- estimateCorrelations(BodyWellTwoSummaryL1,BodyWellTwoCorrL1)
CorrEstimateL2 <- estimateCorrelations(BodyWellTwoSummaryL2,BodyWellTwoCorrL2)

estimateCorrelationComparison(CorrEstimateL1,CorrEstimateL2,main="Correlations for the Gender Groups",labels=c("Females","Males"))
plotCorrelationComparison(CorrEstimateL1,CorrEstimateL2,main="Correlations for the Gender Groups",labels=c("Females","Males"),ylim=c(-1,1))
