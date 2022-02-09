# Estimation Approach to Statistical Inference
## Pairwise Comparisons

### Confidence Intervals

.estimateMeansPairwise <- function(x,...) 
  UseMethod(".estimateMeansPairwise")

.estimateMeansPairwise.wss <- function(DescStats,CorrStats,conf.level=.95,mu=0,...){
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
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  return(results)
}

.estimateMeansPairwise.bss <- function(DescStats,conf.level=.95,mu=0,...){
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
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1}}
  return(results)
}

.estimateMeansPairwise.default <- function(frame,conf.level=.95,mu=0,...){
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansPairwise.wss(DescStats,CorrStats,conf.level=conf.level,mu=mu)
}

.estimateMeansPairwise.formula <- function(formula,conf.level=.95,mu=0,...){
  DescStats <- .describeMeans(formula)
  .estimateMeansPairwise.bss(DescStats,conf.level=conf.level,mu=mu)
}

estimateMeansPairwise <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansPairwise(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Confidence Intervals for the Pairwise Mean Comparisons"} else {main <- "Confidence Interval for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeansPairwise <- function(x,...) 
  UseMethod(".testMeansPairwise")

.testMeansPairwise.wss <- function(DescStats,CorrStats,mu=0,...) {
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
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  return(results)
}

.testMeansPairwise.bss <- function(DescStats,mu=0,...) {
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
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,df,t,p)
   	comp <- comp+1}}
  return(results)
}

.testMeansPairwise.default <- function(frame,mu=0,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansPairwise.wss(DescStats,CorrStats,mu=mu)
}

.testMeansPairwise.formula <- function(formula,mu=0,...) {
  DescStats <- .describeMeans(formula)
  .testMeansPairwise.bss(DescStats,mu=mu)
}

testMeansPairwise <- function(...,main=NULL,digits=3) {
  results <- .testMeansPairwise(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Hypothesis Tests for the Pairwise Mean Comparisons"} else {main <- "Hypothesis Test for the Pairwise Mean Comparison"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Interval Plots

plotMeansPairwise <- function(...,main=NULL,digits=3,ylab="Mean Difference",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,pos=2,ylim=NULL,add=FALSE,connect=FALSE,pch=17,col="black",offset=0,intervals=TRUE) {
  results <- estimateMeansPairwise(...,conf.level=conf.level,mu=mu,main=main,digits=digits)
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col,offset=offset,intervals=intervals)
  invisible(eval(...))
}

plotMeansDiffogram <- function(...,main=NULL,ylab="",xlab="",conf.level=.95,ylim=NULL,pch=17,col=NULL) {
  dm <- .describeMeans(...)
  emp <- .estimateMeansPairwise(...,conf.level=conf.level)
  dif <- (emp[,5]-emp[,4])/4
  M <- dm[,"M"]
  rn <- rownames(dm)
  nr <- nrow(dm)
  ncomp <- (nr)*(nr-1)/2
  fm <- data.frame(matrix(ncol=2,nrow=ncomp))
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    M1 <- M[rn[i]]
    M2 <- M[rn[j]]
    fm[comp,] <- c(M1,M2)
   	comp <- comp+1}}
  lox <- fm[,1]-dif
  hix <- fm[,1]+dif
  loy <- fm[,2]+dif
  hiy <- fm[,2]-dif
  if(is.null(main)) {if(nrow(emp)>1) {main <- "Confidence Intervals for the Pairwise Mean Comparisons"} else {main <- "Confidence Interval for the Pairwise Mean Comparison"}}  
  main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
  if(is.null(ylim)) {
  mn <- min(lox,loy,hix,hiy)-2
  mx <- max(hix,hiy,lox,loy)+2
  ylim<- c(mn,mx)}
  if(is.null(col)) {
    pc <- cbind(emp[,4] <= 0 & emp[,5] >= 0 )
    col <- ifelse(pc,"darkred","darkblue")}
  par(mar=c(5,5,6,5))
  plot(NULL,bty="l",cex.lab=1.15,xlim=ylim,ylim=ylim,xlab=xlab,ylab=ylab,main=main)
  arrows(mn,mn,mx,mx,length=0,lty=2)
  abline(v=dm[,2],col="gray90")
  mtext(rownames(dm),side=3,at=dm[,2])
  abline(h=dm[,2],col="gray90")
  mtext(rownames(dm),side=4,at=dm[,2],las=1)
  points(fm[,1],fm[,2],pch=pch,col=col)
  arrows(lox,loy,hix,hiy,length=0,lwd=2,col=col)  
}
