# Estimation Approach to Statistical Inference
## Mixed Design Example with Holzel Summary Statistics

### Enter Summary Statistics

PretestControl <- c(N=17,M=43.815,SD=4.910)
PosttestControl <- c(N=17,M=43.932,SD=5.507)
HolzelSummaryControl <- rbind(PretestControl,PosttestControl)
class(HolzelSummaryControl) <- "wss"
HolzelSummaryControl

HolzelCorrControl <- declareCorrMatrix("PretestControl","PosttestControl")
HolzelCorrControl["PretestControl","PosttestControl"] <- .970
HolzelCorrControl <- fillCorrMatrix(HolzelCorrControl)
HolzelCorrControl

PretestMeditation <- c(N=16,M=43.705,SD=6.427)
PosttestMeditation <- c(N=16,M=44.666,SD=6.303)
HolzelSummaryMeditation <- rbind(PretestMeditation,PosttestMeditation)
class(HolzelSummaryMeditation) <- "wss"
HolzelSummaryMeditation

HolzelCorrMeditation <- declareCorrMatrix("PretestMeditation","PosttestMeditation")
HolzelCorrMeditation["PretestMeditation","PosttestMeditation"] <- .993
HolzelCorrMeditation <- fillCorrMatrix(HolzelCorrMeditation)
HolzelCorrMeditation

### Analyses of the Differences within Conditions

plotDifference(HolzelSummaryControl,HolzelCorrControl,ylab="Gray Matter")
plotDifference(HolzelSummaryMeditation,HolzelCorrMeditation,ylab="Gray Matter")

standardizeDifference(HolzelSummaryControl,HolzelCorrControl)
standardizeDifference(HolzelSummaryMeditation,HolzelCorrMeditation)
