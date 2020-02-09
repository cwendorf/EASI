# Estimation Approach to Statistical Inference
## Extension for Consolidating Analyses

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Meta-Wrappers for All Functions

analyzeMeans <- function(...,digits=3){
  Output <- list(
    title="ANALYSIS OF MEANS",
    estimateMeans=formatFrame(ciMeans(...),digits=digits),
    testMeans=formatFrame(nhstMeans(...),digits=digits),
    standardizeMeans=formatFrame(smdMeans(...),digits=digits))
  plotMeans(...,digits=digits)  
  return(Output)
}

analyzeDifference <- function(...,digits=3){
  Output <- list(
    title="ANALYSIS OF A DIFFERENCE",
    estimateDifference=formatFrame(ciDifference(...),digits=digits),
    testDifference=formatFrame(nhstDifference(...),digits=digits),
    standardizeDifference=formatFrame(smdDifference(...),digits=digits))
  plotDifference(...,digits=digits)  
  return(Output)
}

analyzeContrast <- function(...,digits=3){
  Output <- list(
    title="ANALYSIS OF A CONTRAST",
    estimateContrast=formatFrame(ciContrast(...),digits=digits),
    testContrast=formatFrame(nhstContrast(...),digits=digits),
    standardizeContrast=formatFrame(smdContrast(...),digits=digits))
  plotContrast(...,digits=digits)  
  return(Output)
}
