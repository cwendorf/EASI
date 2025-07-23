# Estimation Approach to Statistical Inference
## OneWay Contrasts Data Application

Outcome1 <- rnorm(50, mean = 7, sd = 2.5)
Outcome2 <- rnorm(50, mean = 11, sd = 2.5)
Outcome3 <- rnorm(50, mean = 12, sd = 2.5)
RepeatedData <- construct(Outcome1, Outcome2, Outcome3)

### Analyses of a Comparison

(RepeatedData) |> focus(Outcome1, Outcome2) |> describePercentiles()
(RepeatedData) |> focus(Outcome1, Outcome2) |> estimateComparison(conf.level = .99)

comparisonTheme <- c("darkred", "darkblue", "black")
(RepeatedData) |> focus(Outcome1, Outcome2) |> plotComparison(main = "Data, Confidence Intervals, and a Plausibility Curve on the Difference", conf.level = .99, ylim = c(0, 20), values = FALSE, col = comparisonTheme)
(RepeatedData) |> focus(Outcome1, Outcome2) |> addPlausible(conf.level = .99, type = c("none", "none", "right"), col = comparisonTheme)
(RepeatedData) |> focus(Outcome1, Outcome2) |> addData(method = "jitter", col = comparisonTheme)
