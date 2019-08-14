# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences 

### Standardized Mean Difference Functions

#### SMD Function for Means of Levels

smdMeans <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(sumstats,conf.level=.95,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  MD <- M-mu
  cohend <- MD/SD
  eta <- N-1
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(N)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results <- round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  return(results)
}

smdMeans.default <- function(...,conf.level=.95,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- smdMeans(sumstats,conf.level=conf.level,mu=mu)
  return(results)
}

smdMeans.formula <- function(formula,conf.level=.95,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdMeans(sumstats,conf.level=conf.level,mu=mu)
  return(results)
}

#### SMD Function for Mean Differences/Comparison of Levels

smdDifference <- function(...) 
  UseMethod("smdDifference")
  
smdDifference.wss <- function(compstats,corrstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N  <- compstats[1:2,1]
  M <- compstats[1:2,2]
  SD <- compstats[1:2,3]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]  
  ntilde <- 1/mean(1/N) 
  MD <- M[1]-M[2]
  SDp <- sqrt((N[1]-1)*SD[1]^2+(N[2]-1)*SD[2]^2)/sqrt(N[1]+N[2]-2)
  cohend <- MD/SDp
  eta <- N[1]+N[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(ntilde/(2*(1-R)))
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.bss <- function(compstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[1:2,1]
  M <- compstats[1:2,2]
  SD <- compstats[1:2,3]
  ntilde <- 1/mean(1/N) 
  MD <- (M[1]-M[2])
  SDp <- sqrt((N[1]-1)*SD[1]^2+(N[2]-1)*SD[2]^2)/sqrt(N[1]+N[2]-2)
  cohend <- MD/SDp
  eta <- N[1]+N[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(ntilde/2)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- smdDifference(compstats,corrstats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,conf.level=.95,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- smdDifference(compstats,conf.level=conf.level)
  return(results)
}

### Wrappers for SMD Functions

effectMeans <- function(...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE MEANS\n\n")
  print(smdMeans(...))
  cat("\n")
}

effectDifference <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}
