# Estimation Approach to Statistical Inference
## Functions for Correlations

### Correlate/Covary Functions for Mutiple Variables

#### Describe Function for Correlations

describeCorrelations <- describeCorrelation <- function(x,...) 
  UseMethod("describeCorrelations")

describeCorrelations.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- cor(data)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Correlation Matrix for the Variables"} else {names(results) <- main}  
  return(results)
}

#### Convert a Covariance Matrix to a Correlation Matrix

.cortocov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

#### Declare and Fill Blanks in Matrix

declareCorrelation <- declareCorrelations <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrelations <- function(mat) {
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

### Confidence Interval Functions

#### Confidence Intervals for Correlations

estimateCorrelations <- estimateCorrelation <- function(x,...) 
  UseMethod("estimateCorrelations")

estimateCorrelations.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
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
    LL0 <- zR - z*SE
    UL0 <- zR + z*SE
    LL <- (exp(2*LL0)-1)/(exp(2*LL0)+1)
    UL <- (exp(2*UL0)-1)/(exp(2*UL0)+1)
    results[comp,] <- c(R,SE,LL,UL)
   	comp <- comp+1}}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Correlations"} else {main="Confidence Interval for the Correlation"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateCorrelations.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- .unformatFrame(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateCorrelations(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Correlations

testCorrelations <- testCorrelation <- function(x,...) 
  UseMethod("testCorrelations")

testCorrelations.wss <- function(SumStats,CorrStats,conf.level=.95,main=NULL,digits=3,...){
  N <- SumStats[,"N"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
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
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Correlations"} else {main="Hypothesis for the Correlation"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testCorrelations.default <- function(...,conf.level=.95,main=NULL,digits=3){
  SumStats <- .unformatFrame(describeMeans(...)[[1]])
  class(SumStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  testCorrelations(SumStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

### Confidence Interval Plot Functions

#### Plot Function for Confidence Intervals of the Correlations

plotCorrelations <- plotCorrelation <- function(x,...) 
  UseMethod("plotCorrelations")

plotCorrelations.wss <- function(CompStats,CorrStats,main=NULL,ylab="Correlation",xlab="",conf.level=.95,values=TRUE,digits=3,...) {
  results <- .unformatFrame(estimateCorrelations(CompStats,CorrStats,conf.level=conf.level)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Correlations"} else {main="Confidence Interval for the Correlation"}}
  .cipMain(results,main,ylab=ylab,xlab=xlab,mu=NULL,rope=NULL,values=values,digits=digits,connect=FALSE)
}

plotCorrelations.default <- function(...,main=NULL,ylab="Correlation",xlab="",conf.level=.95,labels=NULL,values=TRUE,digits=3) {
  CompStats <- .unformatFrame(describeMeans(...)[[1]])
  class(CompStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  plotCorrelations(CompStats,CorrStats,main=main,ylab=ylab,xlab=xlab,mu=NULL,conf.level=conf.level,rope=NULL,labels=labels,values=values,digits=digits)
}

