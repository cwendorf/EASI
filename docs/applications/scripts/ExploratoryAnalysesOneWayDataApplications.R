# Estimation Approach to Statistical Inference
## Exploratory Analyses OneWay Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

#### Data Entry

Factor <- c(rep(1,100),rep(2,100),rep(3,100))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Group1","Group2","Group3"))
Group1 <- rnorm(100,10,2)
Group2 <- c(rnorm(50,7,1),rnorm(50,13,1))
Group3 <- c(rnorm(25,7,1),rnorm(75,11,1))
Outcome <- c(Group1,Group2,Group3)

#### Descriptive Statistics

(Outcome~Factor) |> describePercentiles()

### Standard Plots

#### Boxplots

(Outcome~Factor) |> plotBoxes()

#### Density Plots

(Outcome~Factor) |> plotDensity()

#### Data Plots

(Outcome~Factor) |> plotData()

### Advanced Plots

#### Violin Plots

(Outcome~Factor) |> plotBoxes(values=FALSE,main="Violin Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=0,type="full")

(Outcome~Factor) |> plotViolins(col=c("darkblue","darkred","darkgoldenrod"))

#### Bean Plots

(Outcome~Factor) |> plotDensity(type="full",offset=0,main="Bean Plots")
(Outcome~Factor) |> plotData(add=TRUE,offset=0,pch=95)

(Outcome~Factor) |> plotBeans(col=c("darkblue","darkred","darkgoldenrod"))

#### Raincloud Plots

(Outcome~Factor) |> plotBoxes(values=FALSE,main="Raincloud Plots")
(Outcome~Factor) |> plotDensity(add=TRUE,offset=.1)
(Outcome~Factor) |> plotData(add=TRUE,method="jitter",offset=-.15)

(Outcome~Factor) |> plotRainclouds(col=c("darkblue","darkred","darkgoldenrod"))

#### Combination Plots

(Outcome~Factor) |> plotBoxes(main="Combination Plots")
(Outcome~Factor) |> plotDensity(add=TRUE)
(Outcome~Factor) |> plotFrequencies(add=TRUE)
(Outcome~Factor) |> plotData(add=TRUE)

(Outcome~Factor) |> plotCombination(col=c("darkblue","darkred","darkgoldenrod"))
