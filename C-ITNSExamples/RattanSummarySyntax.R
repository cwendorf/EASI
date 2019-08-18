# Estimation Approach to Statistical Inference (EASI)
## Between-Subjects Example with Rattan Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")

### Enter Summary Statistics

Comfort <- c(N=18,M=3.333,SD=1.917)
Challenge <- c(N=17,M=5.265,SD=1.448)
Control <- c(N=19,M=4.447,SD=1.433)
sumstats <- rbind(Comfort,Challenge,Control)
class(sumstats) <- "bss"
sumstats

### Analyses of the Different Groups

estimateMeans(sumstats)
plotMeans(sumstats)

### Analysis of a Group Comparison

compstats <- rbind(Comfort,Challenge)
class(compstats) <- "bss"
estimateDifference(compstats)
plotDifference(compstats)
effectDifference(compstats)

### Analyses of a Group Contrast

ComfortvsOthers <- c(-1,.5,.5)
estimateContrast(sumstats,contrast=ComfortvsOthers)
plotContrast(sumstats,contrast=ComfortvsOthers)
testContrast(sumstats,contrast=ComfortvsOthers)
