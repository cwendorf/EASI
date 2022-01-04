# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## PenLaptop Summary Statistics Example

### PenLaptop1 Sample

Pen <- c(N=34,M=8.812,SD=4.749)
Laptop <- c(N=31,M=14.519,SD=7.286)
PenLaptop1Summary <- rbind(Pen,Laptop)
class(PenLaptop1Summary) <- "bss"

plotMeanComparison(PenLaptop1Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(PenLaptop1Summary)

### PenLaptop2 Sample

Pen <- c(N=48,M=6.881,SD=4.219)
Laptop <- c(N=103,M=12.088,SD=5.525)
PenLaptop2Summary <- rbind(Pen,Laptop)
class(PenLaptop2Summary) <- "bss"

plotMeanComparison(PenLaptop2Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(PenLaptop2Summary)

### PenLaptop3 Sample

Pen <- c(N=54,M=4.178,SD=2.549)
Laptop <- c(N=55,M=11.622,SD=5.681)
PenLaptop3Summary <- rbind(Pen,Laptop)
class(PenLaptop3Summary) <- "bss"

plotMeanComparison(PenLaptop3Summary,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(PenLaptop3Summary)
