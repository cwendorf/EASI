# EASI: Estimation Approach to Statistical Inference
## Summaries for the Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/summarizeExtension.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Summaries of Multiple Variables

summarizeData(Outcome1,Outcome2,Outcome3)

### Boxplots of Multiple Variables

plotData(Outcome1,Outcome2,Outcome3) # SummaryRepeated-Figure1.jpeg
plotData(Outcome1,Outcome2,Outcome3,method="stack",col="black") # SummaryRepeated-Figure2.jpeg
