# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences

### Describe Functions

#### Describe Function for Mutiple Groups and Variables

descLevels <- function(...) 
  UseMethod("descLevels")

descLevels.default <- function(...){
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- round(cbind(N=N,M=M,SD=SD),3)
  return(results)
}

descLevels.formula <- function(formula,...){
  results <- aggregate(formula,FUN=descLevels,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

describeLevels <- function(...) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE LEVELS\n\n")
   print(descLevels(...))
  cat("\n")
}

#### Correlate/Covary Function for Mutiple Variables

corLevels <- function(...) 
  UseMethod("corLevels")

corLevels.default <- function(...,mu=0,conf.level=.95){
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

correlateLevels <- function(...) {
  cat("\nCORRELATION MATRIX FOR THE LEVELS\n\n")
   print(corLevels(...))
  cat("\n")
}

cor2cov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

### Declare and Fill Blanks in Matrix

declareCorrMatrix <- function(...){
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrMatrix <- function(mat){
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
