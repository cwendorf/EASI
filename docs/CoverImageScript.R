# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of Multiple Groups

attach(OneWayData)

estimateMeans(Outcome~Factor)
testMeans(Outcome~Factor,mu=5)
standardizeMeans(Outcome~Factor,mu=5,conf.level=.99)
plotMeans(Outcome~Factor,mu=5,rope=c(3,7))


# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of a Group Comparison

attach(OneWayData)
Comp1v2=factor(Factor,c("Level1","Level2"))

estimateMeans(Outcome~Comp1v2)
estimateMeanDifference(Outcome~Comp1v2)
testMeanDifference(Outcome~Comp1v2)
estimateStandardizedMeanDifference(Outcome~Comp1v2)
plotMeanComparison(Outcome~Comp1v2)


# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Tutorial with Data

### Analyses of a Group Contrast

attach(OneWayData)
L1vsOthers <- c(-1,.5,.5)

estimateMeanContrast(Outcome~Factor,contrast=L1vsOthers)
testMeanContrast(Outcome~Factor,contrast=L1vsOthers)
estimateStandardizedMeanContrast(Outcome~Factor,contrast=L1vsOthers)
plotMeanSubsets(Outcome~Factor,contrast=L1vsOthers,labels=c("Level1","Others"))
