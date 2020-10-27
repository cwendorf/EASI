# Estimation Approach to Statistical Inference
## Functions for Mean Subsets

### Confidence Interval Functions

estimateMeansSubsets <-  estimateMeanSubsets <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .unformatFrame(estimateMeanContrast(...,contrast=con1,conf.level=conf.level)[[1]])
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .unformatFrame(estimateMeanContrast(...,contrast=con2,conf.level=conf.level)[[1]])
  Diff <- estimateMeanContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- rbind(res2,res1,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Mean Subsets"
  return(results)
}

### Confidence Interval Plot Functions

plotMeansSubsets <- plotMeanSubsets <- function(x,...) 
  UseMethod("plotMeanSubsets")

plotMeanSubsets.wss <- function(CompStats,CorrStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSubsets(CompStats,CorrStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE)
}

plotMeanSubsets.bss <- function(CompStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSubsets(CompStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}

plotMeanSubsets.default <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE)
}

plotMeanSubsets.formula <- function(formula,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSubsets(formula,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}
