# Estimation Approach to Statistical Inference
## Analyze - Repeated (Within-Subjects) Tutorial with Data

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Analyses of Multiple Variables

analyzeMeans(Outcome1,Outcome2,Outcome3)
analyzeMeans(Outcome1,Outcome2,Outcome3,mu=5,conf.level=.99,rope=c(3,7))

### Analyses of a Variable Comparison

analyzeDifference(Outcome1,Outcome2)
analyzeDifference(Outcome1,Outcome2,mu=-2,conf.level=.99,rope=c(-2,2))

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers)
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
