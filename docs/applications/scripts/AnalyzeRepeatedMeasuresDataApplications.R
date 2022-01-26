# Estimation Approach to Statistical Inference
## Analyze Meta Functions - Repeated Measures Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Analyze the Means

analyzeMeans(RepeatedData)
analyzeMeans(RepeatedData,conf.level=.99,mu=5)

### Analyze a Mean Difference

analyzeMeanDifference(cbind(Outcome1,Outcome2))
analyzeMeanDifference(cbind(Outcome1,Outcome2),conf.level=.99)

### Analyze a Mean Contrast

O1vsOthers <- c(-1,.5,.5)
analyzeMeanContrast(RepeatedData,contrast=O1vsOthers)
analyzeMeanContrast(RepeatedData,contrast=O1vsOthers,conf.level=.99)

### Analyze the Omnibus Effect

analyzeMeansOmnibus(RepeatedData)
analyzeMeansOmnibus(RepeatedData,conf.level=.99)

### Analyze the Pairwise Comparisons

analyzeMeansPairwise(RepeatedData)
analyzeMeansPairwise(RepeatedData,conf.level=.99)
