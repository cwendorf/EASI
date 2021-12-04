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

plotStandardizedMeanSubsets <- function(x,...) 
  UseMethod("plotStandardizedMeanSubsets")

plotStandardizedMeanSubsets.wss <- function(CompStats,CorrStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanSubsets(CompStats,CorrStats,contrast=contrast,conf.level=conf.level,mu=mu,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanSubsets.bss <- function(CompStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanSubsets(CompStats,contrast=contrast,conf.level=conf.level,mu=mu,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

plotStandardizedMeanSubsets.default <- function(...,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,mu=mu,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanSubsets.formula <- function(formula,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanSubsets(formula,contrast=contrast,conf.level=conf.level,mu=mu,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}
