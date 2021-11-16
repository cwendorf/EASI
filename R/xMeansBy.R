# Estimation Approach to Statistical Inference
## Means for Factorial and Mixed Designs

#### Descriptives

.describeMeansBy <- function(...) 
  UseMethod(".describeMeansBy")

.describeMeansBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,.describeMeans)
  return(results)
}

.describeMeansBy.formula <- function(formula,by) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  FactorialData <- data.frame(by,Group,Outcome)
  SplitData <- split(FactorialData,by)
  results <- lapply(SplitData,function(x) with(x,.describeMeans(Outcome~Group)))
  return(results)
}

describeMeansBy <- function(...,main=NULL,digits=3) {
  results <- .describeMeansBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Descriptive Statistics for the Data"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Confidence Intervals

.estimateMeansBy <- function(...) 
  UseMethod(".estimateMeansBy")

.estimateMeansBy.wss <- .estimateMeansBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeans.wss(ListDescStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateMeansBy.default <- function(...,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  results <- .estimateMeansBy.wss(ListDescStats,conf.level=conf.level)
  return(results)
}

.estimateMeansBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateMeansBy.bss(ListDescStats,conf.level=conf.level)
  return(results)
}

estimateMeansBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- .estimateMeansBy(...,conf.level=conf.level)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Confidence Intervals for the Means"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeansBy <- function(...) 
  UseMethod(".testMeansBy")

.testMeansBy.wss <- .testMeansBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeans.wss(ListDescStats[[i]],mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeansBy.default <- function(...,by,mu=0) {
  ListDescStats <- .describeMeansBy(...,by=by)
  results <- .testMeansBy.wss(ListDescStats,mu=mu)
  return(results)
}

.testMeansBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .testMeansBy.bss(ListDescStats,mu=mu)
  return(results)
}

testMeansBy <- function(...,mu=0,main=NULL,digits=3) {
  results <- .testMeansBy(...,mu=mu)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Hypothesis Tests for the Means"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Confidence Interval Plots

plotMeansBy <- function(...) 
  UseMethod("plotMeansBy")

plotMeansBy.wss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeansBy(ListDescStats,conf.level=conf.level)
  for (i in 1:nlevels(by)) {
    title=names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE)
}

plotMeansBy.bss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeansBy(ListDescStats,conf.level=conf.level)
  print(results)
  for (i in 1:length(results)) {
    title=names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE)
}

plotMeansBy.default <- function(...,by,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeansBy(...,by=by,conf.level=conf.level)
  for (i in 1:nlevels(by)) {
    title=names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE) 
}

plotMeansBy.formula <- function(formula,by,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeansBy(formula,by=by,conf.level=conf.level)
  for (i in 1:nlevels(by)) {
    title=names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE) 
}

plotMeansInter <- function(...) 
  UseMethod("plotMeansInter")

plotMeansInter.wss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- .estimateMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "wss"  
  .cipInter(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansInter.bss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- .estimateMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "bss"  
  .cipInter(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansInter.default <- function(...,by,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- .estimateMeansBy(...,by=by,conf.level=conf.level)
  class(results) <- "wss"
  .cipInter(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansInter.formula <- function(formula,by,main=NULL,ylab=NULL,xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  results <- .estimateMeansBy(formula,by=by,conf.level=conf.level)
  class(results) <- "bss"
  .cipInter(results,main=main,ylab=ylab,xlab=xlab,col=col)
}
