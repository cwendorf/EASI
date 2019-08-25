# Estimation Approach to Statistical Inference (EASI)
## Within-Subjects Example with Thomason Data

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")

### Thomason1 Example

Pretest <- c(13,12,12,9,14,17,14,9,6,7,11,15)
Posttest <- c(14,13,16,12,15,18,13,10,10,8,14,16)

plotDifference(Pretest,Posttest)
standardizeDifference(Pretest,Posttest)

### Thomason2 Example

Pretest <- c(10,14,7,12,11,11,15,14,9,16,10,11,13,19,19,15)
Posttest <- c(12,19,6,9,15,13,17,14,10,17,9,14,15,22,18,18)

plotDifference(Pretest,Posttest)
standardizeDifference(Pretest,Posttest)

### Thomason3 Example

Pretest <- c(41,50,71,70,74,75,64,72,77,53,60,73,72,62,68,63,69,71,70,70,75,71,76,64,70,65,75,66,70,70,64,72,63,68,64,61,63,76,71)
Posttest <- c(52,63,69,71,80,80,69,76,78,77,67,76,69,73,73,68,70,81,70,76,77,75,69,77,70,76,65,64,72,71,63,78,71,77,67,66,73,75,75)

plotDifference(Pretest,Posttest)
standardizeDifference(Pretest,Posttest)
