# Estimation Approach to Statistical Inference
## Functions for Means and Mean Differences

### Confidence Interval Functions

#### CI Function for Mean Subsets

estimateSubsets <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .unformatFrame(estimateContrast(...,contrast=con1,conf.level=conf.level)[[1]])
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .unformatFrame(estimateContrast(...,contrast=con2,conf.level=conf.level)[[1]])
  results <- rbind(res2,res1)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Subset Means"
  return(results)
}

estimateSubsetContrast <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  Subsets <- estimateSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,digits=digits)
  Diff <- estimateContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- c(Subsets,Diff)
  return(results)
}

### Plot Functions

#### Plot Function for Confidence Intervals of Mean Subsets

plotSubsetContrast <- function(x,...) 
  UseMethod("plotSubsetContrast")

plotSubsetContrast.wss <- function(CompStats,CorrStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateSubsetContrast(CompStats,CorrStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Subset Contrast"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotSubsetContrast.bss <- function(CompStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateSubsetContrast(CompStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Subset Contrast"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=FALSE)
}

plotSubsetContrast.default <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateSubsetContrast(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Subset Contrast"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotSubsetContrast.formula <- function(formula,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateSubsetContrast(formula,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Subset Contrast"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=FALSE)
}
