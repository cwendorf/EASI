# Estimation Approach to Statistical Inference
## Means

### Descriptives

describeMeans <- function(x,...) 
  UseMethod("describeMeans")

describeMeans.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- cbind(N=N,M=M,SD=SD)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

describeMeans.formula <- function(formula,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=describeMeans)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  results <- list(results)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

### Confidence Intervals

estimateMeans <- function(x,...) 
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

### Null Hypothesis Significance Tests

testMeans <- function(x,...) 
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

### Confidence Interval Plots

plotMeans <- function(x,...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add,pch=pch,col=col)
}

plotMeans.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
}

plotMeans.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- .unformatFrame(estimateMeans(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add,pch=pch,col=col)
}

plotMeans.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- .unformatFrame(estimateMeans(formula=formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
}
