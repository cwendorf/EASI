# Estimation Approach to Statistical Inference
## Layers Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Using the "add" Functions

(RepeatedData) |> plotData() 
(RepeatedData) |> plotBoxes(add=TRUE)

(RepeatedData) |> plotData() 
(RepeatedData) |> addBoxes()

### Using Passthrough Abilities

(RepeatedData) |> plotData() |> addBoxes()
(RepeatedData) |> plotData(offset=0,method="jitter") |> addDiamonds()
(RepeatedData) |> plotPlausible(main="Confidence Intervals and Plausibilty Curves",offset=0) |> addIntervals(values=FALSE)
