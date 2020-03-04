# Estimation Approach to Statistical Inference
## OneWay (Between-Subjects) Example with Rattan Summary Statistics

### Enter Summary Statistics

Comfort <- c(N=18,M=3.333,SD=1.917)
Challenge <- c(N=17,M=5.265,SD=1.448)
Control <- c(N=19,M=4.447,SD=1.433)
RattanSummary <- rbind(Comfort,Challenge,Control)
class(RattanSummary) <- "bss"
RattanSummary

### Analyses of the Different Groups

estimateMeans(RattanSummary)
plotMeans(RattanSummary,ylab="Motivation")

### Analysis of a Group Comparison

ComfortvsChallenge <- rbind(Comfort,Challenge)
class(ComfortvsChallenge) <- "bss"
estimateDifference(ComfortvsChallenge)
plotDifference(ComfortvsChallenge,ylab="Motivation")
standardizeDifference(ComfortvsChallenge)

### Analyses of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(RattanSummary,contrast=ComfortvsOthers)
plotContrast(RattanSummary,contrast=ComfortvsOthers,labels=c("Comfort","Others"),ylab="Motivation")
testContrast(RattanSummary,contrast=ComfortvsOthers)
standardizeContrast(RattanSummary,contrast=ComfortvsOthers)
