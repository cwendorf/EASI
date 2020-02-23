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

analyzeMeans <- function(...,digits=3) {
  cat("\nANALYSES OF THE MEANS\n\n")
  plotMeans(...,digits=digits)
  results <- allMeans(...)
  names(results) <- c("CONFIDENCE INTERVALS FOR THE MEANS","HYPOTHESIS TESTS FOR THE MEANS","CONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS")
  formatList(results,digits)
}

### Meta-Wrapper for Mean Difference/Comparison Functions

allDifference <- function(...) {
  output <- list(
  ciDifference=ciDifference(...),
  nhstDifference=nhstDifference(...),
  smdDifference=smdDifference(...))
  return(output)
}

analyzeDifference <- function(...,digits=3) {
  cat("\nANALYSES OF THE COMPARISON\n\n")
  plotDifference(...,digits=digits)
  results <- allDifference(...)
  names(results) <- c("CONFIDENCE INTERVAL FOR THE COMPARISON","HYPOTHESIS TEST FOR THE COMPARISON","CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON")
  formatList(results,digits)
}

analyzeComparison <- function(...,digits=3) {
  cat("\nANALYSES OF THE COMPARISON\n\n")
  plotDifference(...,digits=digits)
  results <- allDifference(...)
  names(results) <- c("CONFIDENCE INTERVAL FOR THE COMPARISON","HYPOTHESIS TEST FOR THE COMPARISON","CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON")
  formatList(results,digits)
}

### Meta-Wrapper for Mean Contrast Functions

allContrast <- function(...) {
  output <- list(
  ciContrast=ciContrast(...),
  nhstContrast=nhstContrast(...),
  smdContrast=smdContrast(...))
  return(output)
}

analyzeContrast <- function(...,digits=3) {
  cat("\nANALYSES OF THE CONTRAST\n\n")
  plotContrast(...,digits=digits)
  results <- allContrast(...)
  names(results) <- c("CONFIDENCE INTERVAL FOR THE CONTRAST","HYPOTHESIS TEST FOR THE CONTRAST","CONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST")
  formatList(results,digits)
}
