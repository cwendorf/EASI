# Estimation Approach to Statistical Inference
## Mean Subsets

### Confidence Interval Functions

.estimateStandardizedMeanSubsets <- function(x,...) 
  UseMethod(".estimateStandardizedMeanSubsets")

.estimateStandardizedMeanSubsets.default <- .estimateStandardizedMeanSubsets.formula <- .estimateStandardizedMeanSubsets.wss <- .estimateStandardizedMeanSubsets.bss <- function(...,contrast,conf.level=.95,labels=NULL) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .estimateStandardizedMeanContrast(...,contrast=con1,conf.level=conf.level)
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .estimateStandardizedMeanContrast(...,contrast=con2,conf.level=conf.level)
  Subsets <- rbind(res2,res1)
  if(is.null(labels)) {rownames(Subsets) <- c("Neg Weighted","Pos Weighted")} else {rownames(Subsets) <- labels}
  Subsets <- list(Subsets)
  names(Subsets) <- "Confidence Intervals for the Standardized Mean Subsets"
  Diff <- .estimateStandardizedMeanContrast(...,contrast=contrast,conf.level=conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Standardized Mean Contrast"  
  results <- c(Subsets,Diff)
  return(results)
}

estimateStandardizedMeanSubsets <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeanSubsets(...)
  if(is.null(main)) {main <- names(results)} 
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanSubsets <- function(x,...) 
  UseMethod("plotStandardizedMeanSubsets")

plotStandardizedMeanSubsets.wss <- plotStandardizedMeanSubsets.default <- function(...,contrast,add=FALSE,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,pos=c(2,2,4),connect=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black",offset=0,intervals=TRUE) {
  results <- estimateStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,rope=rope,digits=digits,connect=connect,pos=pos,pch=pch,col=col,offset=offset,intervals=intervals)
}

plotStandardizedMeanSubsets.bss <- plotStandardizedMeanSubsets.formula <- function(...,contrast,add=FALSE,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,pos=c(2,2,4),connect=FALSE,ylim=NULL,digits=3,pch=c(24,24,24),col="black",offset=0,intervals=TRUE) {
  results <- estimateStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  if(is.null(main)) {main="Confidence Intervals for the Standardized Mean Subsets"}
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,rope=rope,digits=digits,connect=connect,pos=pos,pch=pch,col=col,offset=offset,intervals=intervals)
}
