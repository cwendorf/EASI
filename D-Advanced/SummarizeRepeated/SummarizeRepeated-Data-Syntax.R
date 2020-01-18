# Estimation Approach to Statistical Inference
## Summarize - Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Summarize-Extension.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Summaries of Multiple Variables

summarizeData(Outcome1,Outcome2,Outcome3)

### Boxplots of Multiple Variables

plotData(Outcome1,Outcome2,Outcome3) # SummarizeRepeated-Figure1.jpeg
plotData(Outcome1,Outcome2,Outcome3,method="stack",col="black") # SummarizeRepeated-Figure2.jpeg
