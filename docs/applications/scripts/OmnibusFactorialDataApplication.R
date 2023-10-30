# Estimation Approach to Statistical Inference
## Omnibus Factorial Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

FactorA <- c(rep(1, 30), rep(2, 30), rep(3, 30), rep(1, 30), rep(2, 30), rep(3, 30))
FactorB <- c(rep(1, 90), rep(2, 90))
FactorA <- factor(FactorA, levels = c(1, 2, 3), labels = c("A1", "A2", "A3"))
FactorB <- factor(FactorB, levels = c(1, 2), labels = c("B1", "B2"))
Outcome <- c(rnorm(30, mean = 8, sd = 2), rnorm(30, mean = 11, sd = 4), rnorm(30, mean = 12, sd = 4), rnorm(30, mean = 8, sd = 2), rnorm(30, mean = 8, sd = 3), rnorm(30, mean = 7, sd = 4))
FactorialData <- data.frame(FactorA, FactorB, Outcome)

### Analyses of the Means

(Outcome ~ FactorA) |> plotMeansMultifactor(by = FactorB, col = c("darkred", "darkblue"))
legend("topleft", inset = .01, box.lty = 0, pch = 16, legend = c("B1", "B2"), col = c("darkred", "darkblue"))

### Analyses of the Omnibus and Simple Effects

(Outcome ~ FactorA) |> describeMeansOmnibusMultifactor(by = FactorB)
(Outcome ~ FactorA) |> estimateMeansOmnibusMultifactor(by = FactorB)
(Outcome ~ FactorA) |> testMeansOmnibusMultifactor(by = FactorB)

(Outcome ~ FactorA) |> describeMeansOmnibusBy(by = FactorB)
(Outcome ~ FactorA) |> estimateMeansOmnibusBy(by = FactorB)
(Outcome ~ FactorA) |> testMeansOmnibusBy(by = FactorB)
