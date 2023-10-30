# Estimation Approach to Statistical Inference
## Exposition Oneway Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

OneWayData <- data.frame(
  Factor = rep(factor(c("Group 1", "Group 2", "Group 3")), each = 50),
  Outcome = c(
    round(rnorm(50, mean = 7, sd = 2), 0),
    round(rnorm(50, mean = 11, sd = 4), 0),
    round(rnorm(50, mean = 12, sd = 4), 0)
  )
)

### Using the Exposition Operator

with(OneWayData, estimateMeans(Outcome ~ Factor))

OneWayData %$>% (Outcome ~ Factor) |> estimateMeans()
OneWayData %$>% (Outcome ~ Factor) |> plotMeans()

### Advanced Uses of the Operator

OneWayData %$>% (Outcome ~ factor(Factor, c("Group 1", "Group 2"))) |> estimateMeanComparison()
OneWayData %$>% (Outcome ~ factor(Factor, c("Group 1", "Group 2"))) |> plotMeanComparison()
OneWayData %$>% (Outcome ~ factor(Factor, c("Group 1", "Group 2"))) |> estimateStandardizedMeanDifference()
