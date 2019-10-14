# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences 

### Null Hypothesis Significance Test Functions

#### NHST Function for Means of Levels

nhstMeans <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(SumStats,mu=0,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SE <- SumStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- rownames(SumStats)  
  return(results)
}

nhstMeans.default <- function(...,mu=0){
  SumStats <- descLevels(...)
  class(SumStats) <- "wss"
  results <- nhstMeans(SumStats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,...){
  SumStats <- descLevels(formula)
  class(SumStats) <- "bss"
  results <- nhstMeans(SumStats,mu=mu)
  return(results)
}

testMeans <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(format(as.data.frame(nhstMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

##### NHST Function for Mean Differences/Comparison of Levels

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(CompStats,CorrStats,mu=0,...){
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
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

nhstDifference.bss <- function(CompStats,mu=0,...){
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
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
  CompStats <- descLevels(...)
  class(CompStats) <- "wss"
  CorrStats <- corLevels(...)
  results <- nhstDifference(CompStats,CorrStats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,...){
  CompStats <- descLevels(formula)
  class(CompStats) <- "bss"
  results <- nhstDifference(CompStats,mu=mu)
  return(results)
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(format(as.data.frame(nhstDifference(...)),trim=T,nsmall=3))
  cat("\n")
}

#### NHST Function for a Mean Contrast of Levels

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(SumStats,contrast,mu=0,...) {
  N=SumStats[,"N"]
  M=SumStats[,"M"]
  SD=SumStats[,"SD"]
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

nhstContrast.wss <- function(SumStats,CorrStats,contrast,mu=0,...) {
  N <- min(SumStats[,"N"])
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  Est <- (t(contrast)%*%M)
  covstats <- cor2cov(CorrStats,SD)
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
  SumStats <- descLevels(...)
  class(SumStats) <- "wss"
  CorrStats <- corLevels(...)
  results <- nhstContrast(SumStats,CorrStats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,...){
  SumStats <- descLevels(formula)
  class(SumStats) <- "bss"
  results <- nhstContrast(SumStats,contrast,mu=mu)
  return(results)
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(format(as.data.frame(nhstContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}
