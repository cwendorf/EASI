
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLES

# Three Group Example Data

Group=c(rep(1,3),rep(2,3),rep(4,3))
Outcome=c(3,4,5,7,8,9,8,9,10)
Group=factor(Group)

mydata=data.frame(Group,Outcome)
mydata

# Preliminary Examination of the Data

plotData(Outcome~Group)
plotData(Outcome~Group,method="stack",col="black")

# Analyses of Multiple Groups

estimateLevels(Outcome~Group)
plotLevels(Outcome~Group)
testLevels(Outcome~Group)
effectLevels(Outcome~Group)

estimateLevels(Outcome~Group,conf.level=.99)
plotLevels(Outcome~Group,conf.level=.99,mu=5)
testLevels(Outcome~Group,mu=5)
effectLevels(Outcome~Group,mu=5,conf.level=.99)

# Analyses of Group Differences

Comparison=factor(Group,c(1,2))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group,c(1,2))
estimateLevels(Outcome~Comparison,conf.level=.99)
estimateDifference(Outcome~Comparison,conf.level=.99)
plotDifference(Outcome~Comparison,conf.level=.99)
testDifference(Outcome~Comparison,var.equal=T)
testDifference(Outcome~Comparison,mu=2)
testDifference(Outcome~Comparison,var.equal=T,mu=2)
effectDifference(Outcome~Comparison,conf.level=.99)

Comparison=factor(Group,c(2,1))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group,c(1,3))
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c(1,2,NA)
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c("1","2&3","2&3")
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

Comparison=factor(Group)
levels(Comparison)=c("1","2&3","2&3")
estimateLevels(Outcome~Comparison)
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison)

# Analyses of Sets of Contrasts

estimateContrasts(Outcome~Group)
testContrasts(Outcome~Group)
plotContrasts(Outcome~Group)

estimateContrasts(Outcome~Group,conf.level=.99)
plotGroupContrasts(Outcome~Group,conf.level=.99)

estimateContrasts(Outcome~Group,contrasts=contr.treatment)
testContrasts(Outcome~Group,contrasts=contr.treatment)
plotContrasts(Outcome~Group,contrasts=contr.treatment)

setcontrasts=contr.treatment
estimateContrasts(Outcome~Group,contrasts=setcontrasts)
setcontrasts=contr.poly
estimateContrasts(Outcome~Group,contrasts=setcontrasts)
setcontrasts=contr.helmert
estimateContrasts(Outcome~Group,contrasts=setcontrasts)
setcontrasts=contr.sum
estimateContrasts(Outcome~Group,contrasts=setcontrasts)
setcontrasts=contr.SAS
estimateContrasts(Outcome~Group,contrasts=setcontrasts)

# Analyses of Pairwise Comparisons

estimatePairwise(Outcome~Group)
plotPairwise(Outcome~Group)
testPairwise(Outcome~Group)

estimatePairwise(Outcome~Group,conf.level=.99)
plotPairwise(Outcome~Group,mu=0,conf.level=.99)
testPairwise(Outcome~Group)




