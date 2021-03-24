# Estimation Approach to Statistical Inference
## Functions for Mean Differences

### Confidence Interval Functions

estimateMeansDifference <- estimateMeanDifference <- function(x,...) 
  UseMethod("estimateMeanDifference")
  
estimateMeanDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeanDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

estimateMeanDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .unformatFrame(describeMeans(...)[[1]])
  class(CompStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateMeanDifference(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeanDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(CompStats) <- "bss"
  estimateMeanDifference(CompStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

testMeansDifference <- testMeanDifference <- function(x,...) 
  UseMethod("testMeanDifference")
  
testMeanDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
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
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Hypothesis Test for the Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

testMeanDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
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
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Hypothesis Test for the Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

testMeanDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .unformatFrame(describeMeans(...)[[1]])
  class(CompStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  testMeanDifference(CompStats,CorrStats,mu=mu,main=main,digits=digits)
}

testMeanDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(CompStats) <- "bss"
  testMeanDifference(CompStats,mu=mu,main=main,digits=digits)
}

### Confidence Interval Plot Functions

plotMeanDifference <- function(x,...) 
  UseMethod("plotMeanDifference")

plotMeanDifference.wss <- function(DescStats,CorrStats,main=NULL,ylab="Mean Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMeanDifference(DescStats,CorrStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Difference"} 
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=17)
}

plotMeanDifference.bss <- function(DescStats,main=NULL,ylab="Mean Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMeanDifference(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Difference"}   
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=17)
}

plotMeanDifference.default <- function(...,main=NULL,ylab="Mean Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMeanDifference(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Difference"} 
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=17)
}

plotMeanDifference.formula <- function(formula,main=NULL,ylab="Mean Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMeanDifference(formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Difference"}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=17)
}
