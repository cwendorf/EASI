
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLES

# Three Group Example Data

Group=c(rep(1,3),rep(2,3),rep(3,3))
Outcome=c(3,4,5,7,8,9,8,9,10)
Group=factor(Group)

mydata=data.frame(Group,Outcome)
mydata

# Analysis of a Single Variable

estVar(Outcome)
testVar(Outcome)

estVar(Outcome,conf.level=.99)
testVar(Outcome,mu=5)

# Analyses of Multiple Groups

estGroups(Outcome~Group)
plotGroups(Outcome~Group)
estGroups(Outcome~Group,conf.level=.99)
plotGroups(Outcome~Group,conf.level=.99)

testGroups(Outcome~Group)
testGroups(Outcome~Group,mu=5)
plotGroups(Outcome~Group,mu=5)

# Analyses of Group Differences

Comp=factor(Group,c(1,2))
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp,var.equal=T)
testGroupDiff(Outcome~Comp,mu=2)
testGroupDiff(Outcome~Comp,var.equal=T,mu=2)

Comp=factor(Group,c(1,2))
estGroups(Outcome~Comp,conf.level=.99)
estGroupDiff(Outcome~Comp,conf.level=.99)
plotGroupDiff(Outcome~Comp,conf.level=.99)

Comp=factor(Group,c(2,1))
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp)

Comp=factor(Group,c(1,3))
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp)

Comp=factor(Group)
levels(Comp)=c(1,2,NA)
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp)

Comp=factor(Group)
levels(Comp)=c("1","2&3","2&3")
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp)

Comp=factor(Group)
levels(Comp)=c("1","2&3","2&3")
estGroups(Outcome~Comp)
estGroupDiff(Outcome~Comp)
plotGroupDiff(Outcome~Comp)
testGroupDiff(Outcome~Comp)
