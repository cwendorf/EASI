# Estimation Approach to Statistical Inference
## Exploratory Analyses Repeated Measures Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Data Entry

Outcome1 <- rnorm(100,10,2)
Outcome2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Outcome3 <- c(rnorm(25,7,1),rnorm(75,11,1))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

#### Descriptive Statistics

describePercentiles(RepeatedData)

### Standard Plots

#### Boxplots
plotBoxes(RepeatedData)

#### Density Plots
plotDensity(RepeatedData)

#### Data Plots
plotData(RepeatedData)

### Advanced Plots

#### Violin Plots

plotBoxes(RepeatedData,values=FALSE,main="Violin Plots")
plotDensity(RepeatedData,add=TRUE,offset=0,type="full")

plotViolins(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))

#### Bean Plots

plotDensity(RepeatedData,type="full",offset=0,main="Bean Plots")
plotData(RepeatedData,add=TRUE,offset=0,pch=95)

plotBeans(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))

#### Raincloud Plots

plotBoxes(RepeatedData,values=FALSE,main="Raincloud Plots")
plotDensity(RepeatedData,add=TRUE,offset=.1)
plotData(RepeatedData,add=TRUE,method="jitter",offset=-.15)

plotRainclouds(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))

#### Combination Plots

plotBoxes(RepeatedData,main="Combination Plots")
plotDensity(RepeatedData,add=TRUE)
plotFrequencies(RepeatedData,add=TRUE)
plotData(RepeatedData,add=TRUE)

plotCombination(RepeatedData,col=c("darkblue","darkred","darkgoldenrod"))
