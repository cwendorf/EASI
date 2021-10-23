# Estimation Approach to Statistical Inference
## Post Hoc Comparisons

### Confidence Intervals

estimateMeansPosthoc <- function(x,...) 
  UseMethod("estimateMeansPosthoc")

estimateMeansPosthoc.wss <- function(DescStats,CorrStats,conf.level=.95,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  dfe <- temptab["Error","df"] 
  MSe <- temptab["Error","MS"]

  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*CorrStats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    tcrit <- qtukey(conf.level,nr,df=df)/sqrt(2)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Mean Posthoc Comparisons"} else {main="Confidence Interval for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeansPosthoc.bss <- function(DescStats,conf.level=.95,mu=0,main=NULL,digits=3,...){
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
  dfw <- temptab["Within","df"] 
  MSw <- temptab["Within","MS"]
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt( (MSw/N[rn[i]]) + (MSw/N[rn[j]]) )
    df <- dfw
    tcrit <- qtukey(conf.level,nr,df=df)/sqrt(2)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Mean Posthoc Comparisons"} else {main="Confidence Interval for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeansPosthoc.default <- function(...,conf.level=.95,mu=0,main=NULL,digits=3){
  DescStats <- .describeMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- .describeCorrelations(...)
  estimateMeansPosthoc(DescStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeansPosthoc.formula <- function(formula,conf.level=.95,mu=0,main=NULL,digits=3,...){
  DescStats <- .describeMeans(formula)
  class(DescStats) <- "bss"
  estimateMeansPosthoc(DescStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Tests 

testMeansPosthoc <- function(x,...) 
  UseMethod("testMeansPosthoc")

testMeansPosthoc.wss <- function(DescStats,CorrStats,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  dfe <- temptab["Error","df"] 
  MSe <- temptab["Error","MS"]

  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
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
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Mean Posthoc Comparisons"} else {main="Hypothesis Test for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPosthoc.bss <- function(DescStats,mu=0,main=NULL,digits=3,...){
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
  dfw <- temptab["Within","df"] 
  MSw <- temptab["Within","MS"]
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","t","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt( (Msw/N[rn[i]]) + (MSw/N[rn[j]]) )
    t <- MD/SEd
    df <- dfw
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Mean Posthoc Comparisons"} else {main="Hypothesis Test for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPosthoc.default <- function(...,mu=0,main=NULL,digits=3){
  DescStats <- .describeMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- .describeCorrelations(...)
  testMeansPosthoc(DescStats,CorrStats,mu=mu,main=main,digits=digits)
}

testMeansPosthoc.formula <- function(formula,mu=0,main=NULL,digits=3,...){
  DescStats <- .describeMeans(formula)
  class(DescStats) <- "bss"
  testMeansPosthoc(DescStats,mu=mu,main=main,digits=digits)
}

### Confidence Interval Plots

plotMeansPosthoc <- function(x,...) 
  UseMethod("plotMeansPosthoc")

plotMeansPosthoc.default <- plotMeansPosthoc.bss <- plotMeansPosthoc.wss <- function(...,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=0,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeansPosthoc(...,conf.level=conf.level,mu=mu,posthoc=posthoc)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Mean Posthoc Comparisons"} else {main="Confidence Interval for the \n Mean Posthoc Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col) 
}

plotMeansPosthoc.formula <- function(formula,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=0,line=NULL,rope=NULL,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeansPosthoc(formula,conf.level=conf.level,mu=mu,posthoc=posthoc)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Mean Posthoc Comparisons"} else {main="Confidence Interval for the \n Mean Posthoc Comparison"}}  
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col) 
}
