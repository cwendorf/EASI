
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES  

### Null Hypothesis Significance Test Functions

#### NHST Function for Mutiple Groups and Variables

nhstLevels <- function(...) 
  UseMethod("nhstLevels")
  
nhstLevels.wss <- nhstLevels.bss <- function(sumstats,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SE <- sumstats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  results
}

nhstLevels.default <- function(...,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- nhstLevels(sumstats,mu=mu)
  results
}

nhstLevels.formula <- function(formula,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstLevels(sumstats,mu=mu)
  results
}

##### NHST Function for Group and Variable Differences

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
  results
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
  results
}

nhstDifference.default <- function(x,y,mu=0){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- nhstDifference(compstats,corrstats,mu=mu)
  results
}

nhstDifference.formula <- function(formula,mu=0,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- nhstDifference(compstats,mu=mu)
  results
}

#### NHST Function for a Single Group and Variable Contrast

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
  round(results,3)
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
  round(results,3)
}

nhstContrast.default <- function(...,contrast,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstContrast(sumstats,corrstats,contrast,mu=mu)
  results
}

nhstContrast.formula <- function(formula,contrast,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstContrast(sumstats,contrast,mu=mu)
  results
}

### Wrappers for NHST Functions

testLevels <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS\n\n")
  print(nhstLevels(...))
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(nhstDifference(...)) 
  cat("\n")
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(nhstContrast(...)) 
  cat("\n")  
}
