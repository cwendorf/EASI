# Estimation Approach to Statistical Inference
## Analyze Meta Functions - One Way Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Analyze the Means

analyzeMeans(Outcome~Factor)
analyzeMeans(Outcome~Factor,conf.level=.99,mu=5)

### Analyze a Mean Difference

Comparison=factor(Factor,c("Level1","Level2"))
analyzeMeanDifference(Outcome~Comparison)
analyzeMeanDifference(Outcome~Comparison,conf.level=.99)

### Analyze a Mean Contrast

L1vsOthers <- c(-1,.5,.5)
analyzeMeanContrast(Outcome~Factor,contrast=L1vsOthers)
analyzeMeanContrast(Outcome~Factor,contrast=L1vsOthers,conf.level=.99)

### Analyze the Omnibus Effect

analyzeMeansOmnibus(Outcome~Factor)
analyzeMeansOmnibus(Outcome~Factor,conf.level=.99)

### Analyze Pairwise Comparisons

analyzeMeansPairwise(Outcome~Factor)
analyzeMeansPairwise(Outcome~Factor,conf.level=.99)
