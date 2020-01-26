# Estimation Approach to Statistical Inference
## Analyze - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Analyze-Extension.R")

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary

### Analyses of Multiple Groups

analyzeMeans(OneWaySummary) # Includes AnalyzeOneWay-Figure1.jpeg
analyzeMeans(OneWaySummary,mu=5,conf.level=.99) # Includes AnalyzeOneWay-Figure2.jpeg

### Analyses of a Group Comparison

CompSummary <- OneWaySummary[c("Level1","Level2"),]
class(CompSummary) <- "bss"

analyzeDifference(CompSummary) # Includes AnalyzeOneWay-Figure3.jpeg
analyzeDifference(CompSummary,mu=-2,conf.level=.99) # Includes AnalyzeOneWay-Figure4.jpeg

### Analyses of a Group Contrast

L1vsOthers <- c(-1,.5,.5)
analyzeContrast(OneWaySummary,contrast=L1vsOthers) # Includes AnalyzeOneWay-Figure5.jpeg
analyzeContrast(OneWaySummary,contrast=L1vsOthers,mu=4,conf.level=.99) # Includes AnalyzeOneWay-Figure6.jpeg
