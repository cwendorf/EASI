# Estimation Approach to Statistical Inference
## Mean Relational Intervals

### Relational Intervals

.estimateMeansRelational <- function(x,...) 
  UseMethod(".estimateMeansRelational")

.estimateMeansRelational.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  results <- .estimateMeans.wss(DescStats,conf.level=conf.level)
  mymodel <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  dfe <- mymodel[3,2]
  mse <- mymodel[3,3]
  ntilde <- 1/mean(1/DescStats[,1]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,1],rill,riul,results[,c(4,5)])
  colnames(results) <- c("M","RI.LL","RI.UL","CI.LL","CI.UL")
  return(results)
}

.estimateMeansRelational.bss <- function(DescStats,conf.level=.95,...) {
  results <- .estimateMeans.bss(DescStats,conf.level=conf.level)
  mymodel <- .describeMeansOmnibus.bss(DescStats)
  dfe <- mymodel[2,2]
  mse <- mymodel[2,3]
  ntilde <- 1/mean(1/DescStats[,1]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,1]-a1*a2/2
  riul <- results[,1]+a1*a2/2
  results <- data.frame(results[,1],rill,riul,results[,c(4,5)])
  colnames(results) <- c("M","RI.LL","RI.UL","CI.LL","CI.UL")
  return(results)
}

.estimateMeansRelational.default <- function(frame,conf.level=.95,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansRelational.wss(DescStats,CorrStats,conf.level=conf.level)
}

.estimateMeansRelational.formula <- function(formula,conf.level=.95,...) {
  DescStats <- .describeMeans(formula)
  .estimateMeansRelational.bss(DescStats,conf.level=conf.level)
}

estimateMeansRelational <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansRelational(...)
  if(is.null(main)) {main <- "Confidence and Relational Intervals for the Means"} 
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}

### Confidence and Relational Interval Plots

plotMeansRelational <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",conf.level=.95,line=NULL,rope=NULL,values=TRUE,pos=2,connect=NULL,ylim=NULL,digits=3,col="black",border=NA,offset=0) {
  results <- estimateMeansRelational(...,conf.level=conf.level)
  if(is.null(connect) & length(list(...))>1) {connect=TRUE} else {connect=FALSE}
  if(!add) {plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col)}
  results <- .unformatFrame(results[[1]])
  rect(1:nrow(results)+offset-.05,results[,2],1:nrow(results)+offset+.05,results[,3],border=border,col=.colorTransparent(col,50))
}
