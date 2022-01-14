# ESTIMATION APPROACH TO STATISTICAL INFERENCE
## Differences Between Contrasts with One Way Data and Summary Statistics

### Source the EASI Package
#### Installable Package Available at https://github.com/cwendorf/EASI/

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")


### One Way Data from EASI
#### Set Up for Analyses of the Raw Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

#### Set two contrasts - One for the Grand Mean and One for Group 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and Plot the Confidence Intervals for Each Contrast and the Difference Between Contrasts
estimateMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change Confidence Level for the Intervals
estimateMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(Outcome~Factor,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))


### One Way Summary from EASI
#### Set Up for Analyses Using Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"

#### Set two contrasts - One for the Grand Mean and One for Group 2
c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

#### Estimate and Plot the Confidence Intervals for Each Contrast and the Difference Between Contrasts
estimateMeanComplex(OneWaySummary,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
plotMeanComplex(OneWaySummary,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

#### Change Confidence Level for the Intervals
estimateMeanComplex(OneWaySummary,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
plotMeanComplex(OneWaySummary,contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))
