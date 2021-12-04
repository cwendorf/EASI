# Estimation Approach to Statistical Inference
## Standardized Mean Subsets

### Confidence Intervals

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
  rn <- names(results)
  results <- .formatList(results,digits=digits)
  names(results) <- rn
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanSubsets <- function(...,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main="Confidence Intervals for the Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,slab="Standardized Mean Difference",connect=FALSE,pch=pch,col=col)
}
