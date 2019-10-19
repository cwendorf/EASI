# Estimation Approach to Statistical Inference (EASI)
## Repeated (Within-Subjects) Tutorial with Data

### Source the EASI Functions and the Extension

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/analyzeExtension.R")

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)

WithinData <- data.frame(Outcome1,Outcome2,Outcome3)
WithinData

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

analyzeMeans(Outcome1,Outcome2,Outcome3) # Includes AnalyzeRepeated-Figure1.jpeg
analyzeMeans(Outcome1,Outcome2,Outcome3,mu=6,conf.level=.99) # Includes AnalyzeRepeated-Figure1.jpeg

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

analyzeDifference(Outcome1,Outcome2) # Includes AnalyzeRepeated-Figure1.jpeg
analyzeDifference(Outcome1,Outcome2,mu=-2,conf.level=.99) # Includes AnalyzeRepeated-Figure1.jpeg

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

O1vsOthers <- c(-1,.5,.5)
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers) # Includes AnalyzeRepeated-Figure1.jpeg
analyzeContrast(Outcome1,Outcome2,Outcome3,contrast=O1vsOthers,mu=0,conf.level=.99) # Includes AnalyzeRepeated-Figure1.jpeg
