# Estimation Approach to Statistical Inference
## Layers One Way Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)

### Using the "add" Functions

(Outcome~Factor) |> plotData()
(Outcome~Factor) |> plotBoxes(add=TRUE)

(Outcome~Factor) |> plotData()
(Outcome~Factor) |> addBoxes()

### Using Passthrough Abilities

(Outcome~Factor) |> plotData() |> addBoxes()
(Outcome~Factor) |> plotData(offset=0,method="jitter") |> addDiamonds()
(Outcome~Factor) |> plotPlausible(main="Confidence Intervals and Plausibilty Curves",offset=0) |> addIntervals(values=FALSE)
