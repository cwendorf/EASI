# Estimation Approach to Statistical Inference
## Contrasts Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Analyses of the Means

(RepeatedData) |> estimateMeans()
(RepeatedData) |> plotMeans()

colorTheme <- c("darkred","darkblue","darkgoldenrod")
(RepeatedData) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(RepeatedData) |> plotMeans(add=TRUE,values=FALSE,line=10,col=colorTheme)

### Analyses of a Comparison

ComparisonData <- data.frame(Outcome1,Outcome2)
(ComparisonData) |> estimateMeanComparison()
(ComparisonData) |> plotMeanComparison()

comparisonTheme <- c("darkred","darkblue","black")
(ComparisonData) |> plotMeanComparison(main="Data, Confidence Intervals, and a Plausibility Curve",ylim=c(0,20),values=FALSE,col=comparisonTheme)
(ComparisonData) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(ComparisonData) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)

### Analyses of a Mean Contrast

L1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> estimateMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))
(RepeatedData) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"))

contrastTheme <- c("darkred","darkblue","darkblue")
par(mfrow=c(1,2))
(RepeatedData) |> plotMeans(col=contrastTheme,ylim=c(0,20),values=FALSE,main="")
(RepeatedData) |> plotData(add=TRUE,col=contrastTheme)
(RepeatedData) |> plotMeanSubsets(contrast=L1vsOthers,labels=c("Level1","Others"),col=comparisonTheme,ylim=c(0,20),ylab="",values=FALSE,main="")
(RepeatedData) |> plotPlausible(contrast=L1vsOthers,add=TRUE,type=c("none","none","right"),col=comparisonTheme)
par(mfrow=c(1,1))
