# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## BodyWell Regression Summary Statistics Example

### Data Management

BodySatisfaction <- c(N=106,M=3.605,SD=0.659)
Wellbeing <- c(N=106,M=5.055,SD=1.162)
BodyWellOneSummary <- rbind(BodySatisfaction,Wellbeing)
class(BodyWellOneSummary) <- "wss"

BodyWellOneCorr <- declareCorrelations("BodySatisfaction","Wellbeing")
BodyWellOneCorr["BodySatisfaction","Wellbeing"] <- .467
BodyWellOneCorr <- fillCorrelations(BodyWellOneCorr)

### Analyses of the Regression Line

plotRegression(BodyWellOneSummary,BodyWellOneCorr,interval="none",xlim=c(1,5),ylim=c(1,7),cross=TRUE)

estimateRegressionCoefficients(BodyWellOneSummary,BodyWellOneCorr)
plotRegressionCoefficients(BodyWellOneSummary,BodyWellOneCorr)

### Analyses of Regression Values

estimateRegression(BodyWellOneSummary,BodyWellOneCorr,value=2)
plotRegression(BodyWellOneSummary,BodyWellOneCorr,interval="both",value=2,xlim=c(1,5),ylim=c(1,7),values=FALSE)
