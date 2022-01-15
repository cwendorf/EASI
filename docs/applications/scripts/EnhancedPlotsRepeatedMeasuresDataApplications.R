# Estimation Approach to Statistical Inference
## Enhanced Plots Repeated Measures Data Applications

### Package Loading

#### Source all of the EASI functions
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Set up for analyses of the raw data
Outcome1 <- rnorm(50,mean=7,sd=2.5)
Outcome2 <- rnorm(50,mean=11,sd=2.5)
Outcome3 <- rnorm(50,mean=12,sd=2.5)

### Analyses of the Means

#### Create a color theme for the mean plots
colorTheme <- c("darkred","darkblue","darkgoldenrod")

#### Simple: Diamond Plots of the Confidence Interval
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)

#### Simple: Confidence Intervals
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotIntervals()
#### Enhanced: Data and Confidence Intervals with Plausibility Curves
cbind(Outcome1,Outcome2,Outcome3) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
cbind(Outcome1,Outcome2,Outcome3) |> estimateMeans() |> plotPlausible(add=TRUE,col=colorTheme)

### Analyses of a Comparison

#### Create a comparison color theme
comparisonTheme <- c("darkred","darkblue","black")

#### Simple: Diamond Plots of the Confidence Interval
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds(ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)

#### Simple: Confidence Intervals
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotIntervals()
#### Enhanced: Data and Confidence Intervals with Plausibility Curves
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotIntervals(ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> estimateMeanComparison(conf.level=.99) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
cbind(Outcome1,Outcome2) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
