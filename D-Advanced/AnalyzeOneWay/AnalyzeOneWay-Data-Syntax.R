# Estimation Approach to Statistical Inference
## Analyze - OneWay (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Analyze-Extension.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
OneWayData

### Analyses of Multiple Groups

analyzeMeans(Outcome~Factor) # Includes AnalyzeOneWay-Figure1.jpeg
analyzeMeans(Outcome~Factor,mu=5,conf.level=.99,rope=c(3,7)) # Includes AnalyzeOneWay-Figure2.jpeg

### Analyses of a Group Comparison

Comparison=factor(Factor,c("Level1","Level2"))
analyzeDifference(Outcome~Comparison) # Includes AnalyzeOneWay-Figure3.jpeg
analyzeDifference(Outcome~Comparison,mu=-2,conf.level=.99,rope=c(-2,2)) # Includes AnalyzeOneWay-Figure4.jpeg

### Analyses of a Group Contrast

L1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome~Factor,contrast=L1vsOthers) # Includes AnalyzeOneWay-Figure5.jpeg
analyzeContrast(Outcome~Factor,contrast=L1vsOthers,mu=4,conf.level=.99,rope=c(-2,2)) # Includes AnalyzeOneWay-Figure6.jpeg
