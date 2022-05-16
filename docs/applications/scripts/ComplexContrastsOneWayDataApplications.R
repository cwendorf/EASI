# Estimation Approach to Statistical Inference
## Complex Contrasts One Way Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Analyses of a Complex Mean Contrast

c1=c(1/3,1/3,1/3)
c2=c(0,1,0)

(Outcome~Factor) |> estimateMeanComplex(contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))
(Outcome~Factor) |> plotMeanComplex(contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"))

(Outcome~Factor) |> estimateMeanComplex(contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99)
(Outcome~Factor) |> plotMeanComplex(contrast1=c1,contrast2=c2,labels=c("GrandMean","Level2"),conf.level=.99,rope=c(-2,2))
