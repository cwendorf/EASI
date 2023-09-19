# Estimation Approach to Statistical Inference
## Analyze One Way Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)

### Analyze the Means

(Outcome~Factor) |> analyzeMeans()
(Outcome~Factor) |> analyzeMeans(conf.level=.99,mu=5)

### Analyze a Mean Difference

Comparison <- factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> analyzeMeanDifference()
(Outcome~Comparison) |> analyzeMeanDifference(conf.level=.99)

### Analyze a Mean Contrast

L1vsOthers <- c(-1,.5,.5)
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers)
(Outcome~Factor) |> analyzeMeanContrast(contrast=L1vsOthers,conf.level=.99)

### Analyze the Omnibus Effect

(Outcome~Factor) |> analyzeMeansOmnibus()
(Outcome~Factor) |> analyzeMeansOmnibus(conf.level=.99)

### Analyze Pairwise Comparisons

(Outcome~Factor) |> analyzeMeansPairwise()
(Outcome~Factor) |> analyzeMeansPairwise(conf.level=.99)
