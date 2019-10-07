# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences 

### Null Hypothesis Significance Test Functions

#### NHST Function for Means of Levels

nhstMeans <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(sumstats,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SE <- sumstats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- rownames(sumstats)  
  return(results)
}

nhstMeans.default <- function(...,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- nhstMeans(sumstats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstMeans(sumstats,mu=mu)
  return(results)
}

##### NHST Function for Mean Differences/Comparison of Levels

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(compstats,corrstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)  
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.bss <- function(compstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.default <- function(...,mu=0){
  compstats <- describeLevels(...)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstDifference(compstats,corrstats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- nhstDifference(compstats,mu=mu)
  return(results)
}

#### NHST Function for a Mean Contrast of Levels

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(sumstats,contrast,mu=0,...) {
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.wss <- function(sumstats,corrstats,contrast,mu=0,...) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- (t(contrast)%*%M)
  covstats <- cor2cov(corrstats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.default <- function(...,contrast,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstContrast(sumstats,corrstats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstContrast(sumstats,contrast,mu=mu)
  return(results)
}

### Wrappers for NHST Functions

testMeans <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(format(as.data.frame(nhstMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(format(as.data.frame(nhstDifference(...)),trim=T,nsmall=3))
  cat("\n")
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(format(as.data.frame(nhstContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}
