# Estimation Approach to Statistical Inference
## Summarize - OneWay (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Summarize-Extension.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))

OneWayData <- data.frame(Factor,Outcome)
OneWayData

### Summaries of Multiple Groups

summarizeData(Outcome~Factor)

### Boxplots of Multiple Groups

plotBoxes(Outcome~Factor) # SummarizeOneWay-Figure1.jpeg
addData(Outcome~Factor,method="stack") # SummarizeOneWay-Figure2.jpg
