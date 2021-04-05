# Estimation Approach to Statistical Inference
## Standardized Mean Subsets

### Confidence Intervals

.easiStandardizedMeanSubsets <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .unformatFrame(estimateStandardizedMeanContrast(...,contrast=con1,conf.level=conf.level)[[1]])
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .unformatFrame(estimateStandardizedMeanContrast(...,contrast=con2,conf.level=conf.level)[[1]])
  results <- rbind(res2,res1)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Standardized Mean Subsets"
  return(results)
}

estimateStandardizedMeanSubsets <- function(x,...) 
  UseMethod("estimateStandardizedMeanSubsets")

estimateStandardizedMeanSubsets.default <- estimateStandardizedMeanSubsets.formula <- estimateStandardizedMeanSubsets.wss <- estimateStandardizedMeanSubsets.bss <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  Subsets <- .easiStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,digits=digits)
  Diff <- estimateStandardizedMeanContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- c(Subsets,Diff)
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanSubsets <- function(x,...) 
  UseMethod("plotStandardizedMeanSubsets")

plotStandardizedMeanSubsets.wss <- function(CompStats,CorrStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanSubsets(CompStats,CorrStats,contrast=contrast,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch)
}

plotStandardizedMeanSubsets.bss <- function(CompStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanSubsets(CompStats,contrast=contrast,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch)
}

plotStandardizedMeanSubsets.default <- function(...,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanSubsets(...,contrast=contrast,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch)
}

plotStandardizedMeanSubsets.formula <- function(formula,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanSubsets(formula,contrast=contrast,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch)
}
