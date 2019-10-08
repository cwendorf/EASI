# Estimation Approach to Statistical Inference (EASI)
## Mixed Design Example with Tutorial Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,4,7,4,9)
Outcome2 <- c(4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2),labels=c("Level 1","Level 2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2)
MixedData

### Analyses of the Different Groups



### Analyses of the Marginal Means



### Analyses of the Factor A Main Effect


