# Estimation Approach to Statistical Inference
## Post Hoc Comparisons

### Confidence Intervals

estimateMeansPosthoc <- function(x,...) 
  UseMethod("estimateMeansPosthoc")

estimateMeansPosthoc.wss <- function(SumStats,CorrStats,conf.level=.95,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  SSf <- temptab["Factor","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"] 


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

estimateMeansPosthoc.bss <- function(SumStats,conf.level=.95,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
  SSb <- temptab["Between","SS"]
  SSw <- temptab["Within","SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"] 
  dft <- dfb + dfw

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
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    df <- sum(N) - length(M)
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
  SumStats <- .describeMeans(...)
  class(SumStats) <- "wss"
  CorrStats <- .describeCorrelations(...)
  estimateMeansPosthoc(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeansPosthoc.formula <- function(formula,conf.level=.95,mu=0,main=NULL,digits=3,...){
  SumStats <- .describeMeans(formula)
  class(SumStats) <- "bss"
  estimateMeansPosthoc(SumStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Tests 

testMeansPosthoc <- function(x,...) 
  UseMethod("testMeansPosthoc")

testMeansPosthoc.wss <- function(SumStats,CorrStats,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  SSf <- temptab["Factor","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"] 


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
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Mean Posthoc Comparisons"} else {main="Hypothesis Test for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPosthoc.bss <- function(SumStats,mu=0,main=NULL,digits=3,...){

  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
  SSb <- temptab["Between","SS"]
  SSw <- temptab["Within","SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"] 
  dft <- dfb + dfw

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
    df <- sum(N) - length(M)
    p <- 1- ptukey(abs(t)*sqrt(2),nr,df=df)
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Mean Posthoc Comparisons"} else {main="Hypothesis Test for the Mean Posthoc Comparison"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeansPosthoc.default <- function(...,mu=0,main=NULL,digits=3){
  SumStats <- .describeMeans(...)
  class(SumStats) <- "wss"
  CorrStats <- .describeCorrelations(...)
  testMeansPosthoc(SumStats,CorrStats,mu=mu,main=main,digits=digits)
}

testMeansPosthoc.formula <- function(formula,mu=0,main=NULL,digits=3,...){
  SumStats <- .describeMeans(formula)
  class(SumStats) <- "bss"
  testMeansPosthoc(SumStats,mu=mu,main=main,digits=digits)
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
