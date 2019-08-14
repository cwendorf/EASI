
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS

### Standardized Mean Difference Functions

#### SMD Function for Pairwise Group and Variable Comparisons

smdPairwise <- function(...) 
  UseMethod("smdPairwise")

smdPairwise.wss <- function(sumstats,corrstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("d","g","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    R <- corrstats[rn[1],rn[2]]  
    ns <- N[rn[c(i,j)]]
	mns <- M[rn[c(i,j)]]
	sds <- SD[rn[c(i,j)]]
	ntilde <- 1/mean(1/ns) 
    MD <- mns[1]-mns[2]	
    SDp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
	cohend <- MD/SDp
	eta <- ns[1]+ns[2]-2
	J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
	hedgesg <- cohend*J
	lambda <- hedgesg*sqrt(ntilde/(2*(1-R)))
	tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
	thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
	dlow <- tlow/lambda*hedgesg 
	dhig <- thig/lambda*hedgesg 
    results[comp,] <- c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp <- comp+1
  }
  }
  return(round(results,3))
}

smdPairwise.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("d","g","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    ns <- N[rn[c(i,j)]]
	mns <- M[rn[c(i,j)]]
	sds <- SD[rn[c(i,j)]]
	ntilde <- 1/mean(1/ns) 
	md <- (mns[1]-mns[2])
	sdp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
	cohend <- md/sdp
	eta <- ns[1]+ns[2]-2
	J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
	hedgesg <- cohend*J
	lambda <- hedgesg*sqrt(ntilde/2)
	tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
	thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
	dlow <- tlow/lambda*hedgesg 
	dhig <- thig/lambda*hedgesg 
    results[comp,] <- c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp <- comp+1
  }
  }
  return(round(results,3))
}

smdPairwise.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- smdPairwise(sumstats,corrstats,conf.level=conf.level)
  return(results)
}

smdPairwise.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdPairwise(sumstats,conf.level=conf.level)
  return(results)
}

### Wrappers for SMD Functions

effectPairwise <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE PAIRWISE COMPARISONS\n\n")
  print(smdPairwise(...))
  cat("\n")  
}
