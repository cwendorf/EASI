
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLES
# EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS

# Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata

# Analyses of Sets of Variable Contrasts
# (equivalent to dummy, effect, and other sets of codes)

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

# Analyses of Pairwise Variable Comparisons
# (equivalent to Tukey LSD pairwise comparisons))

estimatePairwise(Time1,Time2,Time3)
plotPairwise(Time1,Time2,Time3)
testPairwise(Time1,Time2,Time3)
effectPairwise(Time1,Time2,Time3)

estimatePairwise(Time1,Time2,Time3,conf.level=.99)
plotPairwise(Time1,Time2,Time3,mu=-2,conf.level=.99)
testPairwise(Time1,Time2,Time3,mu=-2)
effectPairwise(Time1,Time2,Time3,conf.level=.99)
