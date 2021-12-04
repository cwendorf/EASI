# Estimation Approach to Statistical Inference
## Mean Relational Intervals

### Relational Intervals

.estimateMeansRelational <- function(x,...) 
  UseMethod(".estimateMeansRelational")

.estimateMeansRelational.wss <- function(DescStats,CorrStats,conf.level=.95) {
  results <- .estimateMeans.wss(DescStats,conf.level=conf.level)
  mymodel <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  dfe <- mymodel[3,2]
  mse <- mymodel[3,3]
  ntilde <- 1/mean(1/DescStats[,1]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,c(1,4,5)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

.estimateMeansRelational.bss <- function(DescStats,conf.level=.95) {
  results <- .estimateMeans.bss(DescStats,conf.level=conf.level)
  mymodel <- .describeMeansOmnibus.bss(DescStats)
  dfe <- mymodel[2,2]
  mse <- mymodel[2,3]
  ntilde <- 1/mean(1/DescStats[,1]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,c(1,4,5)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

.estimateMeansRelational.default <- function(...,conf.level=.95) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateMeansRelational.wss(DescStats,CorrStats,conf.level=conf.level)
}

.estimateMeansRelational.formula <- function(formula,conf.level=.95) {
  DescStats <- .describeMeans(formula)
  .estimateMeansRelational.bss(DescStats,conf.level=conf.level)
}

estimateMeansRelational <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansRelational(...)
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence and Relational Intervals for the Means"} else {names(results) <- main}  
  return(results)
}

### Confidence and Relational Interval Plots

plotMeansRelational <- function(x,...) 
  UseMethod("plotMeansRelational")

plotMeansRelational.wss <- function(DescStats,CorrStats,add=FALSE,main=NULL,ylab="Outcome",xlab="",conf.level=.95,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,col=rgb(.5,.5,.5,.4),border=NA,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- .unformatFrame(estimateMeansRelational(DescStats,CorrStats,conf.level=conf.level,...)[[1]])
  if(!add) {
  .cipMain(results[,c(1,2,3)],main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1)}  
  }
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=border)
}

plotMeansRelational.bss <- function(DescStats,add=FALSE,main=NULL,ylab="Outcome",xlab="",conf.level=.95,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,col=rgb(.5,.5,.5,.4),border=NA,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- .unformatFrame(estimateMeansRelational(DescStats,conf.level=conf.level,...)[[1]])
  if(!add) {.cipMain(results[,c(1,2,3)],main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)}
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=border)
}

plotMeansRelational.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,col=rgb(.5,.5,.5,.4),border=NA) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- .unformatFrame(estimateMeansRelational(...,conf.level=conf.level)[[1]])
  if(!add) {
  .cipMain(results[,c(1,2,3)],main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1)}
  }
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=border)
}

plotMeansRelational.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",conf.level=.95,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,col=rgb(.5,.5,.5,.4),border=NA,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  results <- .unformatFrame(estimateMeansRelational(formula,conf.level=conf.level,...)[[1]])
  if(!add) {.cipMain(results[,c(1,2,3)],main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)}
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=border)
}
