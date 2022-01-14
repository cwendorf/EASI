# ESTIMATION APPROACH TO STATISTICAL INFERENCE
## Differences Between Contrasts with Repeated Measures Data and Summary Statistics

### Source the EASI Package
#### Installable Package Available at https://github.com/cwendorf/EASI/

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")


### Repeated Data from EASI
#### Set Up for Analyses of the Raw Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Set two contrasts - One for the Grand Mean and One for Outcome 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and Plot the Confidence Intervals for Each Contrast and the Difference Between Contrasts
estimateMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change Confidence Level for the Intervals
estimateMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))


### Repeated Summary from EASI
#### Set Up for Analyses Using Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"

RepeatedCorr <- declareCorrelations("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrelations(RepeatedCorr)

#### Set two contrasts - One for the Grand Mean and One for Outcome 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and Plot the Confidence Intervals for Each Contrast and the Difference Between Contrasts
estimateMeanComplex(RepeatedSummary,RepeatedCorr,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(RepeatedSummary,RepeatedCorr,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change Confidence Level for the Intervals
estimateMeanComplex(RepeatedSummary,RepeatedCorr,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(RepeatedSummary,RepeatedCorr,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))
