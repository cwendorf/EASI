# Estimation Approach to Statistical Inference
## Themes Repeated Data Application

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <-c(61,64,72,64,64,70,73,65,65,72)
Outcome2 <- c(69,74,79,69,64,64,69,69,74,79)
Outcome3 <- c(70,75,80,80,70,65,70,75,70,70)
Outcome4 <- c(70,80,85,75,70,65,75,75,85,80)
Outcome5 <- c(65,55,70,65,65,70,70,60,65,70)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3,Outcome4,Outcome5)

### Analyses of the Means

(RepeatedData) |> plotMeans(col="darkblue")
(RepeatedData) |> plotMeans(col=c("darkred","darkblue","darkgoldenrod","darkgreen","darkviolet"))

(RepeatedData) |> plotMeans(col=theme("muted"))
(RepeatedData) |> plotMeans(col=theme("muted","main"))

### Analyses of a Comparison

ComparisonData <- cbind(Outcome1,Outcome2)
(ComparisonData) |> plotMeanComparison(col=c("red3","blue3","black"))
(ComparisonData) |> plotPlausible(col=c("red3","blue3","black"),add=TRUE)

(ComparisonData) |> plotMeanComparison(col=theme("vibrant","comp"))
(ComparisonData) |> plotPlausible(col=theme("vibrant","comp"),add=TRUE)
