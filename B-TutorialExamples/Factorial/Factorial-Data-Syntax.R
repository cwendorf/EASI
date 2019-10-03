# Estimation Approach to Statistical Inference (EASI)
## Factorial Between-Subjects Data Example

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

FactorA <- c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)
FactorB <- c(1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9,3,6,8,3)
FactorA <- factor(FactorA,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

### Analyses of the Different Groups



### Analyses of the Marginal Means



### Analyses of the Factor A Main Effect



### Analyses of the Factor B Main Effect



### Analyses of the Factor A x B Interaction


