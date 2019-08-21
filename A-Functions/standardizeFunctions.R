# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences 

### Standardized Mean Difference Functions

#### SMD Function for Means of Levels



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
  rownames(results) <- c("Contrast")
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
  rownames(results) <- c("Difference")
  return(round(results,3))
}

smdDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
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
  print(smdMeans(...))
  cat("\n")
}

standardizeDifference <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}

standardizeContrast <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST\n\n")
  print(smdContrast(...))
  cat("\n")  
}
