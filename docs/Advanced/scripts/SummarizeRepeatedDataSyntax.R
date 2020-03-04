# Estimation Approach to Statistical Inference
## Summarize - Repeated (Within-Subjects) Tutorial with Data

### Enter Data

Outcome1 <- c(0,0,3,5)
Outcome2 <- c(4,7,4,9)
Outcome3 <- c(9,6,4,9)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)
RepeatedData

### Summaries of Multiple Variables

summarizeData(Outcome1,Outcome2,Outcome3)

### Boxplots of Multiple Variables

plotBoxes(Outcome1,Outcome2,Outcome3)
addData(Outcome1,Outcome2,Outcome3,method="stack")
