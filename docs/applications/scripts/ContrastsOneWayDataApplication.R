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

customTheme <- c("darkred","darkblue","darkgoldenrod")
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals",method="jitter",col=customTheme)
(Outcome~Factor) |> plotMeans(add=TRUE,values=FALSE,line=10,col=customTheme)

### Analyses of a Comparison

Comparison <- factor(Factor,c("Group1","Group2"))
(Outcome~Comparison) |> estimateMeanComparison()
(Outcome~Comparison) |> plotMeanComparison()

comparisonTheme <- c("darkred","darkblue","black")
(Outcome~Comparison) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(Outcome~Comparison) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)

### Analyses of a Mean Contrast

G1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> estimateMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"))

contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2),mar=c(1,1,1,0))
(Outcome~Factor) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",col=contrastTheme)
(Outcome~Factor) |> plotMeanSubsets(contrast=G1vsOthers,labels=c("Group1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(Outcome~Factor) |> plotPlausible(contrast=G1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
