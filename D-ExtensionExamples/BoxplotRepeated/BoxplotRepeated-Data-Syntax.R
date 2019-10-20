# Estimation Approach to Statistical Inference (EASI)
## Boxplots for the Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/boxplotExtension.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)

WithinData <- data.frame(Outcome1,Outcome2,Outcome3)
WithinData

### Analyses of Multiple Variables

boxplotData(Outcome1,Outcome2,Outcome3) # BoxplotRepeated-Figure1.jpeg
boxplotData(Outcome1,Outcome2,Outcome3,method="stack",col="black") # BoxplotRepeated-Figure2.jpeg
