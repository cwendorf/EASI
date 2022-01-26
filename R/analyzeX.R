# Estimation Approach to Statistical Inference
## Meta-Wrappers for Main Functions

### Means

analyzeMeans <- function(...,main=NULL,digits=3) {
  eM <- estimateMeans(...,digits=digits)
  tM <- testMeans(...,digits=digits)
  eSM <- estimateStandardizedMeans(...,digits=digits)
  results <- c(eM,tM,eSM)
  return(results)
}

### Mean Difference

analyzeMeanDifference <- function(...,main=NULL,digits=3) {
  eMD <- estimateMeanDifference(...,digits=digits)
  tMD <- testMeanDifference(...,digits=digits)
  eSMD <- estimateStandardizedMeanDifference(...,digits=digits)
  results <- c(eMD,tMD,eSMD)
  return(results)
}

### Mean Contrasts

analyzeMeanContrast <- function(...,main=NULL,digits=3) {
  eMC <- estimateMeanContrast(...,digits=digits)
  tMC <- testMeanContrast(...,digits=digits)
  eSMC <- estimateStandardizedMeanContrast(...,digits=digits)
  results <- c(eMC,tMC,eSMC)
  return(results)
}

### Means Omnibus

analyzeMeansOmnibus <- function(...,main=NULL,digits=3) {
  dMO <- describeMeansOmnibus(...,digits=digits)
  tMO <- testMeansOmnibus(...,digits=digits)
  eME <- estimateMeansOmnibus(...,digits=digits)
  results <- c(dMO,tMO,eME)
  return(results)
}

### Means Pairwise

analyzeMeansPairwise <- function(...,main=NULL,digits=3) {
  eMP <- estimateMeansPairwise(...,digits=digits)
  tMP <- testMeansPairwise(...,digits=digits)
  eSMP <- estimateStandardizedMeansPairwise(...,digits=digits)
  results <- c(eMP,tMP,eSMP)
  return(results)
}
