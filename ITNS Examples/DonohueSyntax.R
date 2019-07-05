
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLE WITH DONOHUE DATA

# Input Data

Pretest=c(7,11,11,13,15,17,18,18,19,19,19,19,21,22,25,25,25,26,27,29)
Posttest=c(16,20,25,22,28,12,16,26,21,22,26,30,23,27,23,27,28,24,28,28)
Followup=c(16,18,23,21,27,21,18,21,24,21,27,28,18,27,23,28,31,18,31,27)
mydata=data.frame(Pretest,Posttest,Followup)
mydata

# Read Data Instead

mydata=read.table("DonohueData.csv",header=T,sep=",")
mydata=read.csv("DonohueData.csv")
attach(mydata)
mydata

# Analyses of the Different Variables

estimateLevels(Pretest,Posttest,Followup)
plotLevels(Pretest,Posttest,Followup)

# Analysis of Variable Differences

estimateDifference(Posttest,Followup)
plotDifference(Posttest,Followup)
effectDifference(Posttest,Followup)

PostFollow=(Posttest+Followup)/2
estimateDifference(Pretest,PostFollow)
plotDifference(Pretest,PostFollow)
effectDifference(Pretest,PostFollow)
