# Estimation Approach to Statistical Inference
## Mean Contrast (with By Option)

### Confidence Intervals

.estimateMeanContrastBy <- function(...) 
  UseMethod(".estimateMeanContrastBy")

.estimateMeanContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeanContrast.wss(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateMeanContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeanContrast.bss(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateMeanContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)
  results <- .estimateMeanContrastBy.wss(ListDescStats,ListCorrStats,contrast=contrast,conf.level=conf.level)
  return(results)
}

.estimateMeanContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateMeanContrastBy.bss(ListDescStats,contrast=contrast,conf.level=conf.level)
  return(results)
}

estimateMeanContrastBy <- function(...,contrast,conf.level=.95,main=NULL,digits=3) {
  results <- .estimateMeanContrastBy(...,contrast=contrast,conf.level=conf.level)
  if(is.null(main)) {main <- "Confidence Interval for the Mean Contrast"} 
  main <-  paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeanContrastBy <- function(...) 
  UseMethod(".testMeanContrastBy")

.testMeanContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeanContrast.wss(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeanContrastBy.bss <- function(ListDescStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeanContrast.bss(ListDescStats[[i]],contrast=contrast,mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeanContrastBy.default <- function(...,by,contrast,mu=0) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)  
  results <- .testMeanContrastBy.wss(ListDescStats,ListCorrStats,contrast=contrast,mu=mu)
  return(results)
}

.testMeanContrastBy.formula <- function(formula,by,contrast,mu=0) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .testMeanContrastBy.bss(ListDescStats,contrast=contrast,mu=mu)
  return(results)
}

testMeanContrastBy <- function(...,contrast,mu=0,main=NULL,digits=3) {
  results <- .testMeanContrastBy(...,contrast=contrast,mu=mu)
  if(is.null(main)) {main <- "Hypothesis Test for the Mean Contrast"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Interval Plots

plotMeanContrastBy <- function(...,by,contrast,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeanContrastBy(...,by=by,contrast=contrast,conf.level=conf.level)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  for (i in 1:nlevels(by)) {
    title <- names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE) 
}
