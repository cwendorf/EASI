# Estimation Approach to Statistical Inference
## Functions for Mean Complex Contrasts

### Confidence Interval Functions

.easiMeanComplex <- function(...,contrast1,contrast2,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  res1 <- .unformatFrame(estimateMeanContrast(...,contrast=contrast1,conf.level=conf.level)[[1]])
  res2 <- .unformatFrame(estimateMeanContrast(...,contrast=contrast2,conf.level=conf.level)[[1]])
  results <- rbind(res1,res2)
  if(is.null(labels)) {rownames(results) <- c("Contrast1","Contrast2")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Mean Contrasts"
  return(results)
}

estimateMeansComplex <- estimateMeanComplex <- function(x,...) 
  UseMethod("estimateMeanComplex")

estimateMeanComplex.default <- estimateMeanComplex.formula <- estimateMeanComplex.wss <- estimateMeanComplex.bss <- function(...,contrast1,contrast2,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  Complex <- .easiMeanComplex(...,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,digits=digits)
  contrast <- contrast2-contrast1
  Diff <- estimateMeanContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- c(Complex,Diff)
  return(results)
}

### Null Hypothesis Significance Test Functions

.nhstMeanComplex <- function(...,contrast1,contrast2,labels=NULL,main=NULL,digits=3) {
  res1 <- .unformatFrame(testMeanContrast(...,contrast=contrast1)[[1]])
  res2 <- .unformatFrame(testMeanContrast(...,contrast=contrast2)[[1]])
  results <- rbind(res1,res2)
  if(is.null(labels)) {rownames(results) <- c("Contrast1","Contrast2")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Hypthesis Tests for the Mean Contrasts"
  return(results)
}

testMeansComplex <- testMeanComplex <- function(x,...) 
  UseMethod("testMeanComplex")

testMeanComplex.default <- testMeanComplex.formula <- testMeanComplex.wss <- testMeanComplex.bss <- function(...,contrast1,contrast2,labels=NULL,main=NULL,digits=3) {
  Complex <- .nhstMeanComplex(...,contrast1=contrast1,contrast2=contrast2,labels=labels,digits=digits)
  contrast <- contrast2-contrast1
  Diff <- testMeanContrast(...,contrast=contrast,digits=digits)
  results <- c(Complex,Diff)
  return(results)
}

### Confidence Interval Plot Functions

plotMeansComplex <- plotMeanComplex <- function(x,...) 
  UseMethod("plotMeanComplex")

plotMeanComplex.wss <- function(CompStats,CorrStats,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComplex(CompStats,CorrStats,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Contrast")
}

plotMeanComplex.bss <- function(CompStats,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComplex(CompStats,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Constrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Contrast")
}

plotMeanComplex.default <- function(...,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComplex(...,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Contrast")
}

plotMeanComplex.formula <- function(formula,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComplex(formula,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Contrast")
}
