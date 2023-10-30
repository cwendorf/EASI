# Estimation Approach to Statistical Inference
## By Factorial Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

FactorA <- c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3)
FactorB <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)
Outcome <- c(0, 0, 3, 5, 4, 7, 4, 9, 4, 9, 6, 9, 3, 1, 6, 6, 2, 2, 5, 7, 2, 4, 7, 7)
FactorA <- factor(FactorA, levels = c(1, 2, 3), labels = c("A1", "A2", "A3"))
FactorB <- factor(FactorB, levels = c(1, 2), labels = c("B1", "B2"))
FactorialData <- data.frame(FactorA, FactorB, Outcome)

### Descriptive Statistics

(Outcome ~ FactorA) |> describeMeansBy(by = FactorB)

### Analyses of the Means

(Outcome ~ FactorA) |> estimateMeansBy(by = FactorB)
(Outcome ~ FactorA) |> plotMeansBy(by = FactorB)
(Outcome ~ FactorA) |> testMeansBy(by = FactorB)
(Outcome ~ FactorA) |> estimateStandardizedMeansBy(by = FactorB)

### Analyses of a Comparison

Comparison <- factor(Factor, c("A1", "A2"))
(Outcome ~ FactorA) |> estimateMeanDifferenceBy(by = FactorB)
(Outcome ~ FactorA) |> plotMeanDifferenceBy(by = FactorB)
(Outcome ~ FactorA) |> testMeanDifferenceBy(by = FactorB)
(Outcome ~ FactorA) |> estimateStandardizedMeanDifferenceBy(by = FactorB)

### Analyses of a Contrast

L1vsOthers <- c(-1, .5, .5)
(Outcome ~ FactorA) |> estimateMeanContrastBy(by = FactorB, contrast = L1vsOthers)
(Outcome ~ FactorA) |> plotMeanContrastBy(by = FactorB, contrast = L1vsOthers)
(Outcome ~ FactorA) |> testMeanContrastBy(by = FactorB, contrast = L1vsOthers)
(Outcome ~ FactorA) |> estimateStandardizedMeanContrastBy(by = FactorB, contrast = L1vsOthers)
