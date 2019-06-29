
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLES

# Three Group Example Data

Group=c(rep(1,3),rep(2,3),rep(3,3))
Outcome=c(3,4,5,7,8,9,8,9,10)
Group=factor(Group)

mydata=data.frame(Group,Outcome)
mydata

# Analysis of a Single Variable

estimateVariable(Outcome)
testVariable(Outcome)
effectVariable(Outcome)

estimateVariable(Outcome,conf.level=.99)
testVariable(Outcome,mu=5)
effectVariable(Outcome,mu=5)

# Analyses of Multiple Groups

estimateGroups(Outcome~Group)
plotGroups(Outcome~Group)
testGroups(Outcome~Group)
effectGroups(Outcome~Group)

estimateGroups(Outcome~Group,conf.level=.99)
plotGroups(Outcome~Group,conf.level=.99,mu=5)
testGroups(Outcome~Group,mu=5)
effectGroups(Outcome~Group,mu=5,conf.level=.99)

# Analyses of Group Differences

Comparison=factor(Group,c(1,2))
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison,var.equal=T)
testGroupDiff(Outcome~Comparison,mu=2)
testGroupDiff(Outcome~Comparison,var.equal=T,mu=2)
effectGroupDiff(Outcome~Comparison)

Comparison=factor(Group,c(1,2))
estimateGroups(Outcome~Comparison,conf.level=.99)
estimateGroupDiff(Outcome~Comparison,conf.level=.99)
plotGroupDiff(Outcome~Comparison,conf.level=.99)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison,conf.level=.99)

Comparison=factor(Group,c(2,1))
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison)

Comparison=factor(Group,c(1,3))
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c(1,2,NA)
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c("1","2&3","2&3")
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c("1","2&3","2&3")
estimateGroups(Outcome~Comparison)
estimateGroupDiff(Outcome~Comparison)
plotGroupDiff(Outcome~Comparison)
testGroupDiff(Outcome~Comparison)
effectGroupDiff(Outcome~Comparison)
