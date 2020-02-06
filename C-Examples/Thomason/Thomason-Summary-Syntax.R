# Estimation Approach to Statistical Inference
## Paired Samples Example with Thomason Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")

### Thomason1 Example

Pretest <- c(N=12,M=11.583,SD=3.315)
Posttest <- c(N=12,M=13.250,SD=2.896)
Thomason1Summary <- rbind(Pretest,Posttest)
class(Thomason1Summary) <- "wss"
Thomason1Corr <- data.frame()
Thomason1Corr["Pretest","Posttest"] <- .892

plotDifference(Thomason1Summary,Thomason1Corr,ylab="LSAT") # Thomason-Figure1.jpeg
standardizeDifference(Thomason1Summary,Thomason1Corr)

### Thomason2 Example

Pretest <- c(N=16,M=12.875,SD=3.403)
Posttest <- c(N=16,M=14.250,SD=4.282)
Thomason2Summary <- rbind(Pretest,Posttest)
class(Thomason2Summary) <- "wss"
Thomason2Corr <- data.frame()
Thomason2Corr["Pretest","Posttest"] <- .871

plotDifference(Thomason2Summary,Thomason2Corr,ylab="LSAT") # Thomason-Figure2.jpeg
standardizeDifference(Thomason2Summary,Thomason2Corr)

### Thomason3 Example

Pretest <- c(N=39,M=67.410,SD=7.419)
Posttest <- c(N=39,M=71.769,SD=5.851)
Thomason3Summary <- rbind(Pretest,Posttest)
class(Thomason3Summary) <- "wss"
Thomason3Corr <- data.frame()
Thomason3Corr["Pretest","Posttest"] <- .601

plotDifference(Thomason3Summary,Thomason3Corr,ylab="LSAT") # Thomason-Figure3.jpeg
standardizeDifference(Thomason3Summary,Thomason3Corr)
