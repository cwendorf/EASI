
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

# Analysis of a Single Variable

estVar(Motivation)
estVar(Motivation,conf.level=.99)

testVar(Motivation)
testVar(Motivation,mu=5)

# Analyses of the Different Groups

estGroups(Motivation~Feedback)
plotGroups(Motivation~Feedback)
estGroups(Motivation~Feedback,conf.level=.99)
plotGroups(Motivation~Feedback,conf.level=.99)

testGroups(Motivation~Feedback)
testGroups(Motivation~Feedback,mu=5)

# Analysis of Group Differences

Comp=factor(Feedback,c(1,2))
estGroups(Motivation~Comp)
estDiff(Motivation~Comp)
plotDiff(Motivation~Comp)
testDiff(Motivation~Comp,var.equal=T)
testDiff(Motivation~Comp,mu=2)
testDiff(Motivation~Comp,var.equal=T,mu=2)

Comp=factor(Feedback,c(1,2))
estGroups(Motivation~Comp,conf.level=.99)
estDiff(Motivation~Comp,conf.level=.99)
plotDiff(Motivation~Comp,conf.level=.99)

Comp=factor(Feedback,c(2,1))
estGroups(Motivation~Comp)
estDiff(Motivation~Comp)
plotDiff(Motivation~Comp)
testDiff(Motivation~Comp)

Comp=factor(Feedback,c(1,3))
estGroups(Motivation~Comp)
estDiff(Motivation~Comp)
plotDiff(Motivation~Comp)
testDiff(Motivation~Comp)

Comp=factor(Feedback)
levels(Comp)=c("1&2","1&2","3")
estGroups(Motivation~Comp)
estDiff(Motivation~Comp)
plotDiff(Motivation~Comp)
testDiff(Motivation~Comp)
