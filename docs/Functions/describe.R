# Estimation Approach to Statistical Inference
## Basic Functions for Describing Data

### Data Functions

#### Describe Function for Mutiple Groups and Variables

descData <- function(...) 
  UseMethod("descData")

descData.default <- function(...) {
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- cbind(N=N,M=M,SD=SD)
  return(results)
}

descData.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=descData,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

describeData <- function(...,digits=3) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE DATA\n\n")
   print(formatFrame(descData(...),digits=digits))
  cat("\n")
}

#### Correlate/Covary Functions for Mutiple Variables

corrData <- function(...) 
  UseMethod("corrData")

corrData.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

correlateData <- function(...,digits=3) {
  cat("\nCORRELATION MATRIX FOR THE DATA\n\n")
   print(formatFrame(corrData(...),digits=digits))
  cat("\n")
}

cor2cov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

#### Declare and Fill Blanks in Matrix

declareCorrMatrix <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrMatrix <- function(mat) {
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
