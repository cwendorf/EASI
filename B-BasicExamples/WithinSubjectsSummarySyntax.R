# Estimation Approach to Statistical Inference (EASI)
## Basic Within-Subjects Summary Example

### Source the EASI Functions and Extensions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/D-Extensions/ALL_EASI_EXTENSIONS.R")

### Three Time Period Example Summary Statistics

Time1 <- c(N=5,M=6.4,SD=1.14)
Time2 <- c(N=5,M=7.8,SD=.837)
Time3 <- c(N=5,M=8.6,SD=.548)
sumstats <- rbind(Time1,Time2,Time3)
class(sumstats) <- "wss"
sumstats

corrstats <- declareCorrMatrix("Time1","Time2","Time3")
corrstats["Time1","Time2"] <- .891
corrstats["Time1","Time3"] <- .721
corrstats["Time2","Time3"] <- .873
corrstats <- fillCorrMatrix(corrstats)
corrstats

### Analyses of Multiple Variables
### (equivalent to one-sample analyses for each level of a factor)

#### Confidence Intervals for the Means

estimateMeans(sumstats)
estimateMeans(sumstats,conf.level=.99)

#### Plots of Confidence Intervals for the Means

plotMeans(sumstats)
plotMeans(sumstats,conf.level=.99,mu=6)

#### Significance Tests for the Means

testMeans(sumstats)
testMeans(sumstats,mu=6)

#### Effect Sizes for the Means

effectMeans(sumstats)
effectMeans(sumstats,mu=6,conf.level=.99)

### Analyses of a Variable Comparison
### (equivalent to analyses for two levels of a factor)

#### Confidence Interval for the Mean Difference

compstats <- sumstats[c(1,2),]
class(compstats) <- "wss"
estimateDifference(compstats,corrstats)
estimateDifference(compstats,corrstats,conf.level=.99)
compstats <- sumstats[c(3,1),]
class(compstats) <- "wss"

#### Plots of Confidence Intervals for the Mean Difference

compstats <- sumstats[c(1,2),]
class(compstats) <- "wss"
plotDifference(compstats,corrstats)
plotDifference(compstats,corrstats,conf.level=.99)

#### Significance Test for the Mean Difference

testDifference(compstats,corrstats)
testDifference(compstats,corrstats,mu=-2)

#### Effect Size for the Mean Difference

effectDifference(compstats,corrstats)
effectDifference(compstats,corrstats,conf.level=.99)

### Analyses of a Variable Contrast
### (equivalent to analyses for multiple levels of a factor)

#### Confidence Intervals for Combined Levels

T1 <- c(1,0,0)
estimateContrast(sumstats,corrstats,contrast=T1)
T2nT3 <- c(0,.5,.5)
estimateContrast(sumstats,corrstats,contrast=T2nT3)

#### Confidence Interval for the Contrast

T1vsOthers <- c(-1,.5,.5)
estimateContrast(sumstats,corrstats,contrast=T1vsOthers)
estimateContrast(sumstats,corrstats,contrast=T1vsOthers,conf.level=.99)

#### Plots of Confidence Intervals for a Contrast

plotContrast(sumstats,corrstats,contrast=T1vsOthers)
plotContrast(sumstats,corrstats,contrast=G1vsOthers,conf.level=.99)

#### Significance Test for the Contrast

testContrast(sumstats,corrstats,contrast=T1vsOthers)
testContrast(sumstats,corrstats,contrast=T1vsOthers,mu=-1)

### Different Methods for Comparing Two Means
### (demonstrating equivalence of Difference/Comparison and Contrast approaches)

#### The Difference/Comparison Approach (Copied from Above)

compstats <- sumstats[c(2,1),]
class(compstats) <- "wss"
estimateDifference(compstats,corrstats)
plotDifference(compstats,corrstats)
testDifference(compstats,corrstats)

#### The Contrast Approach (Adapted from Above)

T1vsT2 <- c(-1,1,0)
estimateContrast(sumstats,corrstats,contrast=T1vsT2)
plotContrast(sumstats,corrstats,contrast=T1vsT2)
testContrast(sumstats,corrstats,contrast=T1vsT2)
