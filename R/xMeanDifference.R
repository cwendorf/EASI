# Estimation Approach to Statistical Inference
## Mean Differences

### Confidence Intervals

.estimateMeanDifference <- function(x,...) 
  UseMethod(".estimateMeanDifference")
  
.estimateMeanDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,labels=NULL) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  if(is.null(labels)) {rownames(results) <- c("Comparison")} else {rownames(results) <- labels}
  return(results)
}

.estimateMeanDifference.bss <- function(CompStats,mu=0,conf.level=.95,labels=NULL) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  if(is.null(labels)) {rownames(results) <- c("Comparison")} else {rownames(results) <- labels}
  return(results)
}

.estimateMeanDifference.default <- function(...,mu=0,conf.level=.95,labels=NULL) {
  CompStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateMeanDifference.wss(CompStats,CorrStats,conf.level=conf.level,labels=labels)
}

.estimateMeanDifference.formula <- function(formula,mu=0,conf.level=.95,labels=NULL) {
  CompStats <- .describeMeans(formula)
  .estimateMeanDifference.bss(CompStats,conf.level=conf.level,labels=labels)
}

estimateMeanDifference <- function(...,main=NULL,digits=3) {
  results <- .estimateMeanDifference(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results)="Confidence Interval for the Mean Difference"} else {names(results) <- main}
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanDifference <- function(x,...) 
  UseMethod(".testMeanDifference")
  
.testMeanDifference.wss <- function(CompStats,CorrStats,mu=0,labels=NULL) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,df=df,t=t,p=p)
  if(is.null(labels)) {rownames(results) <- c("Comparison")} else {rownames(results) <- labels}
  return(results)
}

.testMeanDifference.bss <- function(CompStats,mu=0,labels=NULL) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,df=df,t=t,p=p)
  if(is.null(labels)) {rownames(results) <- c("Comparison")} else {rownames(results) <- labels}
  return(results)
}

.testMeanDifference.default <- function(...,mu=0,labels=NULL) {
  CompStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .testMeanDifference.wss(CompStats,CorrStats,mu=mu,labels=labels)
}

.testMeanDifference.formula <- function(formula,mu=0,labels=NULL) {
  CompStats <- .describeMeans(formula)
  .testMeanDifference.bss(CompStats,mu=mu,labels=labels)
}

testMeanDifference <- function(...,main=NULL,digits=3) {
  results <- .testMeanDifference(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results)="Hypothesis Test for the Mean Difference"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Plots

plotMeanDifference <- function(...,main=NULL,digits=3,ylab="Mean Difference",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,pch=17,col="black") {
  results <- estimateMeanDifference(...,mu=mu,conf.level=conf.level,main=main,digits=digits)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,4,5)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
}
