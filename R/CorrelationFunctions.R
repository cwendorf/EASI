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

#### CI Function for a Correlation

ciCorrelation <- function(...) 
  UseMethod("ciCorrelation")

ciCorrelation.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- min(CompStats[,"N"])
  rn <- rownames(CompStats)  
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1+conf.level)/2)
  SE <- sqrt(1/((N-3)))
  zR <- log((1+R)/(1-R))/2
  LL0 <- zR - z*SE
  UL0 <- zR + z*SE
  LL <- (exp(2*LL0)-1)/(exp(2*LL0)+1)
  UL <- (exp(2*UL0)-1)/(exp(2*UL0)+1)
  results <- data.frame(R=R,SE=SE,LL=LL,UL=UL)
  rownames(results) <- "Correlation"  
  return(results)
}

ciCorrelation.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- ciCorrelation(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

estimateCorrelation <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciCorrelation(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Correlation"} else {names(results) <- main}
  return(results)
}

