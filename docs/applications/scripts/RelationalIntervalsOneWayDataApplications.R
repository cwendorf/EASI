# Estimation Approach to Statistical Inference
## Relational Intervals OneWay Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Group <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Group <- factor(Group,levels=c(1,2,3,4,5),labels=c("Group1","Group2","Group3","Group4","Group5"))

### Analyses of Relational Intervals

describeMeans(Outcome~Group)
describeMeansOmnibus(Outcome~Group)
testMeansOmnibus(Outcome~Group)

estimateMeansRelational(Outcome~Group)
plotMeansRelational(Outcome~Group)
