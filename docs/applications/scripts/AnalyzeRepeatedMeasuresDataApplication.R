# Estimation Approach to Statistical Inference
## Analyze Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Analyze the Means

(RepeatedData) |> analyzeMeans()
(RepeatedData) |> analyzeMeans(conf.level=.99,mu=5)

### Analyze a Mean Difference

cbind(Outcome1,Outcome2) |> analyzeMeanDifference()
cbind(Outcome1,Outcome2) |> analyzeMeanDifference(conf.level=.99)

### Analyze a Mean Contrast

O1vsOthers <- c(-1,.5,.5)
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers)
(RepeatedData) |> analyzeMeanContrast(contrast=O1vsOthers,conf.level=.99)

### Analyze the Omnibus Effect

(RepeatedData) |> analyzeMeansOmnibus()
(RepeatedData) |> analyzeMeansOmnibus(conf.level=.99)

### Analyze the Pairwise Comparisons

(RepeatedData) |> analyzeMeansPairwise()
(RepeatedData) |> analyzeMeansPairwise(conf.level=.99)
