# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### Standardized Mean Difference Functions

#### SMD Function for Means

smdMeans <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)  
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  alpha <- 1-conf.level
  CD <- Diff/SD
  CDU <- (1-3/(4*df-1))*CD
  SE <- sqrt((df+2)/(N^2)+((CD^2)/(2*(df+2))))
  k <- exp(((log(2)-log(df))/2)+lgamma((df+1)/2)-lgamma(df/2))
  m <- t*k
  v <- 1+(t^2)*(1-k^2)
  w <- (2*m^3)-((2*df-1)/df)*(t^2*m)
  skew <- abs(w/sqrt(v)^3)
  sdz <- sqrt(v)
  llz <- qnorm(1-alpha/2,lower.tail=FALSE)
  ulz <- qnorm(1-alpha/2)
  ll1 <- m+sdz*llz
  ul1 <- m+sdz*ulz
  c <- w/(4*v)
  q <- v/(2*c^2)
  a <- m-(q*c)
  llp <- 2*(qgamma(alpha/2,q/2,rate=1))
  ulp <- 2*(qgamma(1-alpha/2,q/2,rate=1))
  ll2 <- ifelse(t>0,a+c*llp,a+c*ulp)
  ul2 <- ifelse(t>0,a+c*ulp,a+c*llp)
  LL <- ifelse(skew<.001,ll1*sqrt(1/N),ll2*sqrt(1/N))
  UL <- ifelse(skew<.001,ul1*sqrt(1/N),ul2*sqrt(1/N))
  results <- data.frame(d=CD,"d(unb)"=CDU,SE=SE,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  return(results)
}

smdMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

smdMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

standardizeMeans <- function(...,digits=3){
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(formatFrame(smdMeans(...),digits=digits))
  cat("\n")
}

#### SMD Function for Mean Differences/Comparisons

smdDifference <- function(...) 
  UseMethod("smdDifference")

smdDifference.wss <- function(DescStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- DescStats[1:2,]
  N <- min(CompStats[1:2,"N"])
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- DescStats[1:2,]
  N <- CompStats[1:2,"N"]
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- smdDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdDifference(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeDifference <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON\n\n")
  print(formatFrame(smdDifference(...),digits=digits))
  cat("\n")  
}

#### SMD Function for Mean Contrasts

smdContrast <- function(...) 
  UseMethod("smdContrast")

smdContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  R <- mean(CorrStats[upper.tri(CorrStats)])
  df <- N-1
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  a <- length(M)
  s <- sqrt(sum(SD^2)/a)
  Est <- (t(contrast)%*%M)/s
  v1 <- Est^2/(2*a^2*s^4*df)
  v2 <- sum(SD^4)
  v3 <- R^2*t(SD^2)%*%SD^2 
  v4 <- sum(contrast^2*SD^2)
  v5 <- R*t(contrast*SD)%*%(contrast*SD)
  SE <- sqrt(v1*(v2+v3)+(v4-v5)/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

smdContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v <- SD^2
  a <- length(M)
  s <- sqrt(sum(v)/a)
  Est <- (t(contrast)%*%M)/s
  a1 <- Est^2/(a^2*s^4)
  a2 <- a1*sum((v^2/(2*(N-1))))
  a3 <- sum((contrast^2*v/(N-1)))/s^2
  SE <- sqrt(a2+a3)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

smdContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- smdContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

smdContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeContrast <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST\n\n")
  print(formatFrame(smdContrast(...),digits=digits))
  cat("\n")  
}

#### SMD Function for Pairwise Group and Variable Comparisons

smdPairwise <- function(...) 
  UseMethod("smdPairwise")

smdPairwise.wss <- function(SumStats,CorrStats,conf.level=.95,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("Est","SE","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    R <- CorrStats[rn[1],rn[2]]  
    ns <- N[rn[c(i,j)]]
	  mns <- M[rn[c(i,j)]]
	  sds <- SD[rn[c(i,j)]]
    z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
    s <- sqrt((sds[1]^2 + sds[2]^2)/2)
    df <- min(ns-1)
    v1 <- sds[1]^2
    v2 <- sds[2]^2
    vd <- v1+v2-2*R*sds[1]*sds[2]
    Est <- (mns[2]-mns[1])/s
    SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
    LL <- Est-z*SE
    UL <- Est+z*SE
    results[comp,] <- c(Est,SE,LL,UL)
  	comp <- comp+1
  }
  }
  return(round(results,3))
}

smdPairwise.bss <- function(SumStats,conf.level=.95,...){
  N <- SumStats[,"N"]
  M <- SumStats[,"M"]
  SD <- SumStats[,"SD"]
  rn <- rownames(SumStats)
  nr <- nrow(SumStats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("Est","SE","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    ns <- N[rn[c(i,j)]]
	  mns <- M[rn[c(i,j)]]
	  sds <- SD[rn[c(i,j)]]
    z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
    v1 <- sds[1]^2
    v2 <- sds[2]^2
    s <- sqrt((v1+v2)/2)
    Est <- (mns[2]-mns[1])/s
    SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
    LL <- Est-z*SE
    UL <- Est+z*SE  
    results[comp,] <- c(Est,SE,LL,UL)
  	comp <- comp+1
  }
  }
  return(round(results,3))
}

smdPairwise.default <- function(...,conf.level=.95){
  SumStats <- descData(...)
  class(SumStats) <- "wss"
  CorrStats <- corrData(...)
  results <- smdPairwise(SumStats,CorrStats,conf.level=conf.level)
  return(results)
}

smdPairwise.formula <- function(formula,conf.level=.95,...){
  SumStats <- descData(formula)
  class(SumStats) <- "bss"
  results <- smdPairwise(SumStats,conf.level=conf.level)
  return(results)
}

standardizePairwise <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS\n\n")
  print(formatFrame(smdPairwise(...),digits=digits))
  cat("\n")  
}