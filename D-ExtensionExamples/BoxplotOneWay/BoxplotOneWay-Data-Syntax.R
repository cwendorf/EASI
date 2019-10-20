# Estimation Approach to Statistical Inference (EASI)
## Boxplots for the OneWay (Between-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/boxplotExtension.R")

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))

BetweenData <- data.frame(Factor,Outcome)
BetweenData

### Analyses of Multiple Groups

boxplotData(Outcome~Factor) # BoxplotOneWay-Figure1.jpeg
boxplotData(Outcome~Factor,method="stack",col="black") # BoxplotOneWay-Figure2.jpeg
