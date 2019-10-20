# Estimation Approach to Statistical Inference (EASI)
## Extension for Consolidating Analyses
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R
### ALL BASIC FUNCTIONS FOR EASI SHOULD BE INSTALLED TOO

### Meta-Wrappers for All Functions

analyzeMeans <- function(...){
  Output <- list(
    title="ANALYSIS OF MEANS",
    estimateMeans=format(as.data.frame(ciMeans(...)),trim=T,nsmall=3),
    testMeans=format(as.data.frame(nhstMeans(...)),trim=T,nsmall=3),
    standardizeMeans=format(as.data.frame(smdMeans(...)),trim=T,nsmall=3))
  plotMeans(...)  
  return(Output)
}

analyzeDifference <- function(...){
  Output <- list(
    title="ANALYSIS OF A DIFFERENCE",
    estimateDifference=format(as.data.frame(ciDifference(...)),trim=T,nsmall=3),
    testDifference=format(as.data.frame(nhstDifference(...)),trim=T,nsmall=3),
    standardizeDifference=format(as.data.frame(smdDifference(...)),trim=T,nsmall=3))
  plotDifference(...)  
  return(Output)
}

analyzeContrast <- function(...){
  Output <- list(
    title="ANALYSIS OF A CONTRAST",
    estimateContrast=format(as.data.frame(ciContrast(...)),trim=T,nsmall=3),
    testContrast=format(as.data.frame(nhstContrast(...)),trim=T,nsmall=3),
    standardizeContrast=format(as.data.frame(smdContrast(...)),trim=T,nsmall=3))
  plotContrast(...)  
  return(Output)
}
