
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLE WITH RATTAN DATA

# Input Data

Feedback=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
Motivation=c(5.5,5,5.5,6,1,2.5,4.5,1,3.5,1.5,5.5,6,1.5,1,3.5,2.5,3,1,2,6,4.5,4.5,6,7,3,7,3.5,5,4.5,5.5,6.5,6,6,7,5.5,6,2.5,4.5,3.5,6,5,6,3.5,4,3,5.5,3,6,3,5,6,6.5,3.5,2)
Feedback=factor(Feedback,levels=c(1,2,3),labels=c("Comfort","Challenge","Control"))
Rattan=data.frame(Feedback,Motivation)
Rattan

# Alternatives for Reading Data Instead

Rattan=read.table("RattanData.csv",header=T,sep=",")
Rattan=read.csv("RattanData.csv")
attach(Rattan)
Rattan

load(file="RattanData.rda")
attach(Rattan)
Rattan

# Analyses of the Different Groups

estimateLevels(Motivation~Feedback)
plotLevels(Motivation~Feedback)

# Analysis of a Group Comparison

Comparison=factor(Feedback,c("Comfort","Challenge"))
estimateDifference(Motivation~Comparison)
plotDifference(Motivation~Comparison)
effectDifference(Motivation~Comparison)

# Analyses of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(Motivation~Feedback,contrast=ComfortvsOthers)
testContrast(Motivation~Feedback,contrast=ComfortvsOthers)


