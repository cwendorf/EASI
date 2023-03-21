# Estimation Approach to Statistical Inference
## Frequencies OneWay Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)

### Frequency Distributions

(Outcome~Factor) |> describeFrequencies()
(Outcome~Factor) |> plotFrequencies()

(Outcome~Factor) |> plotFrequencies(offset=0,col=c("darkblue","darkred","darkgoldenrod"))

### Percentiles and Boxes

(Outcome~Factor) |> describePercentiles()
(Outcome~Factor) |> describeBoxes()
(Outcome~Factor) |> plotBoxes()

(Outcome~Factor) |> plotBoxes(values=FALSE,offset=0,scale=3,col=c("darkblue","darkred","darkgoldenrod"))
