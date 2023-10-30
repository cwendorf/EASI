# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Thomason Data Example

### Thomason1 Sample

Pretest <- c(13, 12, 12, 9, 14, 17, 14, 9, 6, 7, 11, 15)
Posttest <- c(14, 13, 16, 12, 15, 18, 13, 10, 10, 8, 14, 16)
Thomason1Data <- data.frame(Pretest, Posttest)

estimateMeanComparison(Thomason1Data)
plotMeanComparison(Thomason1Data, main = "LSAT Score Before and After Mapping", ylab = "LSAT Score", ylim = c(0, 20), values = FALSE)
estimateStandardizedMeanDifference(Thomason1Data)

### Thomason2 Sample

Pretest <- c(10, 14, 7, 12, 11, 11, 15, 14, 9, 16, 10, 11, 13, 19, 19, 15)
Posttest <- c(12, 19, 6, 9, 15, 13, 17, 14, 10, 17, 9, 14, 15, 22, 18, 18)
Thomason2Data <- data.frame(Pretest, Posttest)

estimateMeanComparison(Thomason2Data)
plotMeanComparison(Thomason2Data, main = "LSAT Score Before and After Mapping", ylab = "LSAT Score", ylim = c(0, 20), values = FALSE)
estimateStandardizedMeanDifference(Thomason2Data)

### Thomason3 Sample

Pretest <- c(41, 50, 71, 70, 74, 75, 64, 72, 77, 53, 60, 73, 72, 62, 68, 63, 69, 71, 70, 70, 75, 71, 76, 64, 70, 65, 75, 66, 70, 70, 64, 72, 63, 68, 64, 61, 63, 76, 71)
Posttest <- c(52, 63, 69, 71, 80, 80, 69, 76, 78, 77, 67, 76, 69, 73, 73, 68, 70, 81, 70, 76, 77, 75, 69, 77, 70, 76, 65, 64, 72, 71, 63, 78, 71, 77, 67, 66, 73, 75, 75)
Thomason3Data <- data.frame(Pretest, Posttest)

estimateMeanComparison(Thomason3Data)
plotMeanComparison(Thomason3Data, main = "LSAT Score Before and After Mapping", ylab = "LSAT Score", values = FALSE)
estimateStandardizedMeanDifference(Thomason3Data)
