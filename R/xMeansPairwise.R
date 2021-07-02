# Estimation Approach to Statistical Inference
## Pairwise Comparisons

### Confidence Intervals

estimateMeansPairwise <- function(x,...) 
  UseMethod("estimateMeansPairwise")

estimateMeansPairwise.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*CorrStats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Mean Comparisons"} else {main="Confidence Interval for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeansPairwise.bss <- function(SumStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Mean Comparisons"} else {main="Confidence Interval for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeansPairwise.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- .unformatFrame(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateMeansPairwise(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeansPairwise.formula <- function(formula,conf.level=.95,main=NULL,digits=3,...){
  SumStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  estimateMeansPairwise(SumStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Tests 

testMeansPairwise <- function(x,...) 
  UseMethod("testMeansPairwise")

testMeansPairwise.wss <- function(SumStats,CorrStats,mu=0,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","t","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*CorrStats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Pairwise Mean Comparisons"} else {main="Hypothesis Test for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPairwise.bss <- function(SumStats,mu=0,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","t","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Pairwise Mean Comparisons"} else {main="Hypothesis Test for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPairwise.default <- function(...,mu=0,main=NULL,digits=3){
  SumStats <- .unformatFrame(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  testMeansPairwise(SumStats,CorrStats,mu=mu,main=main,digits=digits)
}

testMeansPairwise.formula <- function(formula,mu=0,main=NULL,digits=3,...){
  SumStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  testMeansPairwise(SumStats,mu=mu,main=main,digits=digits)
}

### Confidence Interval Plots

plotMeansPairwise <- function(x,...) 
  UseMethod("plotMeansPairwise")

plotMeansPairwise.default <- plotMeansPairwise.bss <- plotMeansPairwise.wss <- function(...,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeansPairwise(...,conf.level=conf.level)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Pairwise Mean Comparisons"} else {main="Confidence Interval for the \n Pairwise Mean Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col) 
}

plotMeansPairwise.formula <- function(formula,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NA,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeansPairwise(formula,conf.level=conf.level)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Pairwise Mean Comparisons"} else {main="Confidence Interval for the \n Pairwise Mean Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col) 
}
