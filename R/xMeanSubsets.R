# Estimation Approach to Statistical Inference
## Mean Subsets

### Confidence Interval Functions

.estimateMeanSubsets <- function(x,...) 
  UseMethod(".estimateMeanSubsets")

.estimateMeanSubsets.default <- .estimateMeanSubsets.formula <- .estimateMeanSubsets.wss <- .estimateMeanSubsets.bss <- function(...,contrast,conf.level=.95,labels=NULL) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .estimateMeanContrast(...,contrast=con1,conf.level=conf.level)
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .estimateMeanContrast(...,contrast=con2,conf.level=conf.level)
  Subsets <- rbind(res2,res1)
  if(is.null(labels)) {rownames(Subsets) <- c("Neg Weighted","Pos Weighted")} else {rownames(Subsets) <- labels}
  Subsets <- list(Subsets)
  names(Subsets) <- "Confidence Intervals for the Mean Subsets"
  Diff <- .estimateMeanContrast(...,contrast=contrast,conf.level=conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Mean Contrast"  
  results <- c(Subsets,Diff)
  return(results)
}

estimateMeanSubsets <- function(...,main=NULL,digits=3) {
  results <- .estimateMeanSubsets(...)
  if(is.null(main)) {main <- names(results)} 
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanSubsets <- function(x,...) 
  UseMethod(".testMeanSubsets")

.testMeanSubsets.default <- .testMeanSubsets.formula <- .testMeanSubsets.wss <- .testMeanSubsets.bss <- function(...,contrast,labels=NULL) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .testMeanContrast(...,contrast=con1)
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .testMeanContrast(...,contrast=con2)
  Subsets <- rbind(res2,res1)
  if(is.null(labels)) {rownames(Subsets) <- c("Neg Weighted","Pos Weighted")} else {rownames(Subsets) <- labels}
  Subsets <- list(Subsets) 
  names(Subsets) <- "Hypothesis Tests for the Mean Subsets"
  Diff <- .testMeanContrast(...,contrast=contrast)
  Diff <- list(Diff)  
  names(Diff) <- "Hypothesis Tests for the Mean Contrast"    
  results <- c(Subsets,Diff)
  return(results)
}

testMeanSubsets <- function(...,main=NULL,digits=3) {
  results <- .testMeanSubsets(...)
  if(is.null(main)) {main <- names(results)} 
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Interval Plots

plotMeanSubsets <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Difference",pch=pch,col=col)
}
