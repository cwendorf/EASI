# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences 

### Standardized Mean Difference Functions

#### SMD Function for Means of Levels

smdMeans <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(sumstats,mu=0,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
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
  results <- round(cbind(d=CD,"d(unb)"=CDU,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

smdMeans.default <- function(...,mu=0,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- smdMeans(sumstats,mu=mu,conf.level=conf.level)
  return(results)
}

smdMeans.formula <- function(formula,mu=0,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdMeans(sumstats,mu=mu,conf.level=conf.level)
  return(results)
}

#### SMD Function for Mean Differences/Comparison of Levels

smdDifference <- function(...) 
  UseMethod("smdDifference")

smdDifference.wss <- function(sumstats,corrstats,conf.level=.95,...){
  compstats <- sumstats[1:2,]
  N <- min(compstats[1:2,"N"])
  M <- compstats[1:2,"M"]
  SD <- compstats[1:2,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.bss <- function(sumstats,contrast,conf.level=.95,...) {
  compstats <- sumstats[1:2,]
  N <- compstats[1:2,"N"]
  M <- compstats[1:2,"M"]
  SD <- compstats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.default <- function(...,conf.level=.95){
  compstats <- describeLevels(...)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- smdDifference(compstats,corrstats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdDifference(sumstats,contrast,conf.level=conf.level)
  return(results)
}

#### SMD Function for a Mean Contrast of Levels

smdContrast <- function(...) 
  UseMethod("smdContrast")

smdContrast.wss <- function(sumstats,corrstats,contrast,conf.level=.95,...) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  R <- mean(corrstats[upper.tri(corrstats)])
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
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.bss <- function(sumstats,contrast,conf.level=.95,...) {
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
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
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.default <- function(...,contrast,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- smdContrast(sumstats,corrstats,contrast,conf.level=conf.level)
  return(results)
}

smdContrast.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdContrast(sumstats,contrast,conf.level=conf.level)
  return(results)
}

### Wrappers for SMD Functions

standardizeMeans <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(format(as.data.frame(smdMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

standardizeDifference <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON\n\n")
  print(format(as.data.frame(smdDifference(...)),trim=T,nsmall=3))
  cat("\n")  
}

standardizeContrast <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST\n\n")
  print(format(as.data.frame(smdContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}
