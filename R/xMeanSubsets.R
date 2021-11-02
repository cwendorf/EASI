# Estimation Approach to Statistical Inference
## Mean Subsets

### Confidence Interval Functions

estimateMeanSubsets <- function(x,...) 
  UseMethod("estimateMeanSubsets")

estimateMeanSubsets.default <- estimateMeanSubsets.formula <- estimateMeanSubsets.wss <- estimateMeanSubsets.bss <- function(...,contrast,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .unformatFrame(estimateMeanContrast(...,contrast=con1,conf.level=conf.level)[[1]])
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .unformatFrame(estimateMeanContrast(...,contrast=con2,conf.level=conf.level)[[1]])
  Subsets <- rbind(res2,res1)
  if(is.null(labels)) {rownames(Subsets) <- c("Neg Weighted","Pos Weighted")} else {rownames(Subsets) <- labels}
  Subsets <- .formatList(list(Subsets),digits=digits)
  names(Subsets) <- "Confidence Intervals for the Mean Subsets"
  Diff <- estimateMeanContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- c(Subsets,Diff)
  return(results)
}

### Null Hypothesis Significance Tests

testMeanSubsets <- function(x,...) 
  UseMethod("testMeanSubsets")

testMeanSubsets.default <- testMeanSubsets.formula <- testMeanSubsets.wss <- testMeanSubsets.bss <- function(...,contrast,labels=NULL,main=NULL,digits=3) {
  con1 <- ifelse(contrast<0,0,contrast)
  res1 <- .unformatFrame(testMeanContrast(...,contrast=con1)[[1]])
  con2 <- ifelse(contrast>0,0,abs(contrast))
  res2 <- .unformatFrame(testMeanContrast(...,contrast=con2)[[1]])
  Subsets <- rbind(res2,res1)
  if(is.null(labels)) {rownames(Subsets) <- c("Neg Weighted","Pos Weighted")} else {rownames(Subsets) <- labels}
  Subsets <- .formatList(list(Subsets),digits=digits)
  names(Subsets) <- "Hypothesis Tests for the Mean Subsets"
  Diff <- testMeanContrast(...,contrast=contrast,digits=digits)
  results <- c(Subsets,Diff)
  return(results)
}

### Confidence Interval Plots

plotMeanSubsets <- function(x,...) 
  UseMethod("plotMeanSubsets")

plotMeanSubsets.wss <- function(CompStats,CorrStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanSubsets(CompStats,CorrStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Difference",pch=pch,col=col)
}

plotMeanSubsets.bss <- function(CompStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanSubsets(CompStats,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Difference",pch=pch,col=col)
}

plotMeanSubsets.default <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanSubsets(...,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Difference",pch=pch,col=col)
}

plotMeanSubsets.formula <- function(formula,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanSubsets(formula,contrast=contrast,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Subsets"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Difference",pch=pch,col=col)
}
