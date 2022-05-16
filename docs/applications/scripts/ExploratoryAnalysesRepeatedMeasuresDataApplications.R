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

(RepeatedData) |> describePercentiles()

### Standard Plots

#### Boxplots
(RepeatedData) |> plotBoxes()

#### Density Plots
(RepeatedData) |> plotDensity()

#### Data Plots
(RepeatedData) |> plotData()

### Advanced Plots

#### Violin Plots

(RepeatedData) |> plotBoxes(values=FALSE,main="Violin Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=0,type="full")

(RepeatedData) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))

#### Bean Plots

(RepeatedData) |> plotDensity(type="full",offset=0,main="Bean Plots")
(RepeatedData) |> plotData(add=TRUE,offset=0,pch=95)

(RepeatedData) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))

#### Raincloud Plots

(RepeatedData) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=.1)
(RepeatedData) |> plotData(add=TRUE,method="jitter",offset=-.15)

(RepeatedData) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))

#### Combination Plots

(RepeatedData) |> plotBoxes(main="Combination Plots")
(RepeatedData) |> plotDensity(add=TRUE)
(RepeatedData) |> plotFrequencies(add=TRUE)
(RepeatedData) |> plotData(add=TRUE)

(RepeatedData) |> plotCombination(col=c("darkblue","darkred","darkgoldenrod"))
