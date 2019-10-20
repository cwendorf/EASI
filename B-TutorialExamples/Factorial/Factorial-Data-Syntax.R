# Estimation Approach to Statistical Inference (EASI)
## Between-Subjects Factorial Tutorial with Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

FactorA <- c(1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2)
FactorB <- c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3)
Outcome <- c(0,0,3,5,4,7,4,9,4,9,6,9,2,4,7,7,1,4,1,6,1,3,6,6)
FactorA <- factor(FactorA,levels=c(1,2),labels=c("A1","A2"))
FactorB <- factor(FactorB,levels=c(1,2,3),labels=c("B1","B2","B3"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

### Analyses of the Different Groups



### Analyses of the Marginal Means



### Analyses of the Factor A Main Effect



### Analyses of the Factor B Main Effect



### Analyses of B@A1 Simple Effect



### Analyses of B@A2 Simple Effect


