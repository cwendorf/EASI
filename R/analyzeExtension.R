# Estimation Approach to Statistical Inference
## Extension for Consolidating Analyses

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASIFUNCTIONS INTO R

### Meta-Wrapper for Mean Functions

allMeans <- function(...) {
  output <- list(
  ciMeans=ciMeans(...),
  nhstMeans=nhstMeans(...),
  smdMeans=smdMeans(...))
  return(output)
}

analyzeMeans <- function(...,main=NULL,digits=3) {
  results <- formatList(allMeans(...),digits=digits)
  names(results) <- c("Confidence Intervals for the Means","Hypothesis Tests for the Means","Confidence Intervals for the Standardized Means")
  print(results)
  plotMeans(...,main=main,digits=digits)
}

### Meta-Wrapper for Mean Difference/Comparison Functions

allDifference <- function(...) {
  output <- list(
  ciDifference=ciDifference(...),
  nhstDifference=nhstDifference(...),
  smdDifference=smdDifference(...))
  return(output)
}

analyzeDifference <- analyzeComparison <- function(...,main=NULL,digits=3) {
  results <- formatList(allDifference(...),digits=digits)
  names(results) <- c("Confidence Interval for the Comparison","Hypothesis Test for the Comparison","Confidence Interval for the Standardized Comparison")
  print(results)
  plotDifference(...,main=main,digits=digits)
}

### Meta-Wrapper for Mean Contrast Functions

allContrast <- function(...) {
  output <- list(
  ciContrast=ciContrast(...),
  nhstContrast=nhstContrast(...),
  smdContrast=smdContrast(...))
  return(output)
}

analyzeContrast <- function(...,main=NULL,digits=3) {
  results <- formatList(allContrast(...),digits=digits)
  names(results) <- c("Confidence Interval for the Contrast","Hypothesis Test for the Contrast","Confidence Interval for the Standardized Contrast")
  print(results)
  plotContrast(...,main=main,digits=digits)
}
