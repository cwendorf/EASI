# Estimation Approach to Statistical Inference
## Pairwise OneWay Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Descriptive Statistics

(Outcome~Factor) |> describeMeans()

### Analyses of Pairwise Comparisons

(Outcome~Factor) |> plotMeansPairwiseDiffogram(col=c("darkblue","darkred"))
(Outcome~Factor) |> plotMeansPairwise(line=0)

(Outcome~Factor) |> estimateMeansPairwise()
(Outcome~Factor) |> testMeansPairwise()
(Outcome~Factor) |> estimateStandardizedMeansPairwise()

### Analyses of Post Hoc Comparisons

(Outcome~Factor) |> plotMeansPosthocDiffogram(col=c("darkblue","darkred"))
(Outcome~Factor) |> plotMeansPosthoc(line=0)

(Outcome~Factor) |> estimateMeansPosthoc()
(Outcome~Factor) |> testMeansPairwise()
(Outcome~Factor) |> estimateStandardizedMeansPosthoc()
