# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Thomason Summary Statistics Example

### Thomason1 Sample

Pretest <- c(N=12,M=11.583,SD=3.315)
Posttest <- c(N=12,M=13.250,SD=2.896)
Thomason1Summary <- rbind(Pretest,Posttest)
class(Thomason1Summary) <- "wss"
Thomason1Corr <- data.frame()
Thomason1Corr["Pretest","Posttest"] <- .892

estimateMeanComparison(Thomason1Summary,Thomason1Corr)
plotMeanComparison(Thomason1Summary,Thomason1Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score",ylim=c(0,20),values=FALSE)
estimateStandardizedMeanDifference(Thomason1Summary,Thomason1Corr)

### Thomason2 Sample

Pretest <- c(N=16,M=12.875,SD=3.403)
Posttest <- c(N=16,M=14.250,SD=4.282)
Thomason2Summary <- rbind(Pretest,Posttest)
class(Thomason2Summary) <- "wss"
Thomason2Corr <- data.frame()
Thomason2Corr["Pretest","Posttest"] <- .871

estimateMeanComparison(Thomason2Summary,Thomason2Corr)
plotMeanComparison(Thomason2Summary,Thomason2Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score",ylim=c(0,20),values=FALSE)
estimateStandardizedMeanDifference(Thomason2Summary,Thomason2Corr)

### Thomason3 Sample

Pretest <- c(N=39,M=67.410,SD=7.419)
Posttest <- c(N=39,M=71.769,SD=5.851)
Thomason3Summary <- rbind(Pretest,Posttest)
class(Thomason3Summary) <- "wss"
Thomason3Corr <- data.frame()
Thomason3Corr["Pretest","Posttest"] <- .601

estimateMeanComparison(Thomason3Summary,Thomason3Corr)
plotMeanComparison(Thomason3Summary,Thomason3Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score",values=FALSE)
estimateStandardizedMeanDifference(Thomason3Summary,Thomason3Corr)
