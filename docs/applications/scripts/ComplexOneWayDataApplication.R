# Estimation Approach to Statistical Inference
## Complex One Way Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)

### Analyses of a Complex Mean Contrast

(Outcome~Factor) |> estimateMeans()
(Outcome~Factor) |> plotMeans()

L1vsGrand <- c(.6667,-.3333,-.3333)
(Outcome~Factor) |> estimateMeanContrast(contrast=L1vsGrand)
(Outcome~Factor) |> plotMeanContrast(contrast=L1vsGrand)

### Analysis of a Difference Between Two Contrasts

GrandMean <- c(1/3,1/3,1/3)
L1Only <- c(1,0,0)

(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))

comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Factor) |> estimateMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"))
(Outcome~Factor) |> plotMeanComplex(contrast1=GrandMean,contrast2=L1Only,labels=c("GrandMean","L1Only"),values=FALSE,col=comparisonTheme)
