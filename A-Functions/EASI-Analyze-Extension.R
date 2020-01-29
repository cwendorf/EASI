# Estimation Approach to Statistical Inference
## Extension for Consolidating Analyses

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Meta-Wrappers for All Functions

analyzeMeans <- function(...,conf.level=.95,mu=0,rope=NULL){
  Output <- list(
    title="ANALYSIS OF MEANS",
    estimateMeans=format(as.data.frame(ciMeans(...,conf.level=conf.level)),trim=T,nsmall=3),
    testMeans=format(as.data.frame(nhstMeans(...,mu=mu)),trim=T,nsmall=3),
    standardizeMeans=format(as.data.frame(smdMeans(...,mu=mu,conf.level=conf.level)),trim=T,nsmall=3))
  plotMeans(...,conf.level=conf.level,mu=mu,rope=rope)  
  return(Output)
}

analyzeDifference <- function(...,conf.level=.95,mu=0,rope=NULL){
  Output <- list(
    title="ANALYSIS OF A DIFFERENCE",
    estimateDifference=format(as.data.frame(ciDifference(...,conf.level=conf.level)),trim=T,nsmall=3),
    testDifference=format(as.data.frame(nhstDifference(...,mu=mu)),trim=T,nsmall=3),
    standardizeDifference=format(as.data.frame(smdDifference(...,mu=mu,conf.level=conf.level)),trim=T,nsmall=3))
  plotDifference(...,conf.level=conf.level,mu=mu,rope=rope)  
  return(Output)
}

analyzeContrast <- function(...,conf.level=.95,mu=0,rope=NULL){
  Output <- list(
    title="ANALYSIS OF A CONTRAST",
    estimateContrast=format(as.data.frame(ciContrast(...,conf.level=conf.level)),trim=T,nsmall=3),
    testContrast=format(as.data.frame(nhstContrast(...,mu=mu)),trim=T,nsmall=3),
    standardizeContrast=format(as.data.frame(smdContrast(...,mu=mu,conf.level=conf.level)),trim=T,nsmall=3))
  plotContrast(...,conf.level=conf.level,mu=mu,rope=rope)  
  return(Output)
}
