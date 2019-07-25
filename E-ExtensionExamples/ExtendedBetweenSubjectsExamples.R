
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BETWEEN-SUBJECTS EXAMPLES
# EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS

# Three Group Example Data

Group <- c(rep("Group1",3),rep("Group2",3),rep("Group3",3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group)

mydata <- data.frame(Group,Outcome)
mydata

# Analyses of Sets of Group Contrasts
# (equivalent to dummy, effect, and other sets of codes)

estimateContrasts(Outcome~Group)
testContrasts(Outcome~Group)
plotContrasts(Outcome~Group)

estimateContrasts(Outcome~Group,conf.level=.99)
plotContrasts(Outcome~Group,conf.level=.99)

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

# Analyses of Pairwise Group Comparisons
# (equivalent to Tukey LSD pairwise comparisons))

estimatePairwise(Outcome~Group)
plotPairwise(Outcome~Group)
testPairwise(Outcome~Group)
effectPairwise(Outcome~Group)

estimatePairwise(Outcome~Group,conf.level=.99)
plotPairwise(Outcome~Group,mu=-2,conf.level=.99)
testPairwise(Outcome~Group,mu=-2)
effectPairwise(Outcome~Group,conf.level=.99)
