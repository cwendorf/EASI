# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## BodyWell Two Sample Data Example

### Data Management

#### Data Entry

Gender <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
BodySatisfaction <- c(4, 2.4, 3, 3, 3.1, 2.4, 2.9, 3.1, 3, 3.3, 2, 3.1, 2.4, 3.1, 3.3, 3.4, 3.3, 3.6, 2.7, 3.3, 3.6, 2.3, 3.7, 4, 2.7, 3.1, 3.3, 3.4, 4.4, 3.3, 3.3, 4, 4.1, 3.3, 3.6, 3.9, 4, 5, 3, 3, 3.3, 3.9, 3.9, 4.7, 5, 2.6, 2.9, 3.4, 3.4, 3.9, 4.3, 2.6, 3.1, 3.4, 3.7, 4, 4.1, 4, 5, 4, 2.4, 3.7, 3, 3.6, 2.9, 2.7, 3.3, 4.3, 3.1, 4.3, 4.4, 4, 3.3, 3.7, 2.9, 3.4, 3.6, 4.7, 4.1, 3, 4.1, 3.7, 4.1, 4, 3.1, 3.7, 3.3, 4.4, 4.3, 4, 4, 4, 3.4, 4.9, 3.7, 3.3, 3.9, 4.6, 4, 3.9, 4.7, 4.3, 4.4, 4.4, 4.6, 4.3)
Wellbeing <- c(1, 2.4, 2.3, 2.4, 2.8, 3.2, 3.4, 3.4, 3.6, 3.6, 3.8, 3.8, 4, 4, 4.2, 4.2, 4.4, 4.4, 4.6, 4.6, 4.6, 4.8, 4.8, 4.8, 5, 5, 5, 5, 5, 5.2, 5.3, 5.2, 5.2, 5.6, 5.6, 5.6, 5.6, 5.6, 5.8, 5.7, 5.8, 5.8, 5.9, 5.8, 5.8, 6, 6, 6, 6.1, 6, 6, 6.2, 6.2, 6.2, 6.4, 6.4, 6.4, 6.6, 7, 2.8, 3, 3.2, 3.2, 3.4, 3.4, 3.8, 4.2, 4.4, 4.4, 4.6, 4.6, 4.6, 4.8, 4.8, 4.8, 5, 5, 5.2, 5.2, 5.4, 5.6, 5.6, 5.5, 5.6, 5.6, 5.7, 5.6, 5.6, 5.6, 5.8, 5.8, 6, 6, 6, 6, 6, 6, 6, 6.1, 6.2, 6.2, 6.2, 6.2, 6.4, 6.6, 7)
BodyWellTwoData <- data.frame(Gender, BodySatisfaction, Wellbeing)

BodyWellTwoDataL1 <- subset(BodyWellTwoData, Gender == "1")
BodyWellTwoDataL2 <- subset(BodyWellTwoData, Gender == "2")

#### Descriptive Statistics

with(BodyWellTwoDataL1, describeMeans(cbind(BodySatisfaction, Wellbeing)))
with(BodyWellTwoDataL2, describeMeans(cbind(BodySatisfaction, Wellbeing)))

with(BodyWellTwoDataL1, describeCorrelations(cbind(BodySatisfaction, Wellbeing)))
with(BodyWellTwoDataL2, describeCorrelations(cbind(BodySatisfaction, Wellbeing)))

### Analyses of a Correlation Comparison

CorrEstimateL1 <- with(BodyWellTwoDataL1, estimateCorrelations(cbind(BodySatisfaction, Wellbeing)))
CorrEstimateL2 <- with(BodyWellTwoDataL2, estimateCorrelations(cbind(BodySatisfaction, Wellbeing)))

estimateCorrelationComparison(CorrEstimateL1, CorrEstimateL2, main = "Correlations for the Gender Groups", labels = c("Females", "Males"))
plotCorrelationComparison(CorrEstimateL1, CorrEstimateL2, main = "Correlations for the Gender Groups", labels = c("Females", "Males"), ylim = c(-1, 1), values = FALSE)
