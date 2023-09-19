# Estimation Approach to Statistical Inference
## Omnibus Mixed Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

### Analyses of the Means

cbind(Outcome1,Outcome2,Outcome3) |> plotMeansMultifactor(by=Factor,col=c("darkred","darkblue"))
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("Level1","Level2"),col=c("darkred","darkblue"))

### Analyses of the Omnibus and Simple Effects

cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusMultifactor(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusMultifactor(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusMultifactor(by=Factor)

cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibusBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibusBy(by=Factor)
cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibusBy(by=Factor)
