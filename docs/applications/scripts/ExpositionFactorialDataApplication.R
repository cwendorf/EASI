# Estimation Approach to Statistical Inference
## Exposition Factorial Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

FactorA <- c(rep(1,30),rep(2,30),rep(3,30),rep(1,30),rep(2,30),rep(3,30))
FactorB <- c(rep(1,90),rep(2,90))
FactorA <- factor(FactorA,levels=c(1,2,3),labels=c("A1","A2","A3"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
Group1 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=11,sd=4),0),round(rnorm(30,mean=12,sd=4),0))
Group2 <- c(round(rnorm(30,mean=8,sd=2),0),round(rnorm(30,mean=8,sd=3),0),round(rnorm(30,mean=7,sd=4),0))
Outcome <- c(Group1,Group2)
FactorialData <- data.frame(FactorA,FactorB,Outcome)

FactorialB1 <- subset(FactorialData,FactorB=="B1")
FactorialB2 <- subset(FactorialData,FactorB=="B2")

### Analyses of the Means

(FactorialB1) %$>% (Outcome~FactorA) |> plotData(main="Confidence Intervals and Data",ylim=c(-5,25),offset=-.05,method="overplot",col="darkblue")
(FactorialB2) %$>% (Outcome~FactorA) |> plotData(add=TRUE,offset=.05,method="overplot",col="darkred")
(FactorialB1) %$>% (Outcome~FactorA) |> plotMeans(add=TRUE,offset=-.15,col="darkblue",values=FALSE)
(FactorialB2) %$>% (Outcome~FactorA) |> plotMeans(add=TRUE,offset=.15,col="darkred",values=FALSE)
legend("topleft",inset=.01,box.lty=0,pch=16,legend=c("B1","B2"),col=c("darkblue","darkred"))

(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeans()
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeans()

### Analyses of the Simple Effects

(FactorialB1) %$>% (Outcome~FactorA) |> describeMeansOmnibus()
(FactorialB2) %$>% (Outcome~FactorA) |> describeMeansOmnibus()

(FactorialB1) %$>% (Outcome~FactorA) |> testMeansOmnibus()
(FactorialB2) %$>% (Outcome~FactorA) |> testMeansOmnibus()

(FactorialB1) %$>% (Outcome~FactorA) |> estimateMeansOmnibus()
(FactorialB2) %$>% (Outcome~FactorA) |> estimateMeansOmnibus()
