# Estimation Approach to Statistical Inference
## Relational Intervals - OneWay (Between-Subjects) Example with Wendorf Data

### Enter Data

Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("L1","L2","L3","L4","L5"))
RelationalOneWayData <- data.frame(Factor,Outcome)
RelationalOneWayData

### Relational Intervals

estimateRelational(Outcome~Factor)

plotMeans(Outcome~Factor)
addRelational(Outcome~Factor)
addData(Outcome~Factor)

plotRelational(Outcome~Factor)
plotRelational(Outcome~Factor,conf.level=.99,mu=70)
addData(Outcome~Factor,method="stack",col="black")
