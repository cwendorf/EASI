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

plotMeanSubsets <- function(...,contrast,add=FALSE,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,pos=c(2,2,4),connect=NULL,ylim=NULL,digits=3,pch=c(15,15,17),col="black",offset=0,intervals=TRUE) {
  results <- estimateMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  if(is.null(connect) & length(list(...))>1) {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,rope=rope,digits=digits,connect=connect,pos=pos,col=col,offset=offset,intervals=intervals)
  invisible(eval(...))
}
