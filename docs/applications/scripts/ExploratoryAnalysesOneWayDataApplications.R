# Estimation Approach to Statistical Inference
## Exploratory Analyses OneWay Data Applications

### Package Loading

#### Source all of the EASI functions
source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Set up for analyses of the raw data
Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- rnorm(100,10,2)
Group2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Group3 <- c(rnorm(25,7,1),rnorm(75,11,1))
Outcome <- c(Group1,Group2,Group3)

### Standard Plots

#### Boxplots
plotBoxes(Outcome~Factor)

#### Density Plots
plotDensity(Outcome~Factor)

#### Data Plots
plotData(Outcome~Factor)

### Advanced Plots

#### Violin Plots: Stacked and Modified Plots
plotBoxes(Outcome~Factor,values=FALSE,main="Violin Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=0,type="full")
#### Violin Plots: Automated and Extended Plots
plotViolins(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))

#### Bean Plots: Stacked and Modified Plots
plotDensity(Outcome~Factor,type="full",offset=0,main="Bean Plots")
plotData(Outcome~Factor,add=TRUE,offset=0,pch=95)
#### Bean Plots: Automated and Extended Plots
plotBeans(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))

#### Raincloud Plots: Stacked and Modified Plots
plotBoxes(Outcome~Factor,values=FALSE,main="Raincloud Plots")
plotDensity(Outcome~Factor,add=TRUE,offset=.1)
plotData(Outcome~Factor,add=TRUE,method="jitter",offset=-.15)
#### Raincloud Plots: Automated and Extended Plots
plotRainclouds(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))

#### Combination Plots: Stacked and Modified Plots
plotBoxes(Outcome~Factor,main="Combination Plots")
plotDensity(Outcome~Factor,add=TRUE)
plotFrequencies(Outcome~Factor,add=TRUE)
plotData(Outcome~Factor,add=TRUE)
#### Combination Plots: Automated and Extended Plots
plotCombination(Outcome~Factor,col=c("darkblue","darkred","darkgoldenrod"))
