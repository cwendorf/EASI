
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLES

# Create Data

Time1=c(5,6,6,7,8)
Time2=c(7,7,8,8,9)
Time3=c(8,8,9,9,9)

mydata=data.frame(Time1,Time2,Time3)
mydata

# Analysis of a Single Variable

estimateVariables(Time1)
testVariables(Time1)
effectVariables(Time1)

estimateVariables(Time1,conf.level=.99)
testVariables(Time1,mu=5)
effectVariables(Time1,mu=5)

# Analyses of Multiple Variables

estimateVariables(Time1,Time2,Time3)
plotVariables(Time1,Time2,Time3)
testVariables(Time1,Time2,Time3)
effectVariables(Time1,Time2,Time3)

estimateVariables(Time1,Time2,Time3,conf.level=.99)
plotVariables(Time1,Time2,Time3,conf.level=.99,mu=6)
testVariables(Time1,Time2,Time3,mu=6)
effectVariables(Time1,Time2,Time3,mu=6,conf.level=.99)

# Analyses of Variable Differences

estimateVariables(Time1,Time2)
estimateVariableDiff(Time1,Time2)
plotVariableDiff(Time1,Time2)
testVariableDiff(Time1,Time2)
effectVariableDiff(Time1,Time2)

estimateVariableDiff(Time1,Time2,conf.level=.99)
plotVariableDiff(Time1,Time2,conf.level=.99)
testVariableDiff(Time1,Time2,mu=-2)
effectVariableDiff(Time1,Time2,conf.level=.99)

estimateVariables(Time3,Time1)
estimateVariableDiff(Time3,Time1)
plotVariableDiff(Time3,Time1)
testVariableDiff(Time3,Time1)
effectVariableDiff(Time3,Time1)

Time1a2=(Time1+Time2)/2
estimateVariables(Time3,Time1a2)
estimateVariableDiff(Time3,Time1a2)
plotVariableDiff(Time3,Time1a2)
testVariableDiff(Time3,Time1a2)
effectVariableDiff(Time3,Time1a2)

# Analyses of Sets of Contrasts

estimateVariableContrasts(Time1,Time2,Time3)
testVariableContrasts(Time1,Time2,Time3)
plotVariableContrasts(Time1,Time2,Time3)

estimateVariableContrasts(Time1,Time2,Time3,conf.level=.99)
plotVariableContrasts(Time1,Time2,Time3,conf.level=.99)

estimateVariableContrasts(Time1,Time2,Time3,contrasts=contr.treatment)
testVariableContrasts(Time1,Time2,Time3,contrasts=contr.treatment)
plotVariableContrasts(Time1,Time2,Time3,contrasts=contr.treatment)

setcontrasts=contr.treatment
estimateVariableContrasts(Time1,Time2,Time3,contrasts=setcontrasts)
















