# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Holzel Summary Statistics Example

### Data Management

PretestControl <- c(N = 17, M = 43.815, SD = 4.910)
PosttestControl <- c(N = 17, M = 43.932, SD = 5.507)
HolzelSummaryControl <- rbind(PretestControl, PosttestControl)
class(HolzelSummaryControl) <- "wss"

HolzelCorrControl <- declareCorrelations("PretestControl", "PosttestControl")
HolzelCorrControl["PretestControl", "PosttestControl"] <- .970
HolzelCorrControl <- fillCorrelations(HolzelCorrControl)

PretestMeditation <- c(N = 16, M = 43.705, SD = 6.427)
PosttestMeditation <- c(N = 16, M = 44.666, SD = 6.303)
HolzelSummaryMeditation <- rbind(PretestMeditation, PosttestMeditation)
class(HolzelSummaryMeditation) <- "wss"

HolzelCorrMeditation <- declareCorrelations("PretestMeditation", "PosttestMeditation")
HolzelCorrMeditation["PretestMeditation", "PosttestMeditation"] <- .993
HolzelCorrMeditation <- fillCorrelations(HolzelCorrMeditation)

### Analyses of the Differences within Conditions

estimateMeanComparison(HolzelSummaryControl, HolzelCorrControl)
plotMeanComparison(HolzelSummaryControl, HolzelCorrControl, main = "Pretest vs Posttest for the Control Group", ylab = "Gray Matter", values = FALSE)
estimateMeanComparison(HolzelSummaryMeditation, HolzelCorrMeditation)
plotMeanComparison(HolzelSummaryMeditation, HolzelCorrMeditation, main = "Pretest vs Posttest for the Meditation Group", ylab = "Gray Matter", values = FALSE)

estimateStandardizedMeanDifference(HolzelSummaryControl, HolzelCorrControl)
estimateStandardizedMeanDifference(HolzelSummaryMeditation, HolzelCorrMeditation)
