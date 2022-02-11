# Estimation Approach to Statistical Inference
## Post Hoc Comparisons

### Confidence Intervals

.estimateMeansPosthoc <- function(x,...) 
  UseMethod(".estimateMeansPosthoc")

.estimateMeansPosthoc.wss <- function(DescStats,CorrStats,conf.level=.95,mu=0,...) {
  temptab <- .describeMeansOmnibus.wss(DescStats,CorrStats)
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
  return(results)
}

.estimateMeansPosthoc.bss <- function(DescStats,conf.level=.95,mu=0,...) {
  temptab <- .describeMeansOmnibus.bss(DescStats)
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
  return(results)
}

.estimateMeansPosthoc.default <- function(frame,conf.level=.95,mu=0,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansPosthoc.wss(DescStats,CorrStats,conf.level=conf.level,mu=mu)
}

.estimateMeansPosthoc.formula <- function(formula,conf.level=.95,mu=0,...) {
  DescStats <- .describeMeans(formula)
  .estimateMeansPosthoc.bss(DescStats,conf.level=conf.level,mu=mu)
}

estimateMeansPosthoc <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansPairwise(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Confidence Intervals for the Posthoc Mean Comparisons"} else {main <- "Confidence Interval for the Posthoc Mean Comparison"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeansPosthoc <- function(x,...) 
  UseMethod(".testMeansPosthoc")

.testMeansPosthoc.wss <- function(DescStats,CorrStats,mu=0,...) {
  temptab <- .describeMeansOmnibus.wss(DescStats,CorrStats)
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
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  return(results)
}

.testMeansPosthoc.bss <- function(DescStats,mu=0,...) {
  temptab <- .describeMeansOmnibus.bss(DescStats)
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
    SEd <- sqrt( (MSw/N[rn[i]]) + (MSw/N[rn[j]]) )
    t <- MD/SEd
    df <- dfw
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  return(results)
}

.testMeansPosthoc.default <- function(frame,mu=0,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansPosthoc.wss(DescStats,CorrStats,mu=mu)
}

.testMeansPosthoc.formula <- function(formula,mu=0,...) {
  DescStats <- .describeMeans(formula)
  .testMeansPosthoc.bss(DescStats,mu=mu)
}

testMeansPosthoc <- function(...,main=NULL,digits=3) {
  results <- .testMeansPosthoc(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Hypothesis Tests for the Posthoc Mean Comparisons"} else {main <- "Hypothesis Test for the Posthoc Mean Comparison"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Interval Plots

plotMeansPosthoc <- function(...,main=NULL,digits=3,ylab="Mean Difference",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,pos=2,connect=FALSE,ylim=NULL,add=FALSE,pch=17,col="black",offset=0,intervals=TRUE) {
  results <- estimateMeansPosthoc(...,conf.level=conf.level,mu=mu,main=main,digits=digits)
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,pch=pch,col=col,offset=offset,intervals=intervals)
}
