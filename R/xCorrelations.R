# Estimation Approach to Statistical Inference
## Correlations

### Declare and Fill Blanks in Matrices

declareCorrelations <- function(x,...) 
  UseMethod("declareCorrelations")

declareCorrelations.default <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrelations <- function(x,...) 
  UseMethod("fillCorrelations")

fillCorrelations.default <- function(mat) {
  nr <- nrow(mat)
  nc <- ncol(mat)
  rn <- rownames(mat)
  cn <- colnames(mat)
  results <- matrix(data=NA,nr,nc)
  rownames(results) <- rn
  colnames(results) <- cn
  for( i in 1:nr ){
  for( j in 1:nc ){
	if(!is.na(mat[rn[i],cn[j]])) {
		if(mat[rn[i],cn[j]] == results[cn[j],rn[i]] | is.na(results[cn[j],rn[i]])){
			results[cn[j],rn[i]] <- mat[rn[i],cn[j]]
			results[rn[i],cn[j]] <- mat[rn[i],cn[j]]
		}
		else {return("error")}
	}
  }
  }
  diag(results) <- 1.000
  return(results)
}

### Descriptives

.describeCorrelations <- function(x,...) 
  UseMethod(".describeCorrelations")

.describeCorrelations.default <- function(...) {
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

describeCorrelations <- function(...,main=NULL,digits=3) {
  results <- .describeCorrelations(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Correlation Matrix for the Variables"} else {names(results) <- main}  
  return(results)
}

.cortocov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

.describeCovariances <- function(x,...) 
  UseMethod(".describeCovariances")

.describeCovariances.wss <- function(DescStats,CorrStats) {
  SD <- DescStats[,"SD"]
  results <- .cortocov(CorrStats,SD)
  return(results)
}

.describeCovariances.default <- function(...) {
  data <- data.frame(...)
  results <- cov(data)
  return(results)
}

describeCovariances <- function(...,main=NULL,digits=3) {
  results <- .describeCovariances(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Covariance Matrix for the Variables"} else {names(results) <- main} 
  return(results)
}

### Confidence Intervals

.estimateCorrelations <- function(x,...) 
  UseMethod(".estimateCorrelations")

.estimateCorrelations.wss <- function(DescStats,CorrStats,conf.level=.95){
  N <- DescStats[,"N"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results) <- c("R","SE","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"&",rn[j])
    n <- min(N[rn[j]],N[rn[i]])
    R <- CorrStats[rn[i],rn[j]]  
    z <- qnorm((1+conf.level)/2)
    SE <- sqrt(1/((n-3)))
    zR <- log((1+R)/(1-R))/2
    LL0 <- zR-z*SE
    UL0 <- zR+z*SE
    LL <- (exp(2*LL0)-1)/(exp(2*LL0)+1)
    UL <- (exp(2*UL0)-1)/(exp(2*UL0)+1)
    results[comp,] <- c(R,SE,LL,UL)
   	comp <- comp+1}}
  return(results)
}

.estimateCorrelations.default <- function(...,conf.level=.95){
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateCorrelations.wss(DescStats,CorrStats,conf.level=conf.level)
}

estimateCorrelations <- function(...,main=NULL,digits=3) {
  results <- .estimateCorrelations(...)
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Correlations"} else {main="Confidence Interval for the Correlation"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

### Null Hypothesis Significance Tests

.testCorrelations <- function(x,...) 
  UseMethod(".testCorrelations")

.testCorrelations.wss <- function(DescStats,CorrStats,conf.level=.95){
  N <- DescStats[,"N"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("R","SE","df","t","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"&",rn[j])
    n <- min(N[rn[j]],N[rn[i]])
    R <- CorrStats[rn[i],rn[j]]
    df<- n-2
    SE <- sqrt((1-R^2)/(df))
    t <- R/SE
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(R,SE,df,t,p)
   	comp <- comp+1}}
  return(results)
}

.testCorrelations.default <- function(...,conf.level=.95){
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .testCorrelations.wss(DescStats,CorrStats,conf.level=conf.level)
}

testCorrelations <- function(...,main=NULL,digits=3) {
  results <- .testCorrelations(...)
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Correlations"} else {main="Hypothesis for the Correlation"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

### Confidence Interval Plots

plotCorrelations <- function(...,main=NULL,digits=3,ylab="Correlation",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=c(-1.1,1.1),add=FALSE,pch=16,col="black") {
  results <- estimateCorrelations(...,main=main,digits=digits)
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,3,4)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
}
