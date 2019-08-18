# Estimation Approach to Statistical Inference (EASI)
## Within-Subjects Example with Donohue Summary Statistics

### Enter Summary Statistics

Pretest <- c(N=20,M=19.300,SD=5.904)
Posttest <- c(N=20,M=23.600,SD=4.762)
Followup <- c(N=20,M=23.400,SD=4.616)
sumstats <- rbind(Pretest,Posttest,Followup)
class(sumstats) <- "wss"
sumstats

corrstats <- declareCorrMatrix("Pretest","Posttest","Followup")
corrstats["Pretest","Posttest"] <- .493
corrstats["Pretest","Followup"] <- .536
corrstats["Posttest","Followup"] <- .743
corrstats <- fillCorrMatrix(corrstats)
corrstats

### Analyses of the Different Variables

estimateMeans(sumstats)
plotMeans(sumstats)

### Analysis of a Variable Difference

compstats <- sumstats[c(2,3),]
class(compstats) <- "wss"
estimateDifference(compstats,corrstats)
plotDifference(compstats,corrstats)
effectDifference(compstats,corrstats)

### Analysis of a Variable Contrast

PrevsPostFollow <- c(1,-.5,.5)
estimateContrast(sumstats,corrstats,contrast=PrevsPostFollow)
plotContrast(sumstats,corrstats,contrast=PrevsPostFollow)
testContrast(sumstats,corrstats,contrast=PrevsPostFollow)
