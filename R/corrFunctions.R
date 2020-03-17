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

describeCorrelation <- describeCorr <- function(...,main=NULL,digits=3) {
  results <- formatList(list(descCorrelation(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Correlation Matrix for the Data"} else {names(results) <- main}
  return(results)
}

#### Convert a Covariance Matrix

cortocov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

#### Declare and Fill Blanks in Matrix

declareCorrelationMatrix <- declareCorrMatrix <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrelationMatrix <- fillCorrMatrix <- function(mat) {
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
