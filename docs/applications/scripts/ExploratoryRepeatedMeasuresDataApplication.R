# Estimation Approach to Statistical Inference
## Exploratory Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(100,10,2),0)
Outcome2 <- c(round(rnorm(50,7,1),0),round(rnorm(50,13,1),0))
Outcome3 <- c(round(rnorm(25,7,1),0),round(rnorm(75,11,1),0))
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Violin Plots

(RepeatedData) |> plotBoxes(values=FALSE,main="Violin Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=0,type="full")

(RepeatedData) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))

### Bean Plots

(RepeatedData) |> plotDensity(type="full",offset=0,main="Bean Plots")
(RepeatedData) |> plotData(add=TRUE,offset=0,pch=95,method="overplot")

(RepeatedData) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))

### Raincloud Plots

(RepeatedData) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(RepeatedData) |> plotDensity(add=TRUE,offset=.1)
(RepeatedData) |> plotData(add=TRUE,method="jitter",offset=-.15)

(RepeatedData) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))
