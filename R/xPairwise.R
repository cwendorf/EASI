# Estimation Approach to Statistical Inference
## Functions for Pairwise Comparisons

### Confidence Interval Functions

#### CI Function for Pairwise Group and Variable Comparisons

estimatePairwise <- estimateDifferences <- function(...) 
  UseMethod("estimatePairwise")

estimatePairwise.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Comparisons"} else {main="Confidence Interval for the Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimatePairwise.bss <- function(SumStats,conf.level=.95,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Comparisons"} else {main="Confidence Interval for the Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimatePairwise.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- data.matrix(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  estimatePairwise(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimatePairwise.formula <- function(formula,conf.level=.95,main=NULL,digits=3,...){
  SumStats <- data.matrix(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  estimatePairwise(SumStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions 

#### NHST Function for Pairwise Comparisons

testPairwise <- testDifferences <- function(...) 
  UseMethod("testPairwise")

testPairwise.wss <- function(SumStats,CorrStats,mu=0,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Pairwise Comparisons"} else {main="Hypothesis Test for the Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testPairwise.bss <- function(SumStats,mu=0,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Pairwise Comparisons"} else {main="Hypothesis Test for the Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testPairwise.default <- function(...,mu=0,main=NULL,digits=3){
  SumStats <- data.matrix(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  testPairwise(SumStats,CorrStats,mu=mu,main=main,digits=digits)
}

testPairwise.formula <- function(formula,mu=0,main=NULL,digits=3,...){
  SumStats <- data.matrix(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  testPairwise(SumStats,mu=mu,main=main,digits=digits)
}

### Standardized Mean Difference Functions

#### SMD Function for Pairwise Group and Variable Comparisons

standardizePairwise <- standardizeDifferences <- function(...) 
  UseMethod("standardizePairwise")

standardizePairwise.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Standardized Pairwise Comparisons"} else {main="Confidence Interval for the Standardized Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

standardizePairwise.bss <- function(SumStats,conf.level=.95,main=NULL,digits=3,...){
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
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Standardized Pairwise Comparisons"} else {main="Confidence Interval for the Standardized Pairwise Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

standardizePairwise.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- data.matrix(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  standardizePairwise(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

standardizePairwise.formula <- function(formula,conf.level=.95,main=NULL,digits=3,...){
  SumStats <- data.matrix(describeMeans(formula)[[1]])
  class(SumStats) <- "bss"
  standardizePairwise(SumStats,conf.level=conf.level,main=main,digits=digits)
}

### Plots of Confidence Intervals

#### Pairwise Plots

plotPairwise <- plotDifferences <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- .plotPairwise.bss <- plotPairwise.wss <- function(...,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3) {
  results <- data.matrix(estimatePairwise(...,conf.level=conf.level)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Comparisons"} else {main="Confidence Interval for the Pairwise Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE) 
}

plotPairwise.formula <- function(formula,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NA,rope=NULL,values=TRUE,digits=3,...) {
  results <- data.matrix(estimatePairwise(formula,conf.level=conf.level)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Pairwise Comparisons"} else {main="Confidence Interval for the Pairwise Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE) 
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Pairwise Functions

analyzePairwise <- function(...,main=NULL,digits=3) {
  eP <- estimatePairwise(...,digits=digits)
  tP <- testPairwise(...,digits=digits)
  sP <- standardizePairwise(...,digits=digits)
  results <- c(eP,tP,sP)
  plotPairwise(...,main=main,digits=digits)
  return(results)
}
