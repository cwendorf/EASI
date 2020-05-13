# Estimation Approach to Statistical Inference
## Functions for Relational Intervals

### Relational Interval Function

estimateRelational <- function(x,...) 
  UseMethod("estimateRelational")

estimateRelational.wss <- function(DescStats,CorrStats,conf.level=.95,main=NULL,digits=3,...) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,...)[[1]])
  mymodel <- .unformatFrame(describeOmnibus(DescStats,CorrStats,...)[[1]])
  dfe <- mymodel[3,2]
  mse <- mymodel[3,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,c(1,4,5)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence and Relational Intervals for the Means"} else {names(results) <- main}  
  return(results)
}

estimateRelational.bss <- function(DescStats,conf.level=.95,main=NULL,digits=3,...) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,...)[[1]])
  mymodel <- .unformatFrame(describeOmnibus(DescStats,...)[[1]])
  dfe <- mymodel[2,2]
  mse <- mymodel[2,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,c(1,4,5)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence and Relational Intervals for the Means"} else {names(results) <- main}  
  return(results)
}

estimateRelational.default <- function(...,conf.level=.95,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]]) 
  estimateRelational(DescStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateRelational.formula <- function(formula,conf.level=.95,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateRelational(DescStats,conf.level=conf.level,main=main,digits=digits)
}

### Add Relational Intervals to Existing CI Plot

addRelational <- function(x,...) 
  UseMethod("addRelational")

addRelational.wss <- function(DescStats,CorrStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- .unformatFrame(estimateRelational(DescStats,CorrStats,conf.level=conf.level,...)[[1]][,c(1,4,5)])
  for (i in 1:nrow(results)) rect(i-.05,results[,2][i],i+.05,results[,3][i],col=col,border=NA)
}

addRelational.bss <- function(DescStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- .unformatFrame(estimateRelational(DescStats,conf.level=conf.level,...)[[1]][,c(1,4,5)])
  for (i in 1:nrow(results)) rect(i-.05,results[,2][i],i+.05,results[,3][i],col=col,border=NA)
}

addRelational.default <- function(...,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4)){
  results <- .unformatFrame(estimateRelational(...,conf.level=conf.level)[[1]][,c(1,4,5)])
  for (i in 1:nrow(results)) rect(i-.05,results[,2][i],i+.05,results[,3][i],col=col,border=NA)
}

addRelational.formula <- function(formula,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...){
  results <- .unformatFrame(estimateRelational(formula,conf.level=conf.level,...)[[1]][,c(1,4,5)])
  for (i in 1:nrow(results)) rect(i-.05,results[,2][i],i+.05,results[,3][i],col=col,border=NA)
}

### Plot Confidence and Relational Intervals

plotRelational <- function(x,...) 
  UseMethod("plotRelational")

plotRelational.wss <- function(DescStats,CorrStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- estimateMeans(DescStats,conf.level=conf.level,...)[[1]][,c(1,4,5)]
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1)}  
  addRelational(DescStats,CorrStats,conf.level=conf.level,...)
}

plotRelational.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,...)[[1]][,c(1,4,5)])
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
  addRelational(DescStats,conf.level=conf.level,...)
}

plotRelational.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- .unformatFrame(estimateMeans(...,conf.level=conf.level)[[1]][,c(1,4,5)])
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1)}   
  addRelational(...,conf.level=conf.level)
}

plotRelational.formula <- function(formula,main=NULL,ylab=NULL,xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  results <- .unformatFrame(estimateMeans(formula,conf.level=conf.level,...)[[1]][,c(1,4,5)])
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
  addRelational(formula,conf.level=conf.level,...)
}

