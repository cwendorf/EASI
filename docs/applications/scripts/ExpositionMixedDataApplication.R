# Estimation Approach to Statistical Inference
## Exposition Mixed Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,30),rep(2,30))
Outcome1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=2),0))
Outcome2 <- c(round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=8,sd=3),0))
Outcome3 <- c(round(rnorm(30,mean=12,sd=4),0),round(rnorm(30,mean=7,sd=4),0))
Factor <- factor(Factor,levels=c(1,2),labels=c("Level1","Level2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)

MixedB1 <- subset(MixedData,Factor=="Level1")
MixedB2 <- subset(MixedData,Factor=="Level2")

### Analyses of the Means

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Confidence Intervals and Data",ylim=c(-5,25),offset=-.05,method="overplot",col="darkblue")
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotData(add=TRUE,offset=.05,method="overplot",col="darkred")
(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans(add=TRUE,offset=-.15,col="darkblue",values=FALSE)
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> plotMeans(add=TRUE,offset=.15,col="darkred",values=FALSE)
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkblue","darkred"))

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans()

### Analyses of the Simple Effects

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibus()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> describeMeansOmnibus()

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> testMeansOmnibus()

(MixedB1) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibus()
(MixedB2) %$>% cbind(Outcome1,Outcome2,Outcome3) |> estimateMeansOmnibus()
