# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated Measures (Within-Subjects) Example with Wendorf Data

### Enter Data

L1 <- c(61,64,72,64,64,70,73,65,65,72)
L2 <- c(69,74,79,69,64,64,69,69,74,79)
L3 <- c(70,75,80,80,70,65,70,75,70,70)
L4 <- c(70,80,85,75,70,65,75,75,85,80)
L5 <- c(65,55,70,65,65,70,70,60,65,70)
RelationalRepeatedData <- data.frame(L1,L2,L3,L4,L5)
RelationalRepeatedData

### Relational Intervals

estimateRelational(L1,L2,L3,L4,L5)

plotMeans(L1,L2,L3,L4,L5)
addRelational(L1,L2,L3,L4,L5)
addData(L1,L2,L3,L4,L5)

plotRelational(L1,L2,L3,L4,L5)
plotRelational(L1,L2,L3,L4,L5,conf.level=.99,mu=70)
addData(L1,L2,L3,L4,L5,method="stack",col="black")
