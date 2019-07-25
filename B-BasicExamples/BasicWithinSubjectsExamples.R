
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLES

# Three Time Period Example Data

Time1 <- c(5,6,6,7,8)
Time2 <- c(7,7,8,8,9)
Time3 <- c(8,8,9,9,9)

mydata <- data.frame(Time1,Time2,Time3)
mydata

# Analyses of Multiple Variables
# (equivalent to one-sample analyses for each level of a factor)

estimateLevels(mydata)
plotLevels(mydata)
testLevels(mydata)
effectLevels(mydata)

estimateLevels(Time1,Time2,Time3)
plotLevels(Time1,Time2,Time3)
testLevels(Time1,Time2,Time3)
effectLevels(Time1,Time2,Time3)

estimateLevels(Time1,Time2,Time3,conf.level=.99)
plotLevels(Time1,Time2,Time3,conf.level=.99,mu=6)
testLevels(Time1,Time2,Time3,mu=6)
effectLevels(Time1,Time2,Time3,mu=6,conf.level=.99)

# Analyses of a Variable Comparison
# (equivalent to analyses for two levels of a factor)

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

# Analyses of a Variable Contrast
# (equivalent to analyses for multiple levels of a factor)

T1vsT2 <- c(1,-1,0)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2)
testContrast(Time1,Time2,Time3,contrast=T1vsT2)

T1vsT2 <- c(1,-1,0)
estimateContrast(Time1,Time2,Time3,contrast=T1vsT2,conf.level=.99)
testContrast(Time1,Time2,Time3,contrast=T1vsT2,mu=-1)
