
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLE WITH RATTAN DATA

# Input Data

Feedback=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation=c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback=factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
mydata=data.frame(Feedback,Motivation)
mydata

# Read Data Instead

mydata=read.table("RattanData.csv",header=T,sep=",")
mydata=read.csv("RattanData.csv")
attach(mydata)
mydata

# Analyses of the Different Groups

estimateGroups(Motivation~Feedback)
plotGroups(Motivation~Feedback)

# Analysis of Group Differences

Comparison=factor(Feedback,c("Comfort","Challenge"))
estimateGroupDiff(Motivation~Comparison)
plotGroupDiff(Motivation~Comparison)
testGroupDiff(Motivation~Comparison)
effectGroupDiff(Motivation~Comparison)

Contrast=factor(Feedback)
levels(Contrast)=c("Comfort","Other","Other")
estimateGroupDiff(Motivation~Contrast)
plotGroupDiff(Motivation~Contrast)
testGroupDiff(Motivation~Contrast)
effectGroupDiff(Motivation~Contrast)

