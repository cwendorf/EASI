### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Data

Factor <- c(1,1,1,1,2,2,2,2)
Outcome1 <- c(0,0,3,5,4,7,4,9)
Outcome2 <- c(4,7,4,9,9,6,4,9)
Outcome3 <- c(4,5,6,5,4,6,8,7)

Factor <- factor(Factor,levels=c(1,2),labels=c("Level 1","Level 2"))
MixedData <- data.frame(Factor,Outcome1,Outcome2,Outcome3)
MixedData

### Examples

describeLevelsBy(Outcome1,Outcome2,by=Factor)

correlateLevelsBy(Outcome1,Outcome2,by=Factor)
correlateLevelsBy(Outcome1,Outcome2,Outcome3,by=Factor)

estimateMeansBy(Outcome1,Outcome2,by=Factor)
estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
estimateMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99)

estimateDifferenceBy(Outcome2,Outcome1,by=Factor)
estimateDifferenceBy(Outcome2,Outcome1,by=Factor,conf.level=.99)

T1vsOthers <- c(-1,.5,.5)
estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers)
estimateContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers,conf.level=.99)

testMeansBy(Outcome1,Outcome2,by=Factor,mu=5)
testDifferenceBy(Outcome,Outcome2,by=Factor,mu=5)
T1vsOthers <- c(-1,.5,.5)
testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers)
testContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers,conf.level=.99)

standardizeMeansBy(Outcome1,Outcome2,by=Factor)
standardizeMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,mu=5,conf.level=.99)

standardizeDifferenceBy(Outcome2,Outcome1,by=Factor)
standardizeDifferenceBy(Outcome2,Outcome1,by=Factor,mu=5,conf.level=.99)

T1vsOthers <- c(-1,.5,.5)
standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers)
standardizeContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers,conf.level=.99)

plotMeansBy(Outcome1,Outcome2,by=Factor)
plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor)
plotMeansBy(Outcome1,Outcome2,Outcome3,by=Factor,conf.level=.99,mu=5,rope=c(4,6))

plotDifferenceBy(Outcome2,Outcome1,by=Factor)
plotDifferenceBy(Outcome2,Outcome1,by=Factor,conf.level=.99)

T1vsOthers <- c(-1,.5,.5)
plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers)
plotContrastBy(Outcome1,Outcome2,Outcome3,by=Factor,contrast=T1vsOthers,conf.level=.99)

