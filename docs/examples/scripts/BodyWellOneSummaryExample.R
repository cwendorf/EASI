# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## BodyWell One Sample Summary Statistics Example

### Data Management

BodySatisfaction <- c(N = 106, M = 3.605, SD = 0.659)
Wellbeing <- c(N = 106, M = 5.055, SD = 1.162)
BodyWellOneSummary <- rbind(BodySatisfaction, Wellbeing)
class(BodyWellOneSummary) <- "wss"

BodyWellOneCorr <- declareCorrelations("BodySatisfaction", "Wellbeing")
BodyWellOneCorr["BodySatisfaction", "Wellbeing"] <- .467
BodyWellOneCorr <- fillCorrelations(BodyWellOneCorr)

### Analyses of the Correlation

estimateCorrelations(BodyWellOneSummary, BodyWellOneCorr)
plotCorrelations(BodyWellOneSummary, BodyWellOneCorr, main = "Correlation for the Entire Sample", ylim = c(-1, 1), values = FALSE, line = 0)
