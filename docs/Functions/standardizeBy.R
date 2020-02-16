# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### Standardized Mean Difference Functions

#### SMD Function for Means

smdMeansBy <- function(...) 
  UseMethod("smdMeansBy")

smdMeansBy.wss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdMeans(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdMeansBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdMeans(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

smdMeansBy.default <- function(...,by,mu=0,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdMeans(x,mu=mu,conf.level=conf.level))
  return(results)
}

smdMeansBy.formula <- function(formula,by,mu=0,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) smdMeans(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeMeansBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(lapply(smdMeansBy(...),formatFrame,digits=digits))
}

#### SMD Function for Mean Differences/Comparisons

smdDifferenceBy <- function(...) 
  UseMethod("smdDifferenceBy")

smdDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdDifferenceBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdDifference(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

smdDifferenceBy.default <- function(...,by,mu=0,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdDifference(x,mu=mu,conf.level=conf.level))
  return(results)
}

smdDifferenceBy.formula <- function(formula,by,mu=0,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdDifference(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeDifferenceBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS\n\n")
  print(lapply(smdDifferenceBy(...),formatFrame,digits=digits)) 
}

#### SMD Function for Mean Contrasts

smdContrastBy <- function(...) 
  UseMethod("smdContrastBy")

smdContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdContrast(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

smdContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

smdContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

standardizeContrastBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS\n\n")
  print(lapply(smdContrastBy(...),formatFrame,digits=digits)) 
}
