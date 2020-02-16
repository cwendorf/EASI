# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### Confidence Interval Functions

#### CI Function for Means

ciMeans <- function(...) 
  UseMethod("ciMeans")

ciMeans.wss <- ciMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- data.frame(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  return(results)
}

ciMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

ciMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

estimateMeans <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
   print(formatFrame(ciMeans(...),digits=digits))
  cat("\n")
}

#### CI Function for Mean Differences/Comparisons

ciDifference <- function(...) 
  UseMethod("ciDifference")
  
ciDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- ciDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  results <- ciDifference(CompStats,conf.level=conf.level)
  return(results)
}

estimateDifference <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(formatFrame(ciDifference(...),digits=digits))
  cat("\n")  
}

#### CI Function for Mean Contrasts

ciContrast <- function(...) 
  UseMethod("ciContrast")

ciContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cor2cov(CorrStats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

ciContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

ciContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- ciContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

ciContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

estimateContrast <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(formatFrame(ciContrast(...),digits=digits))
  cat("\n")  
}

#### CI Function for Pairwise Group and Variable Comparisons

ciPairwise <- function(...) 
  UseMethod("ciPairwise")

ciPairwise.wss <- function(SumStats,CorrStats,conf.level=.95,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*CorrStats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

ciPairwise.bss <- function(SumStats,conf.level=.95,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
    LL <- MD-tcrit*SEd
    UL <- MD+tcrit*SEd
    results[comp,] <- c(MD,SEd,df,LL,UL)
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

ciPairwise.default <- function(...,conf.level=.95){
  SumStats <- descData(...)
  class(SumStats) <- "wss"
  CorrStats <- corrData(...)
  results <- ciPairwise(SumStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciPairwise.formula <- function(formula,conf.level=.95,...){
  SumStats <- descData(formula)
  class(SumStats) <- "bss"
  results <- ciPairwise(SumStats,conf.level=conf.level)
  return(results)
}

estimatePairwise <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS\n\n")
  print(formatFrame(ciPairwise(...),digits=digits))
  cat("\n")  
}

### Relational Interval Function

ciRelational <- function(...) 
  UseMethod("ciRelational")

ciRelational.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  results <- ciMeans(DescStats,conf.level=conf.level,...)
  mymodel <- descOmnibus(DescStats,CorrStats)
  dfe <- mymodel[3,2]
  mse <- mymodel[3,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,2]-a1*a2/2
  riul <- results[,2]+a1*a2/2
  results <- data.frame(results[,c(2,5,6)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

ciRelational.bss <- function(DescStats,conf.level=.95,...) {
  results <- ciMeans(DescStats,conf.level=conf.level,...)
  mymodel <- descOmnibus(DescStats)
  dfe <- mymodel[2,2]
  mse <- mymodel[2,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,2]-a1*a2/2
  riul <- results[,2]+a1*a2/2
  results <- data.frame(results[,c(2,5,6)],rill,riul)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

ciRelational.default <- function(...,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)  
  results <- ciRelational(DescStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciRelational.formula <- function(formula,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciRelational(DescStats,conf.level=conf.level)
  return(results)
}

estimateRelational <- function(...,digits=3){
  cat("\nCONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS\n\n")
  print(formatFrame(ciRelational(...),digits=digits))
  cat("\n")
}
