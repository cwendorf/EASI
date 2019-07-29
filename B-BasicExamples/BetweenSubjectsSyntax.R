
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC BETWEEN-SUBJECTS EXAMPLES

### Three Group Example Data

Group <- c(rep("Group1",3),rep("Group2",3),rep("Group3",3))
Outcome <- c(3,4,5,7,8,9,8,9,10)
Group <- factor(Group)

mydata <- data.frame(Group,Outcome)
mydata

### Analyses of Multiple Groups
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateLevels(Outcome~Group)
estimateLevels(Outcome~Group,conf.level=.99)

#### Plot of the Confidence Intervals for the Means

plotLevels(Outcome~Group)
plotLevels(Outcome~Group,conf.level=.99,mu=5)

#### Significance Tests for the Means

testLevels(Outcome~Group)
testLevels(Outcome~Group,mu=5)

#### Effect Sizes for the Means

effectLevels(Outcome~Group)
effectLevels(Outcome~Group,mu=5,conf.level=.99)

### Analyses of a Group Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for a Mean Difference

Comparison=factor(Group,c("Group1","Group2"))
estimateDifference(Outcome~Comparison)
estimateDifference(Outcome~Comparison,conf.level=.99)
Comparison=factor(Group,c("Group3","Group1"))
estimateDifference(Outcome~Comparison)

#### Plot of the Confidence Interval for the Mean Difference

plotDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison,conf.level=.99)

#### Significance Test of the Mean Difference

testDifference(Outcome~Comparison)
testDifference(Outcome~Comparison,mu=2)

#### Effect Size for the Mean Difference

effectDifference(Outcome~Comparison)
effectDifference(Outcome~Comparison,conf.level=.99)

### Analyses of a Group Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

G1 <- c(1,0,0)
estimateContrast(Outcome~Group,contrast=G1)
G2nG3 <- c(0,.5,.5)
estimateContrast(Outcome~Group,contrast=G2nG3)

#### Confidence Interval for a Contrast

G1vsOthers <- c(-1,.5,.5)
estimateContrast(Outcome~Group,contrast=G1vsOthers)
estimateContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(Outcome~Group,contrast=G1vsOthers)
plotContrast(Outcome~Group,contrast=G1vsOthers,conf.level=.99)

#### Significance Test for a Contrast

testContrast(Outcome~Group,contrast=G1vsOthers)
testContrast(Outcome~Group,contrast=G1vsOthers,mu=4)

### Different Methods for Comparing Two Groups
### (demonstrating equivalence of Difference/Comparison and Contrast approaches)

#### The Difference/Comparison Approach (Copied from Above)

Comparison=factor(Group,c("Group2","Group1"))
estimateDifference(Outcome~Comparison)
plotDifference(Outcome~Comparison)
testDifference(Outcome~Comparison)

#### The Contrast Approach (Adapted from Above)

G1vsG2 <- c(-1,1,0)
estimateContrast(Outcome~Group,contrast=G1vsG2)
plotContrast(Outcome~Group,contrast=G1vsG2)
testContrast(Outcome~Group,contrast=G1vsG2)
