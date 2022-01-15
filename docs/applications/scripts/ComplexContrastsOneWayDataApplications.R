# Estimation Approach to Statistical Inference
## Complex Contrasts One Way Data Applications

### Package Loading

#### Source all of the EASI functions
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Set up for analyses of the raw data
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Analyses of a Complex Mean Contrast

#### Set two contrasts - One for the Grand Mean and One for Group 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and plot the confidence intervals for each contrast and the difference between contrasts
estimateMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change confidence Level for the intervals and re-estimate
estimateMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))
