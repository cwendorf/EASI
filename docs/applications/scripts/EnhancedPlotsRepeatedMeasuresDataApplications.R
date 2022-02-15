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

colorTheme <- c("darkred","darkblue","darkgoldenrod")

#### Diamond Plots

RepeatedData |> plotDiamonds()

RepeatedData |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
RepeatedData |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)

#### Confidence Interval Plots

RepeatedData |> plotIntervals()

RepeatedData |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
RepeatedData |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
RepeatedData |> plotPlausible(add=TRUE,col=colorTheme)

### Analyses of a Comparison

ComparisonData <- data.frame(Outcome1,Outcome2)
comparisonTheme <- c("darkred","darkblue","black")

#### Diamond Plots

ComparisonData |> plotDiamonds(conf.level=.99)

ComparisonData |> plotDiamonds(main="Data and Diamond Plots",conf.level=.99,ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
ComparisonData |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)

#### Confidence Interval Plots

ComparisonData |> plotIntervals(conf.level=.99)

ComparisonData |> plotIntervals(main="Data and Confidence Intervals with Plausibility Curves",conf.level=.99,ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
ComparisonData |> plotPlausible(add=TRUE,conf.level=.99,type=c("none","none","right"),col=comparisonTheme)
ComparisonData |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
