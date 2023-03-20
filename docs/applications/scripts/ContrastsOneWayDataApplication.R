# Estimation Approach to Statistical Inference
## Contrasts OneWay Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- round(rnorm(50,mean=7,sd=2),0)
Group2 <- round(rnorm(50,mean=11,sd=4),0)
Group3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Group1,Group2,Group3)

### Analyses of the Means

(Outcome~Factor) |> estimateMeans()
(Outcome~Factor) |> plotMeans()

colorTheme <- c("darkred","darkblue","darkgoldenrod")
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(Outcome~Factor) |> plotMeans(add=TRUE,values=FALSE,line=10,col=colorTheme)

### Analyses of a Comparison

Comparison <- factor(Factor,c("Group1","Group2"))
(Outcome~Comparison) |> estimateMeanComparison()
(Outcome~Comparison) |> plotMeanComparison()

comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Comparison) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(Outcome~Comparison) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)

### Analyses of a Mean Contrast

L1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> estimateMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))
(Outcome~Factor) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))

contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2))
(Outcome~Factor) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(Outcome~Factor) |> plotData(add=TRUE,col=contrastTheme)
(Outcome~Factor) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(Outcome~Factor) |> plotPlausible(contrast=L1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
par(mfrow=c(1,1))
