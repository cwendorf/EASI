
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES 

### Describe Functions

#### Describe Function for Mutiple Groups and Variables

describeLevels <- function(...) 
  UseMethod("describeLevels")

describeLevels.default <- function(...){
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- round(cbind(N=N,M=M,SD=SD),3)
  return(results)
}

describeLevels.formula <- function(formula,...){
  results <- aggregate(formula,FUN=describeLevels,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

#### Correlate/Covary Function for Mutiple Variables

correlateLevels <- function(...) 
  UseMethod("correlateLevels")

correlateLevels.default <- function(...){
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

cor2cov <- function(corrstats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * corrstats
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
