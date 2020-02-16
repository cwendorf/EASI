# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### Null Hypothesis Significance Test Functions 

#### NHST Function for Means

nhstMeansBy <- function(...) 
  UseMethod("nhstMeansBy")

nhstMeansBy.wss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstMeans(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstMeansBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstMeans(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

nhstMeansBy.default <- function(...,by,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstMeans(x,mu=mu))
  return(results)
}

nhstMeansBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) nhstMeans(x,mu=mu))
  return(results)
}

testMeansBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(lapply(nhstMeansBy(...),formatFrame,digits=digits))
}

##### NHST Function for Mean Differences/Comparisons

nhstDifferenceBy <- function(...) 
  UseMethod("nhstDifferenceBy")

nhstDifferenceBy.wss <- function(ListDescStats,ListCorrStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstDifference(ListDescStats[[i]],ListCorrStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstDifferenceBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstDifference(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

nhstDifferenceBy.default <- function(...,by,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstDifference(x,mu=mu))
  return(results)
}

nhstDifferenceBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstDifference(x,mu=mu))
  return(results)
}

testDifferenceBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE COMPARISONS\n\n")
  print(lapply(nhstDifferenceBy(...),formatFrame,digits=digits))
}

#### NHST Function for Mean Contrasts

nhstContrastBy <- function(...) 
  UseMethod("nhstContrastBy")

nhstContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstContrastBy.bss <- function(ListDescStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstContrast(ListDescStats[[i]],contrast=contrast,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

nhstContrastBy.default <- function(...,by,contrast,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstContrast(x,contrast=contrast,mu=mu))
  return(results)
}

nhstContrastBy.formula <- function(formula,by,contrast,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstContrast(x,contrast=contrast,mu=mu))
  return(results)
}

testContrastBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS\n\n")
  print(lapply(nhstContrastBy(...),formatFrame,digits=digits)) 
}
