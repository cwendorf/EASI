# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Regression Example with BodyWell Summary Statistics

### Data Management

BodySatisfaction <- c(N=106,M=3.605,SD=0.659)
Wellbeing <- c(N=106,M=5.055,SD=1.162)
BodyWellOneSummary <- rbind(BodySatisfaction,Wellbeing)
class(BodyWellOneSummary) <- "wss"

BodyWellOneCorr <- declareCorrelations("BodySatisfaction","Wellbeing")
BodyWellOneCorr["BodySatisfaction","Wellbeing"] <- .467
BodyWellOneCorr <- fillCorrelations(BodyWellOneCorr)

PredictorSummary <- rbind(BodySatisfaction)
class(PredictorSummary) <- "wss"
CriterionSummary <- rbind(Wellbeing)

### Analyses of the Regression Line

plotRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,interval="none",xlim=c(1,5))

estimateRegressionCoefficients(PredictorSummary,CriterionSummary,BodyWellOneCorr)
plotRegressionCoefficients(PredictorSummary,CriterionSummary,BodyWellOneCorr)

### Analyses of Regression Values

estimateRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,value=2)
plotRegression(PredictorSummary,CriterionSummary,BodyWellOneCorr,interval="both",value=2,xlim=c(1,5))
