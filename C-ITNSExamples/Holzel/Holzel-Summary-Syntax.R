# Estimation Approach to Statistical Inference (EASI)
## Mixed Design Example with Holzel Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

PretestControl <- c(N=17,M=.438,SD=.049)
PosttestControl <- c(N=17,M=.439,SD=.055)
HolzelSummaryControl <- rbind(PretestControl,PosttestControl)
class(HolzelSummaryControl) <- "wss"
HolzelSummaryControl

HolzelCorrControl <- declareCorrMatrix("PretestControl","PosttestControl")
HolzelCorrControl["PretestControl","PosttestControl"] <- .970
HolzelCorrControl <- fillCorrMatrix(HolzelCorrControl)
HolzelCorrControl

PretestMeditation <- c(N=16,M=.437,SD=.064)
PosttestMeditation <- c(N=16,M=.447,SD=.063)
HolzelSummaryMeditation <- rbind(PretestMeditation,PosttestMeditation)
class(HolzelSummaryMeditation) <- "wss"
HolzelSummaryMeditation

HolzelCorrMeditation <- declareCorrMatrix("PretestMeditation","PosttestMeditation")
HolzelCorrMeditation["PretestMeditation","PosttestMeditation"] <- .993
HolzelCorrMeditation <- fillCorrMatrix(HolzelCorrMeditation)
HolzelCorrMeditation

#### Confidence Intervals for the Means

estimateMeans(HolzelSummaryControl)
estimateMeans(HolzelSummaryMeditation)
plotMeans(HolzelSummaryControl) # Holzel-Figure1.jpeg
plotMeans(HolzelSummaryMeditation) # Holzel-Figure2.jpeg
