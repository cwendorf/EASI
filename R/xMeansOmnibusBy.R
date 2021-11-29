# Estimation Approach to Statistical Inference
## Mean Omnibus Analyses (with By Option)

### Descriptives

.describeMeansOmnibusBy <- function(x,...) 
  UseMethod(".describeMeansOmnibusBy")

.describeMeansOmnibusBy.wss <- function(ListDescStats,ListCorrStats) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansOmnibus.wss(ListDescStats[[i]],ListCorrStats[[i]])}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.describeMeansOmnibusBy.bss <- function(ListDescStats) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansOmnibus.bss(ListDescStats[[i]])}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.describeMeansOmnibusBy.default <- function(...,by) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)  
  results <- .describeMeansOmnibusBy.wss(ListDescStats,ListCorrStats)
  return(results)
}

.describeMeansOmnibusBy.formula <- function(formula,by) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .describeMeansOmnibusBy.bss(ListDescStats)
  return(results)
}

describeMeansOmnibusBy <- function(...,main=NULL,digits=3) {
  results <- .describeMeansOmnibusBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Source Table"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibusBy <- function(x,...) 
  UseMethod(".testMeansOmnibusBy")

.testMeansOmnibusBy.wss <- function(ListDescStats,ListCorrStats) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeansOmnibus.wss(ListDescStats[[i]],ListCorrStats[[i]])}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeansOmnibusBy.bss <- function(ListDescStats) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeansOmnibus.bss(ListDescStats[[i]])}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeansOmnibusBy.default <- function(...,by) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)  
  results <- .testMeansOmnibusBy.wss(ListDescStats,ListCorrStats)
  return(results)
}

.testMeansOmnibusBy.formula <- function(formula,by) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .testMeansOmnibusBy.bss(ListDescStats)
  return(results)
}

testMeansOmnibusBy <- function(...,main=NULL,digits=3) {
  results <- .testMeansOmnibusBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Hypothesis Test"}
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
