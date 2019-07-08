
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLES

# Create Data

Time1=c(5,6,6,7,8)
Time2=c(7,7,8,8,9)
Time3=c(8,8,9,9,9)

mydata=data.frame(Time1,Time2,Time3)
mydata

# Analyses of Multiple Variables

estimateLevels(Time1,Time2,Time3)
plotLevels(Time1,Time2,Time3)
testLevels(Time1,Time2,Time3)
effectLevels(Time1,Time2,Time3)

estimateLevels(Time1,Time2,Time3,conf.level=.99)
plotLevels(Time1,Time2,Time3,conf.level=.99,mu=6)
testLevels(Time1,Time2,Time3,mu=6)
effectLevels(Time1,Time2,Time3,mu=6,conf.level=.99)

# Analyses of a Comparison

estimateLevels(Time1,Time2)
estimateDifference(Time1,Time2)
plotDifference(Time1,Time2)
testDifference(Time1,Time2)
effectDifference(Time1,Time2)

estimateDifference(Time1,Time2,conf.level=.99)
plotDifference(Time1,Time2,conf.level=.99)
testDifference(Time1,Time2,mu=-2)
effectDifference(Time1,Time2,conf.level=.99)

estimateLevels(Time3,Time1)
estimateDifference(Time3,Time1)
plotDifference(Time3,Time1)
testDifference(Time3,Time1)
effectDifference(Time3,Time1)

Time1a2=(Time1+Time2)/2
estimateLevels(Time3,Time1a2)
estimateDifference(Time3,Time1a2)
plotDifference(Time3,Time1a2)
testDifference(Time3,Time1a2)
effectDifference(Time3,Time1a2)

# Analyses of Sets of Contrasts

estimateContrasts(Time1,Time2,Time3)
testContrasts(Time1,Time2,Time3)
plotContrasts(Time1,Time2,Time3)

estimateContrasts(Time1,Time2,Time3,conf.level=.99)
plotContrasts(Time1,Time2,Time3,conf.level=.99)

estimateContrasts(Time1,Time2,Time3,contrasts=contr.treatment)
testContrasts(Time1,Time2,Time3,contrasts=contr.treatment)
plotContrasts(Time1,Time2,Time3,contrasts=contr.treatment)

setcontrasts=contr.treatment
estimateContrasts(Time1,Time2,Time3,contrasts=setcontrasts)
plotContrasts(Time1,Time2,Time3,contrasts=setcontrasts)

# Analyses of Pairwise Comparisons

estimatePairwise(Time1,Time2,Time3)
plotPairwise(Time1,Time2,Time3)
testPairwise(Time1,Time2,Time3)

estimatePairwise(Time1,Time2,Time3,conf.level=.99)
plotPairwise(Time1,Time2,Time3,mu=-2,conf.level=.99)
testPairwise(Time1,Time2,Time3,mu=-2)
