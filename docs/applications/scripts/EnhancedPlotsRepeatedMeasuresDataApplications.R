# Estimation Approach to Statistical Inference
## Enhanced Plots Repeated Measures Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- rnorm(50,mean=7,sd=2.5)
Outcome2 <- rnorm(50,mean=11,sd=2.5)
Outcome3 <- rnorm(50,mean=12,sd=2.5)

### Analyses of the Means

colorTheme <- c("darkred","darkblue","darkgoldenrod")

#### Diamond Plots

cbind(Outcome1,Outcome2,Outcome3) |> plotDiamonds()

cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)

#### Confidence Interval Plots

cbind(Outcome1,Outcome2,Outcome3) |> plotIntervals()

cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> plotPlausible(add=TRUE,col=colorTheme)

### Analyses of a Comparison

comparisonTheme <- c("darkred","darkblue","black")

#### Diamond Plots

cbind(Outcome1,Outcome2) |> plotDiamonds(conf.level=.99)

cbind(Outcome1,Outcome2) |> plotDiamonds(main="Data and Diamond Plots",conf.level=.99,ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)

#### Confidence Interval Plots

cbind(Outcome1,Outcome2) |> plotIntervals(conf.level=.99)

cbind(Outcome1,Outcome2) |> plotIntervals(main="Data and Confidence Intervals with Plausibility Curves",conf.level=.99,ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
