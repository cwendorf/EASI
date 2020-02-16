# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### Null Hypothesis Significance Test Functions

#### NHST Function for Means

nhstMeans <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=Diff,SE=SE,t=t,df=df,p=p)
  rownames(results) <- rownames(DescStats)  
  return(results)
}

nhstMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

testMeans <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(formatFrame(nhstMeans(...),digits=digits))
  cat("\n")
}

#### NHST Function for Mean Differences/Comparisons

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,t=t,df=df,p=p)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,t=t,df=df,p=p)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- nhstDifference(CompStats,CorrStats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  results <- nhstDifference(CompStats,mu=mu)
  return(results)
}

testDifference <- function(...,digits=3) {
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(formatFrame(nhstDifference(...),digits=digits))
  cat("\n")
}

#### NHST Function for Mean Contrasts

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N=DescStats[,"N"]
  M=DescStats[,"M"]
  SD=DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,t,df,p)))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(results)
}

nhstContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  covstats <- cor2cov(CorrStats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,t,df,p)))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(results)
}

nhstContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- nhstContrast(DescStats,CorrStats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- nhstContrast(DescStats,contrast,mu=mu)
  return(results)
}

testContrast<-function(...,digits=3) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(formatFrame(nhstContrast(...),digits=digits))
  cat("\n")  
}

#### NHST Function for Pairwise Comparisons

nhstPairwise <- function(...) 
  UseMethod("nhstPairwise")

nhstPairwise.wss <- function(SumStats,CorrStats,mu=0,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*CorrStats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,t,df,p)
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

nhstPairwise.bss <- function(SumStats,mu=0,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[j]]-M[rn[i]]-mu
    SEd <- sqrt( (SD[rn[i]]^2/N[rn[i]]) + (SD[rn[j]]^2/N[rn[j]]) )
    df <- ((SD[rn[i]]^2/N[rn[i]] + SD[rn[j]]^2/N[rn[j]])^2 )/( (SD[rn[i]]^2/N[rn[i]])^2/(N[rn[i]]-1) + (SD[rn[j]]^2/N[rn[j]])^2/(N[rn[j]]-1) )
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,t,df,p)
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

nhstPairwise.default <- function(...,mu=0){
  SumStats <- descData(...)
  class(SumStats) <- "wss"
  CorrStats <- corrData(...)
  results <- nhstPairwise(SumStats,CorrStats,mu=mu)
  return(results)
}

nhstPairwise.formula <- function(formula,mu=0,...){
  SumStats <- descData(formula)
  class(SumStats) <- "bss"
  results <- nhstPairwise(SumStats,mu=mu)
  return(results)
}

testPairwise <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS\n\n")
  print(formatFrame(nhstPairwise(...),digits=digits))
  cat("\n")  
}
