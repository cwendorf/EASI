# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated Measures (Within-Subjects) Tutorial with Data

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Relational Intervals

estimateRelational(Outcome1,Outcome2,Outcome3)

plotMeans(Outcome1,Outcome2,Outcome3)
addRelational(Outcome1,Outcome2,Outcome3)

plotRelational(Outcome1,Outcome2,Outcome3)
plotRelational(Outcome1,Outcome2,Outcome3,conf.level=.99,mu=5)
