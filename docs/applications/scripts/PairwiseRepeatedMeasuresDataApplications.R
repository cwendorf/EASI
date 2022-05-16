# Estimation Approach to Statistical Inference
## Pairwise Repeated Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Descriptive Statistics

(RepeatedData) |> describeMeans()

### Analyses of Pairwise Comparisons

(RepeatedData) |> plotMeansPairwiseDiffogram(col=c("darkblue","darkred"))
(RepeatedData) |> plotMeansPairwise(line=0)

(RepeatedData) |> estimateMeansPairwise()
(RepeatedData) |> testMeansPairwise()
(RepeatedData) |> estimateStandardizedMeansPairwise()

### Analyses of Post Hoc Comparisons

(RepeatedData) |> plotMeansPosthocDiffogram(col=c("darkblue","darkred"))
(RepeatedData) |> plotMeansPosthoc(line=0)

(RepeatedData) |> estimateMeansPosthoc()
(RepeatedData) |> testMeansPairwise()
(RepeatedData) |> estimateStandardizedMeansPosthoc()
