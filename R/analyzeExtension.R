# Estimation Approach to Statistical Inference
## Extension for Consolidating Analyses

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Meta-Wrappers for All Functions

analyzeMeans <- function(...,digits=3) {
  estimateMeans(...,digits=digits)
  testMeans(...,digits=digits)
  standardizeMeans(...,digits=digits)
  plotMeans(...,digits=digits)  
}

analyzeDifference <- function(...,digits=3) {
  estimateDifference(...,digits=digits)
  testDifference(...,digits=digits)
  standardizeDifference(...,digits=digits)
  plotDifference(...,digits=digits)  
}

analyzeContrast <- function(...,digits=3) {
  estimateContrast(...,digits=digits)
  testContrast(...,digits=digits)
  standardizeContrast(...,digits=digits)
  plotContrast(...,digits=digits)  
}
