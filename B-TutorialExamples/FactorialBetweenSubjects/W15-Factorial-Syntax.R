# Statistics for Psychologists
## Factorial ANOVA
### Lecture Example

### Read Data

FactorialData <- read.csv("W15-Factorial-Data.csv")
attach(FactorialData)
FactorA <- factor(FactorA,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorialData

### Create Data

FactorA <- c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)
FactorB <- c(1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9,3,6,8,3)
FactorA <- factor(FactorA,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("Level 1","Level 2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

### Conduct Analyses

Results <- aov(Outcome~FactorA*FactorB)
summary(Results)
model.tables(Results,"means")
boxplot(Outcome~FactorA*FactorB)
