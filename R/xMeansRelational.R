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
  if(is.null(main)) {main <- "Confidence and Relational Intervals for the Means"} 
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}

### Confidence and Relational Interval Plots

plotMeansRelational <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",conf.level=.95,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,col=rgb(.5,.5,.5,.4),border=NA) {
  results <- estimateMeansRelational(...,conf.level=conf.level)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]])
  if(!add) {.intervalsMain(results[,c(1,2,3)],main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect)}
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=border)
}
