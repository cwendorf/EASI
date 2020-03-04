# Estimation Approach to Statistical Inference
## Relational Intervals - OneWay (Between-Subjects) Tutorial with Data

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
OneWayData

### Relational Intervals

estimateRelational(Outcome~Factor)

plotMeans(Outcome~Factor)
addRelational(Outcome~Factor)

plotRelational(Outcome~Factor)
plotRelational(Outcome~Factor,conf.level=.99,mu=5)
