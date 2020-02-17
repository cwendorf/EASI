# Estimation Approach to Statistical Inference
## Analyze - OneWay (Between-Subjects) Tutorial with Data

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
OneWayData <- data.frame(Factor,Outcome)
OneWayData

### Analyses of Multiple Groups

analyzeMeans(Outcome~Factor)
analyzeMeans(Outcome~Factor,mu=5,conf.level=.99,rope=c(3,7))

### Analyses of a Group Comparison

Comparison=factor(Factor,c("Level1","Level2"))
analyzeDifference(Outcome~Comparison)
analyzeDifference(Outcome~Comparison,mu=-2,conf.level=.99,rope=c(-2,2))

### Analyses of a Group Contrast

L1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome~Factor,contrast=L1vsOthers)
analyzeContrast(Outcome~Factor,contrast=L1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
