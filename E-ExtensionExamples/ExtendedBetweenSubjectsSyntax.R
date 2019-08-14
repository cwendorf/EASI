# Estimation Approach to Statistical Inference (EASI)
## Extended Between-Subjects Example

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
