# Estimation Approach to Statistical Inference
## Theme OneWay Data Application

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("Level1","Level2","Level3","Level4","Level5"))

### Analyses of the Means

(Outcome~Factor) |> plotMeans(col="darkblue")
(Outcome~Factor) |> plotMeans(col=c("darkred","darkblue","darkgoldenrod","darkgreen","darkviolet"))

(Outcome~Factor) |> plotMeans(col=theme("muted"))
(Outcome~Factor) |> plotMeans(col=theme("muted","main"))

### Analyses of a Comparison

Comparison <- factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> plotMeanComparison(col=c("darkred","darkblue","black"))
(Outcome~Comparison) |> plotPlausible(col=c("darkred","darkblue","black"),add=TRUE)

(Outcome~Comparison) |> plotMeanComparison(col=theme("vibrant","comp"))
(Outcome~Comparison) |> plotPlausible(col=theme("vibrant","comp"),add=TRUE)
