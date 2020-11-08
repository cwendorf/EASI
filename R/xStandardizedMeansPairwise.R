# Estimation Approach to Statistical Inference
## Functions for Standardized Mean Pairwise Comparisons

### Standardized Mean Difference Functions

estimateStandardizedMeansPairwise <- estimateStandardizedMeanPairwise <- function(x,...) 
  UseMethod("estimateStandardizedMeansPairwise")

estimateStandardizedMeansPairwise.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("Est","SE","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    R <- CorrStats[rn[1],rn[2]]  
    ns <- N[rn[c(i,j)]]
	  mns <- M[rn[c(i,j)]]
	  sds <- SD[rn[c(i,j)]]
    z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
    s <- sqrt((sds[1]^2 + sds[2]^2)/2)
    df <- min(ns-1)
    v1 <- sds[1]^2
    v2 <- sds[2]^2
    vd <- v1+v2-2*R*sds[1]*sds[2]
    Est <- (mns[2]-mns[1])/s
    SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
    LL <- Est-z*SE
    UL <- Est+z*SE
    results[comp,] <- c(Est,SE,LL,UL)
  	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Standardized Mean Pairwise Comparisons"} else {main="Confidence Interval for the Standardized Mean Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateStandardizedMeansPairwise.bss <- function(SumStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("Est","SE","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    ns <- N[rn[c(i,j)]]
	  mns <- M[rn[c(i,j)]]
	  sds <- SD[rn[c(i,j)]]
    z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
    v1 <- sds[1]^2
    v2 <- sds[2]^2
    s <- sqrt((v1+v2)/2)
    Est <- (mns[2]-mns[1])/s
    SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
    LL <- Est-z*SE
    UL <- Est+z*SE  
    results[comp,] <- c(Est,SE,LL,UL)
  	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Standardized Mean Pairwise Comparisons"} else {main="Confidence Interval for the Standardized Mean Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateStandardizedMeansPairwise.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- .unformatFrame(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateStandardizedMeansPairwise(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateStandardizedMeansPairwise.formula <- function(formula,conf.level=.95,main=NULL,digits=3,...){
  SumStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  estimateStandardizedMeansPairwise(SumStats,conf.level=conf.level,main=main,digits=digits)
}

### Confidence Interval Plot Functions

plotStandardizedMeansPairwise <- plotStandardizedMeanPairwise <- function(x,...) 
  UseMethod("plotStandardizedMeansPairwise")

plotStandardizedMeansPairwise.default <- plotStandardizedMeansPairwise.bss <- plotStandardizedMeansPairwise.wss <- function(...,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateStandardizedMeansPairwise(...,conf.level=conf.level)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Mean Pairwise Comparisons"} else {main="Confidence Interval for the \n Standardized Mean Pairwise Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=0,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=24) 
}

plotStandardizedMeansPairwise.formula <- function(formula,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=NA,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=NULL,...) {
  results <- .unformatFrame(estimateStandardizedMeansPairwise(formula,conf.level=conf.level)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Mean Pairwise Comparisons"} else {main="Confidence Interval for the \n Standardized Mean Pairwise Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=0,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=24) 
}
