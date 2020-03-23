# Estimation Approach to Statistical Inference
## Analyze - Repeated Measures (Within-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
Outcome3 <- c(N=4,M=7.000,SD=2.449)
RepeatedSummary <- rbind(Outcome1,Outcome2,Outcome3)
class(RepeatedSummary) <- "wss"
RepeatedSummary

RepeatedCorr <- declareCorrMatrix("Outcome1","Outcome2","Outcome3")
RepeatedCorr["Outcome1","Outcome2"] <- .500
RepeatedCorr["Outcome1","Outcome3"] <- .056
RepeatedCorr["Outcome2","Outcome3"] <- .389
RepeatedCorr <- fillCorrMatrix(RepeatedCorr)
RepeatedCorr

### Analyses of Multiple Variables

analyzeMeans(RepeatedSummary)
analyzeMeans(RepeatedSummary,mu=5,conf.level=.99,rope=c(3,7))

### Analyses of a Variable Comparison

CompSummary <- RepeatedSummary[c("Outcome1","Outcome2"),]
class(CompSummary) <- "wss"

analyzeDifference(CompSummary,RepeatedCorr)
analyzeDifference(CompSummary,RepeatedCorr,mu=-2,conf.level=.99,rope=c(-2,2))

### Analyses of a Variable Contrast

O1vsOthers <- c(-1,.5,.5)
analyzeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers)
analyzeContrast(RepeatedSummary,RepeatedCorr,contrast=O1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
