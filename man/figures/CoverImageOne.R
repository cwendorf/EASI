# Estimation Approach to Statistical Inference
## Independent Groups Data Tutorial

Factor <- c(rep(1, 4), rep(2, 4))
Outcome <- c(0, 0, 3, 5, 4, 7, 4, 9)
Factor <- factor(Factor, levels = c(1, 2), labels = c("Level1", "Level2"))
IndependentData <- construct(Factor, Outcome)

#### Confidence Intervals

(Outcome ~ Factor) |> estimateMeans()
(Outcome ~ Factor) |> estimateDifference()
(Outcome ~ Factor) |> testDifference()
(Outcome ~ Factor) |> standardizeDifference()
(Outcome ~ Factor) |> plotComparison()
