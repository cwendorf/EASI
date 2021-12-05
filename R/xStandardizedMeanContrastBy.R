# Estimation Approach to Statistical Inference
### Standardized Mean Contrast (with By Option))

### Confidence Intervals

.estimateStandardizedMeanContrastBy <- function(...) 
  UseMethod(".estimateStandardizedMeanContrastBy")

.estimateStandardizedMeanContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeanContrast.wss(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeanContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeanContrast.bss(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeanContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)
  results <- .estimateStandardizedMeanContrastBy.wss(ListDescStats,ListCorrStats,contrast=contrast,conf.level=conf.level)
  return(results)
}

.estimateStandardizedMeanContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateStandardizedMeanContrastBy.bss(ListDescStats,contrast=contrast,conf.level=conf.level)
  return(results)
}

estimateStandardizedMeanContrastBy <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeanContrastBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Confidence Interval for the Standardized Mean Contrast"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
