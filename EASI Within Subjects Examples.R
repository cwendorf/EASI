
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# WITHIN-SUBJECTS EXAMPLES

# Create Data

Time1=c(5,6,6,7,8)
Time2=c(7,7,8,8,9)
Time3=c(8,8,9,9,9)

mydata=data.frame(Time1,Time2,Time3)
mydata

# Analysis of a Single Variable

estVars(Time1)
testVars(Time1)

estVars(Time1,conf.level=.99)
testVars(Time1,mu=5)

# Analyses of Multiple Variables

estVars(Time1,Time2)
plotVars(t1,t2)

nhstVars(Time1,Time2)
testVars(Time1,Time2)
testVars(Time1,Time2,mu=6)

estVars(Time1,Time2,conf.level=.99)
plotVars(Time1,Time2,conf.level=.99)

estVars(Time1,Time2,Time3)
plotVars(Time1,Time2,Time3)
testVars(Time1,Time2,Time3,mu=6)
plotVars(Time1,Time2,Time3,mu=6)

estVars(Time1,Time2,Time3,conf.level=.99)
plotVars(Time1,Time2,Time3,conf.level=.99)

# Analyses of Variable Differences

estVars(Time1,Time2)
estVarDiff(Time1,Time2)
plotVarDiff(Time1,Time2)
testVarDiff(Time1,Time2)

estVarDiff(Time1,Time2,conf.level=.99)
plotVarDiff(Time1,Time2,conf.level=.99)
testVarDiff(Time1,Time2,mu=-2)











