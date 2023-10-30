# Estimation Approach to Statistical Inference
## Pairwise OneWay Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1, 10), rep(2, 10), rep(3, 10), rep(4, 10), rep(5, 10))
Outcome <- c(61, 64, 72, 64, 64, 70, 73, 65, 65, 72, 69, 74, 79, 69, 64, 64, 69, 69, 74, 79, 70, 75, 80, 80, 70, 65, 70, 75, 70, 70, 70, 80, 85, 75, 70, 65, 75, 75, 85, 80, 65, 55, 70, 65, 65, 70, 70, 60, 65, 70)
Factor <- factor(Factor, levels = c(1, 2, 3, 4, 5), labels = c("Level1", "Level2", "Level3", "Level4", "Level5"))

### Omnibus Analyses

(Outcome ~ Factor) |> describeMeans()
(Outcome ~ Factor) |> describeMeansOmnibus()
(Outcome ~ Factor) |> testMeansOmnibus()

### Analyses of Pairwise Comparisons

(Outcome ~ Factor) |> estimateMeansPairwise()
(Outcome ~ Factor) |> testMeansPairwise()
(Outcome ~ Factor) |> estimateStandardizedMeansPairwise()

(Outcome ~ Factor) |> plotMeansPairwise(line = 0, values = FALSE)
(Outcome ~ Factor) |> plotMeansPairwiseDiffogram(col = c("darkblue", "darkred"))

### Analyses of Post Hoc Comparisons

(Outcome ~ Factor) |> estimateMeansPosthoc()
(Outcome ~ Factor) |> testMeansPairwise()
(Outcome ~ Factor) |> estimateStandardizedMeansPosthoc()

(Outcome ~ Factor) |> plotMeansPosthoc(line = 0, values = FALSE)
(Outcome ~ Factor) |> plotMeansPosthocDiffogram(col = c("darkblue", "darkred"))
