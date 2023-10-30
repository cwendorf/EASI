# Estimation Approach to Statistical Inference
## Complex Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(50, mean = 7, sd = 2), 0)
Outcome2 <- round(rnorm(50, mean = 11, sd = 4), 0)
Outcome3 <- round(rnorm(50, mean = 12, sd = 4), 0)
RepeatedData <- data.frame(Outcome1, Outcome2, Outcome3)

### Analyses of a Complex Mean Contrast

(RepeatedData) |> estimateMeans()
(RepeatedData) |> plotMeans()

O1vsGrand <- c(.6667, -.3333, -.3333)
(RepeatedData) |> estimateMeanContrast(contrast = O1vsGrand)
(RepeatedData) |> plotMeanContrast(contrast = O1vsGrand)

### Analysis of a Difference Between Two Contrasts

GrandMean <- c(1/3, 1/3, 1/3)
O1Only <- c(1, 0, 0)

(RepeatedData) |> estimateMeanComplex(contrast1 = GrandMean, contrast2 = O1Only, labels = c("GrandMean", "O1Only"))
(RepeatedData) |> plotMeanComplex(contrast1 = GrandMean, contrast2 = O1Only, labels = c("GrandMean", "O1Only"))

comparisonTheme <- c("darkred", "darkblue", "black")
(RepeatedData) |> plotMeanComplex(contrast1 = GrandMean, contrast2 = O1Only, labels = c("GrandMean", "O1Only"), values = FALSE, col = comparisonTheme)
