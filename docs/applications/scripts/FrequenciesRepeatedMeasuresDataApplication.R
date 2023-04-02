# Estimation Approach to Statistical Inference
## Frequencies Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Data Plots

(RepeatedData) |> plotData(offset=0,method="overplot",connect=TRUE,col="darkblue")

### Frequency Distributions

(RepeatedData) |> describeFrequencies()

(RepeatedData) |> plotFrequencies(offset=0,col="darkblue")
