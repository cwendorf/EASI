# Estimation Approach to Statistical Inference
## Functions for Means

### Descriptive Functions

.trim <- function(x, trim=0, na.rm=TRUE, ...) {
  if(na.rm) x <- x[!is.na(x)]
  n <- length(x)
  if(trim > 0 && n > 0) {
     lo <- floor(n * trim) + 1
     hi <- n + 1 - lo
     x <- sort.int(x, partial = unique(c(lo, hi)))[lo:hi]
  }
  c(length(x),mean(x),sd(x))
}

describeMeans <- function(x,...) 
  UseMethod("describeMeans")

describeMeans.default <- function(...,trim=0,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- sapply(data,.trim,trim=trim)
  results <- t(results)
  colnames(results) <- c("N","M","SD")
  if(is.null(main)) {if(nrow(results)>1) {main="Descriptive Statistics for the Variables"} else {main="Descriptive Statistics for the Variable"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

describeMeans.formula <- function(formula,trim=0,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=describeTrims,trim=trim)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  if(is.null(main)) {if(nrow(results)>1) {main="Descriptive Statistics for the Groups"} else {main="Descriptive Statistics for the Group"}}  
  results <- list(results)
  names(results) <- main   
  return(results)
}

### Confidence Interval Functions

estimateMeans <- estimateMean <- function(x,...) 
  UseMethod("estimateMeans")

estimateMeans.wss <- estimateMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- data.frame(M=M,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main   
  return(results)
}

estimateMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

testMeans <- testMean <- function(x,...) 
  UseMethod("testMeans")
  
testMeans.wss <- testMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=Diff,SE=SE,df=df,t=t,p=p)
  rownames(results) <- rownames(DescStats)
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Means"} else {main="Hypothesis Test for the Mean"}}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main   
  return(results)
}

testMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  testMeans(DescStats,mu=mu,main=main,digits=digits)
}

testMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testMeans(DescStats,mu=mu,main=main,digits=digits)
}

### Confidence Interval Plot Functions

plotMeans <- plotMean <- function(x,...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add)
}

plotMeans.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add)
}

plotMeans.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMeans(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add)
}

plotMeans.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMeans(formula=formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add)
}
