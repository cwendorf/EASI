
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLE WITH RATTAN DATA

# Input Data

Feedback=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation=c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback=factor(Feedback)
mydata=data.frame(Feedback,Motivation)
mydata

# Read Data Instead

mydata=read.table("RattanData.csv",header=T,sep=",")
mydata=read.csv("RattanData.csv")
attach(mydata)
mydata

# Analysis of a Single Variableiable

estimateVariable(Motivation)
estimateVariable(Motivation,conf.level=.99)

testVariable(Motivation)
testVariable(Motivation,mu=5)

# Analyses of the GroupDifferent Groups

estimateGroups(Motivation~Feedback)
plotGroups(Motivation~Feedback)
estimateGroups(Motivation~Feedback,conf.level=.99)
plotGroups(Motivation~Feedback,conf.level=.99)

testGroups(Motivation~Feedback)
testGroups(Motivation~Feedback,mu=5)

# Analysis of Group GroupDifferences

Comparison=factor(Feedback,c(1,2))
estimateGroups(Motivation~Comparison)
estimateGroupDiff(Motivation~Comparison)
plotGroupDiff(Motivation~Comparison)
testGroupDiff(Motivation~Comparison,var.equal=T)
testGroupDiff(Motivation~Comparison,mu=2)
testGroupDiff(Motivation~Comparison,var.equal=T,mu=2)

Comparison=factor(Feedback,c(1,2))
estimateGroups(Motivation~Comparison,conf.level=.99)
estimateGroupDiff(Motivation~Comparison,conf.level=.99)
plotGroupDiff(Motivation~Comparison,conf.level=.99)

Comparison=factor(Feedback,c(2,1))
estimateGroups(Motivation~Comparison)
estimateGroupDiff(Motivation~Comparison)
plotGroupDiff(Motivation~Comparison)
testGroupDiff(Motivation~Comparison)

Comparison=factor(Feedback,c(1,3))
estimateGroups(Motivation~Comparison)
estimateGroupDiff(Motivation~Comparison)
plotGroupDiff(Motivation~Comparison)
testGroupDiff(Motivation~Comparison)

Comparison=factor(Feedback)
levels(Comparison)=c("1&2","1&2","3")
estimateGroups(Motivation~Comparison)
estimateGroupDiff(Motivation~Comparison)
plotGroupDiff(Motivation~Comparison)
testGroupDiff(Motivation~Comparison)
