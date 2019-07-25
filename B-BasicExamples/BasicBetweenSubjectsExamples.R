
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLES

# Three Group Example Data

Group <- c(rep("Group1",3),rep("Group2",3),rep("Group3",3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group)

mydata <- data.frame(Group,Outcome)
mydata

# Analyses of Multiple Groups
# (equivalent to one-sample analyses for each level of a factor)

estimateLevels(Outcome~Group)
plotLevels(Outcome~Group)
testLevels(Outcome~Group)
effectLevels(Outcome~Group)

estimateLevels(Outcome~Group,conf.level=.99)
plotLevels(Outcome~Group,conf.level=.99,mu=5)
testLevels(Outcome~Group,mu=5)
effectLevels(Outcome~Group,mu=5,conf.level=.99)

# Analyses of a Group Comparison
# (equivalent to analyses for two levels of a factor)

Comparison=factor(Group,c("Group1","Group2"))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group,c("Group1","Group2"))
estimateLevels(Outcome~Comparison,conf.level=.99)
estimateDifference(Outcome~Comparison,conf.level=.99)
plotDifference(Outcome~Comparison,conf.level=.99)
testDifference(Outcome~Comparison,var.equal=T)
testDifference(Outcome~Comparison,mu=2)
testDifference(Outcome~Comparison,var.equal=T,mu=2)
effectDifference(Outcome~Comparison,conf.level=.99)

Comparison=factor(Group,c("Group2","Group1"))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group,c("Group1","Group3"))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c("Group1","Group2",NA)
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

# Analyses of a Group Contrast
# (equivalent to analyses for multiple levels of a factor)

G1vsOthers <- c(-1,.5,.5)
estimateContrast(Outcome~Group,contrast=G1vsOthers)
testContrast(Outcome~Group,contrast=G1vsOthers)

G1vsOthers <- c(-1,.5,.5)
estimateContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)
testContrast(Outcome~Group,contrast=G1vsOthers,mu=4)
