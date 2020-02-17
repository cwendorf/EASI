# Estimation Approach to Statistical Inference
## Analyze - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary

### Analyses of Multiple Groups

analyzeMeans(OneWaySummary)
analyzeMeans(OneWaySummary,mu=5,conf.level=.99,rope=c(3,7))

### Analyses of a Group Comparison

CompSummary <- OneWaySummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"

analyzeDifference(CompSummary)
analyzeDifference(CompSummary,mu=-2,conf.level=.99,rope=c(-2,2))

### Analyses of a Group Contrast

L1vsOthers <- c(-1,.5,.5)
analyzeContrast(OneWaySummary,contrast=L1vsOthers)
analyzeContrast(OneWaySummary,contrast=L1vsOthers,mu=4,conf.level=.99,rope=c(-2,2))
