# Estimation Approach to Statistical Inference
## Pairwise Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <-c(61,64,72,64,64,70,73,65,65,72)
Outcome2 <- c(69,74,79,69,64,64,69,69,74,79)
Outcome3 <- c(70,75,80,80,70,65,70,75,70,70) 
Outcome4 <- c(70,80,85,75,70,65,75,75,85,80)
Outcome5 <- c(65,55,70,65,65,70,70,60,65,70)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3,Outcome4,Outcome5)

### Omnibus Analyses

(RepeatedData) |> describeMeans()
(RepeatedData) |> describeMeansOmnibus()
(RepeatedData) |> testMeansOmnibus()

### Analyses of Pairwise Comparisons

(RepeatedData) |> estimateMeansPairwise()
(RepeatedData) |> testMeansPairwise()
(RepeatedData) |> estimateStandardizedMeansPairwise()

(RepeatedData) |> plotMeansPairwise(line=0,values=FALSE)
(RepeatedData) |> plotMeansPairwiseDiffogram(col=c("darkblue","darkred"))

### Analyses of Post Hoc Comparisons

(RepeatedData) |> estimateMeansPosthoc()
(RepeatedData) |> testMeansPairwise()
(RepeatedData) |> estimateStandardizedMeansPosthoc()

(RepeatedData) |> plotMeansPosthoc(line=0,values=FALSE)
(RepeatedData) |> plotMeansPosthocDiffogram(col=c("darkblue","darkred"))
