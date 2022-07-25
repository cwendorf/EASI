# Estimation Approach to Statistical Inference
## Enhanced Plots Repeated Measures Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- rnorm(50,mean=7,sd=2.5)
Outcome2 <- rnorm(50,mean=11,sd=2.5)
Outcome3 <- rnorm(50,mean=12,sd=2.5)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Analyses of the Means

(RepeatedData) |> plotIntervals()

colorTheme <- c("darkred","darkblue","darkgoldenrod")
(RepeatedData) |> plotData(main="Data and Confidence Intervals",method="jitter",col=colorTheme)
(RepeatedData) |> plotIntervals(add=TRUE,values=FALSE,line=10,col=colorTheme)

### Analyses of a Comparison

ComparisonData <- data.frame(Outcome1,Outcome2)
(ComparisonData) |> plotIntervals(conf.level=.99)

comparisonTheme <- c("darkred","darkblue","black")
(ComparisonData) |> plotIntervals(main="Data, Confidence Intervals, and a Plausibility Curve",conf.level=.99,ylim=c(0,20),values=FALSE,col=comparisonTheme)
(ComparisonData) |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
(ComparisonData) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
