# Estimation Approach to Statistical Inference

library(EASI)

## Correlation Example with BodyWell One Sample Summary Statistics

### Data Management

BodySatisfaction <- c(N=106,M=3.605,SD=0.659)
Wellbeing <- c(N=106,M=5.055,SD=1.162)
BodyWellOneSummary <- rbind(BodySatisfaction,Wellbeing)
class(BodyWellOneSummary) <- "wss"

BodyWellOneCorr <- declareCorrelations("BodySatisfaction","Wellbeing")
BodyWellOneCorr["BodySatisfaction","Wellbeing"] <- .467

### Analyses of the Correlation

estimateCorrelations(BodyWellOneSummary,BodyWellOneCorr)
plotCorrelations(BodyWellOneSummary,BodyWellOneCorr,main="Correlation for the Entire Sample",ylim=c(-1,1))
