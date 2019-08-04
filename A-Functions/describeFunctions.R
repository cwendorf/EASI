
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
  results
}

describeLevels.formula <- function(formula,...){
  results <- aggregate(formula,FUN=describeLevels,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  results
}

#### Correlate/Covary Function for Mutiple Variables

correlateLevels <- function(...) 
  UseMethod("correlateLevels")

correlateLevels.default <- function(...){
  data <- data.frame(...)
  results <- cor(data)
  results
}

cor2cov <- function(corrstats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * corrstats
  covstats
}
