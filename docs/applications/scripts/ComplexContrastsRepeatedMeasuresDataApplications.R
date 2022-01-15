# Estimation Approach to Statistical Inference
## Complex Contrasts Repeated Measures Data Applications

### Package Loading

#### Source all of the EASI functions
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Set up for analyses of the raw data
Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Analyses of a Complex Mean Contrast

#### Set two contrasts - One for the Grand Mean and One for Outcome 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and plot the confidence intervals for each contrast and the difference between contrasts
estimateMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change confidence Level for the intervals and re-estimate
estimateMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(RepeatedData,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))
