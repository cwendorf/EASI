# Estimation Approach to Statistical Inference
## Enhanced Plots OneWay Data Applications

### Package Loading

#### Source all of the EASI functions
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Set up for analyses of the raw data
Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Outcome <- c(rnorm(50,mean=7,sd=2),rnorm(50,mean=11,sd=4),rnorm(50,mean=12,sd=4))

### Analyses of the Means

#### Create a color theme for the mean plots
colorTheme <- c("darkred","darkblue","darkgoldenrod")

#### Simple: Diamond Plots of the Confidence Intervals
(Outcome~Factor) |> estimateMeans() |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
(Outcome~Factor) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)

#### Simple plot: Confidence Intervals
(Outcome~Factor) |> estimateMeans() |> plotIntervals()
#### Enhanced plot: Data and Confidence Intervals with Plausibility Curves
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotPlausible(add=TRUE,col=colorTheme)

### Analyses of a Comparison

#### Create a comparison and its color theme
Comparison <- factor(Factor,c("Group1","Group2"))
comparisonTheme <- c("darkred","darkblue","black")

#### Simple: Diamond Plots of the Confidence Intervals
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds(ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)

#### Simple: Confidence Intervals
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotIntervals()
#### Enhanced: Data and Confidence Intervals with Plausibility Curves
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotIntervals(ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
