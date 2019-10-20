
### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

FactorA <- c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)
FactorB <- c(1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,2)
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9,3,6,8,3)
FactorA <- factor(FactorA,levels=c(1,2),labels=c("A1","A2"))
FactorB <- factor(FactorB,levels=c(1,2),labels=c("B1","B2"))
FactorialData <- data.frame(FactorA,FactorB,Outcome)
FactorialData

### Examples

estimateMeansBy(Outcome~FactorA,by=FactorB)
estimateMeansBy(Outcome~FactorA,by=FactorB,conf.level=.99)

Comparison=factor(FactorA,c("A1","A2"))
estimateDifferenceBy(Outcome~Comparison,by=FactorB)

A1vsA2 <- c(-1,1)
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2)
estimateContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2,conf.level=.99)

testMeansBy(Outcome~FactorA,by=FactorB,mu=5)
testDifferenceBy(Outcome~Comparison,by=FactorB,mu=6)
A1vsA2 <- c(-1,1)
testContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2)

standardizeMeansBy(Outcome~FactorA,by=FactorB)
standardizeMeansBy(Outcome~FactorA,by=FactorB,mu=5,conf.level=.99)

Comparison=factor(FactorA,c("A1","A2"))
standardizeDifferenceBy(Outcome~Comparison,by=FactorB)
standardizeDifferenceBy(Outcome~Comparison,by=FactorB,mu=6,conf.level=.99)

A1vsA2 <- c(-1,1)
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2)
standardizeContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2,conf.level=.99)

plotMeansBy(Outcome~FactorA,by=FactorB)
plotMeansBy(Outcome~FactorA,by=FactorB,mu=5,conf.level=.99,rope=c(4,6))

Comparison=factor(FactorA,c("A2","A1"))
plotDifferenceBy(Outcome~Comparison,by=FactorB)
plotDifferenceBy(Outcome~Comparison,by=FactorB,conf.level=.99)

A1vsA2 <- c(-1,1)
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2)
plotContrastBy(Outcome~FactorA,by=FactorB,contrast=A1vsA2,conf.level=.99)
