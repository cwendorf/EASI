
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## EXTENDED BETWEEN-SUBJECTS EXAMPLES

### Three Group Example Data

Group <- c(rep("Group1",3),rep("Group2",3),rep("Group3",3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group)

mydata <- data.frame(Group,Outcome)
mydata

### Analyses of Pairwise Group Comparisons
### (equivalent to uncorrected t tests)

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Outcome~Group)
estimatePairwise(Outcome~Group,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Outcome~Group)
plotPairwise(Outcome~Group,mu=-2,conf.level=.99)

#### Significance Tests of the Pairwise Comparisons

testPairwise(Outcome~Group)
testPairwise(Outcome~Group,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

effectPairwise(Outcome~Group)
effectPairwise(Outcome~Group,conf.level=.99)

### Analyses of Sets of Group Contrasts
### (equivalent to dummy, effect, and other sets of codes)

#### Estimate, Plot, and Test a Set of Contrasts
#### (default are sum contrasts -- comparisons of levels to grand mean)

estimateContrasts(Outcome~Group)
plotContrasts(Outcome~Group)
testContrasts(Outcome~Group)

estimateContrasts(Outcome~Group,conf.level=.99)
plotContrasts(Outcome~Group,conf.level=.99)

#### Other Standard Sets of Contrasts can be Specified

estimateContrasts(Outcome~Group,contrasts=contr.sum)
testContrasts(Outcome~Group,contrasts=contr.sum)
plotContrasts(Outcome~Group,contrasts=contr.sum)

estimateContrasts(Outcome~Group,contrasts=contr.treatment)
plotContrasts(Outcome~Group,contrasts=contr.treatment)
testContrasts(Outcome~Group,contrasts=contr.treatment)

estimateContrasts(Outcome~Group,contrasts=contr.poly)
plotContrasts(Outcome~Group,contrasts=contr.poly)
testContrasts(Outcome~Group,contrasts=contr.poly)

estimateContrasts(Outcome~Group,contrasts=contr.helmert)
plotContrasts(Outcome~Group,contrasts=contr.helmert)
testContrasts(Outcome~Group,contrasts=contr.helmert)

estimateContrasts(Outcome~Group,contrasts=contr.SAS)
plotContrasts(Outcome~Group,contrasts=contr.SAS)
testContrasts(Outcome~Group,contrasts=contr.SAS)
