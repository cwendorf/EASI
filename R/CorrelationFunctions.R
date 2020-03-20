# Estimation Approach to Statistical Inference
## Basic Functions for Correlations

### Correlate/Covary Functions for Mutiple Variables

#### Describe Function for Correlations

descCorrelation <- function(...) 
  UseMethod("descCorrelation")

descCorrelation.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

describeCorrelation <- describeCorrelations <- describeCorr <- function(...,main=NULL,digits=3) {
  results <- formatList(list(descCorrelation(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Correlation Matrix for the Data"} else {names(results) <- main}
  return(results)
}

#### Convert a Covariance Matrix to a Correlation Matrix

cortocov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

#### Declare and Fill Blanks in Matrix

declareCorrelation <- declareCorrelations <- declareCorrMatrix <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrelation <- fillCorrelations <- fillCorrMatrix <- function(mat) {
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

ciCorrelations <- function(...) 
  UseMethod("ciCorrelations")

ciCorrelations.wss <- function(SumStats,CorrStats,conf.level=.95,...){
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
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

ciCorrelations.default <- function(...,conf.level=.95){
  SumStats <- descMeans(...)
  class(SumStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- ciCorrelations(SumStats,CorrStats,conf.level=conf.level)
  return(results)
}

estimateCorrelations <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciCorrelations(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Correlations"} else {names(results) <- main}
  return(results)
}

estimateCorrelation <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciCorrelations(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Correlation"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Plot Functions

#### Basic Confidence Interval Plot Functions

cipCorrelations <- function(results,main,ylab,xlab,mu,rope,values,digits) {
  plot(results[,"R"],xaxs="i",yaxs="i",xaxt="n",xlim=c(.5,nrow(results)+.5),ylim=c(-1.1,1.1),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=16,bty="l")
  axis(1,1:nrow(results),row.names(results))
  results <- formatFrame(results,digits=digits)
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  if(values) {
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"R"][i]),results[,"R"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"LL"][i]),results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"UL"][i]),results[,"UL"][i],cex=.8,pos=2,offset=.5)}
  if(!is.null(mu)) {abline(h=mu,lty=2)}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=rgb(.5,.5,.5,.07),border=NA)}   
}

#### Plot Function for Confidence Intervals of the Correlations

plotCorrelations <- plotCorrelation <- function(...) 
  UseMethod("plotCorrelations")

plotCorrelations.wss <- function(CompStats,CorrStats,main=NULL,ylab="Correlation",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  results <- ciCorrelations(CompStats,CorrStats,conf.level=conf.level)
  if(is.null(main)) {
    if(nrow(results)>1) {main="Confidence Intervals for the Correlations"} else {main="Confidence Interval for the Correlation"}
    }
  cipCorrelations(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
}

plotCorrelations.default <- function(...,main=NULL,ylab="Correlation",xlab="",mu=NULL,conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  plotCorrelations(CompStats,CorrStats,main=main,ylab=ylab,xlab=xlab,mu=mu,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

