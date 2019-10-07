# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences

### Confidence Interval Functions

#### CI Function for Means of Levels

ciMeans <- function(...) 
  UseMethod("ciMeans")

ciMeans.wss <- ciMeans.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- as.data.frame(round(cbind(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3))
  rownames(results) <- rownames(sumstats)
  return(results)
}

ciMeans.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- ciMeans(sumstats,conf.level=conf.level)
  return(results)
}

ciMeans.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- ciMeans(sumstats,conf.level=conf.level)
  return(results)
}

#### CI Function for Mean Differences/Comparison of Levels 

ciDifference <- function(...) 
  UseMethod("ciDifference")
  
ciDifference.wss <- function(compstats,corrstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.bss <- function(compstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.default <- function(...,conf.level=.95){
  compstats <- describeLevels(...)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- ciDifference(compstats,corrstats,conf.level=conf.level)
  return(results)
}

ciDifference.formula <- function(formula,conf.level=.95,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- ciDifference(compstats,conf.level=conf.level)
  return(results)
}

#### CI Function for a Mean Contrast of Levels

ciContrast <- function(...) 
  UseMethod("ciContrast")

ciContrast.wss <- function(sumstats,corrstats,contrast,conf.level=.95) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cor2cov(corrstats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.bss <- function(sumstats,contrast,conf.level=.95,...) {
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.default <- function(...,contrast,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- ciContrast(sumstats,corrstats,contrast,conf.level=conf.level)
  return(results)
}

ciContrast.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- ciContrast(sumstats,contrast,conf.level=conf.level)
  return(results)
}

### Wrappers for CI Functions

estimateMeans <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
   print(format(as.data.frame(ciMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(format(as.data.frame(ciDifference(...)),trim=T,nsmall=3))
  cat("\n")  
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(format(as.data.frame(ciContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}
