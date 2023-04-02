# Estimation Approach to Statistical Inference
## Exploratory OneWay Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(100,10,2),0)
Level2 <- c(round(rnorm(50,7,1),0),round(rnorm(50,13,1),0))
Level3 <- c(round(rnorm(25,7,1),0),round(rnorm(75,11,1),0))
Outcome <- c(Level1,Level2,Level3)

### Violin Plots

(Outcome~Factor) |> plotBoxes(values=FALSE,main="Violin Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=0,type="full")

(Outcome~Factor) |> plotViolins(col=c("darkred","darkblue","darkgoldenrod"))

### Bean Plots

(Outcome~Factor) |> plotDensity(type="full",offset=0,main="Bean Plots")
(Outcome~Factor) |> plotData(add=TRUE,offset=0,pch=95,method="overplot")

(Outcome~Factor) |> plotBeans(col=c("darkred","darkblue","darkgoldenrod"))

### Raincloud Plots

(Outcome~Factor) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=.1)
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",offset=-.15)

(Outcome~Factor) |> plotRainclouds(col=c("darkred","darkblue","darkgoldenrod"))
