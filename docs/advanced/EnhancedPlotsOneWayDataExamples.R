# Estimation Approach to Statistical Inference
## Enhanced Plots with OneWay Data and Pipe Operators

### Source the EASI Package
#### Installable Package Available at https://github.com/cwendorf/EASI/

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")


### Example OneWay Data

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Outcome <- c(rnorm(50,mean=7,sd=2),rnorm(50,mean=11,sd=4),rnorm(50,mean=12,sd=4))


### Analyses of the Means

#### Create a Color Theme for the Means
colorTheme <- c("darkred","darkblue","darkgoldenrod")

#### Simple: Diamond Plot of the Confidence Interval
(Outcome~Factor) |> estimateMeans() |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
(Outcome~Factor) |> plotData(main="Data and Diamond Plots",offset=0,method="jitter",col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotDiamonds(add=TRUE,line=10,rope=c(8,12),col=colorTheme)

#### Simple: Confidence Intervals with Values
(Outcome~Factor) |> estimateMeans() |> plotIntervals()
#### Enhanced: Data and Confidence Intervals with Plausibility Curves
(Outcome~Factor) |> plotData(main="Data and Confidence Intervals with Plausibility Curves",offset=-.15,method="jitter",col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotIntervals(add=TRUE,values=FALSE,line=10,rope=c(8,12),col=colorTheme)
(Outcome~Factor) |> estimateMeans() |> plotPlausible(add=TRUE,col=colorTheme)


### Analyses of a Comparison

#### Create a Comparison and Its Color Theme
Comparison <- factor(Factor,c("Group1","Group2"))
comparisonTheme <- c("darkred","darkblue","black")

#### Simple: Diamond Plot of the Confidence Interval
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds()
#### Enhanced: Data and Diamond Plots
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotDiamonds(ylim=c(-5,25),rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,offset=0,method="jitter",col=comparisonTheme)

#### Simple: Confidence Intervals with Values
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotIntervals()
#### Enhanced: Data and Confidence Intervals with Plausibility Curves
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotIntervals(ylim=c(-5,25),values=FALSE,rope=c(-2,2),col=comparisonTheme)
(Outcome~Comparison) |> estimateMeanComparison(conf.level=.99) |> plotPlausible(add=TRUE,type=c("none","none","right"),col=comparisonTheme)
(Outcome~Comparison) |> plotData(add=TRUE,method="jitter",col=comparisonTheme)
