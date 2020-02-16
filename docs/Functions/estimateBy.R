# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### Confidence Interval Functions

#### CI Function for Means

ciMeansBy <- function(...) 
  UseMethod("ciMeansBy")

ciMeansBy.wss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciMeansBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

ciMeansBy.default <- function(...,by,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciMeans(x,conf.level=conf.level))
  return(results)
}

ciMeansBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) ciMeans(x,conf.level=conf.level))
  return(results)
}

estimateMeansBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
  print(lapply(ciMeansBy(...),formatFrame,digits=digits))
}

#### CI Function for Mean Differences/Comparisons

ciDifferenceBy <- function(...) 
  UseMethod("ciDifferenceBy")

ciDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciDifferenceBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciDifference(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

ciDifferenceBy.default <- function(...,by,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciDifference(x,conf.level=conf.level))
  return(results)
}

ciDifferenceBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciDifference(x,conf.level=conf.level))
  return(results)
}

estimateDifferenceBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE COMPARISONS\n\n")
  print(lapply(ciDifferenceBy(...),formatFrame,digits=digits))
}

#### CI Function for Mean Contrasts

ciContrastBy <- function(...) 
  UseMethod("ciContrastBy")

ciContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciContrast(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

ciContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

ciContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

estimateContrastBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  print(lapply(ciContrastBy(...),formatFrame,digits=digits))  
}
