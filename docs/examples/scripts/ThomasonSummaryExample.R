# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Paired Samples Example with Thomason Summary Statistics

### Thomason1 Sample

Pretest <- c(N=12,M=11.583,SD=3.315)
Posttest <- c(N=12,M=13.250,SD=2.896)
Thomason1Summary <- rbind(Pretest,Posttest)
class(Thomason1Summary) <- "wss"
Thomason1Corr <- data.frame()
Thomason1Corr["Pretest","Posttest"] <- .892

plotMeanComparison(Thomason1Summary,Thomason1Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
estimateStandardizedMeanDifference(Thomason1Summary,Thomason1Corr)

### Thomason2 Sample

Pretest <- c(N=16,M=12.875,SD=3.403)
Posttest <- c(N=16,M=14.250,SD=4.282)
Thomason2Summary <- rbind(Pretest,Posttest)
class(Thomason2Summary) <- "wss"
Thomason2Corr <- data.frame()
Thomason2Corr["Pretest","Posttest"] <- .871

plotMeanComparison(Thomason2Summary,Thomason2Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
estimateStandardizedMeanDifference(Thomason2Summary,Thomason2Corr)

### Thomason3 Sample

Pretest <- c(N=39,M=67.410,SD=7.419)
Posttest <- c(N=39,M=71.769,SD=5.851)
Thomason3Summary <- rbind(Pretest,Posttest)
class(Thomason3Summary) <- "wss"
Thomason3Corr <- data.frame()
Thomason3Corr["Pretest","Posttest"] <- .601

plotMeanComparison(Thomason3Summary,Thomason3Corr,main="LSAT Score Before and After Mapping",ylab="LSAT Score")
estimateStandardizedMeanDifference(Thomason3Summary,Thomason3Corr)
