
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## ALL EXTENDED FUNCTIONS (ESTIMATE, PLOT, TEST, AND EFFECT)
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R
### ALL BASIC FUNCTIONS FOR EASI SHOULD BE INSTALLED TOO

### Confidence Interval Functions

#### CI Function for Pairwise Group and Variable Comparisons

easiPairwise <- function(...) 
  UseMethod("easiPairwise")

easiPairwise.wss <- function(sumstats,corrstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[i]]-M[rn[j]]
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*corrstats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
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

easiPairwise.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[i]]-M[rn[j]]
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

easiPairwise.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- easiPairwise(sumstats,corrstats,conf.level=conf.level)
  return(results)
}

easiPairwise.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- easiPairwise(sumstats,conf.level=conf.level)
  return(results)
}

### Wrappers for CI Functions
 
estimatePairwise <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS\n\n")
  print(easiPairwise(...)) 
  cat("\n")  
}

### Plots of Confidence Intervals

#### Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(...)[,c(1,4,5)]
  cipLevels(results,main,ylab,xlab,mu) 
}

plotPairwise.formula <- function(formula,conf.level=.95,mu=NA,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(formula,...)[,c(1,4,5)]
  cipLevels(results,main,ylab,xlab,mu) 
}

### Null Hypothesis Significance Test Functions 

#### NHST Function for Pairwise Comparisons

nhstPairwise <- function(...) 
  UseMethod("nhstPairwise")

nhstPairwise.wss <- function(sumstats,corrstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[i]]-M[rn[j]]
    SEd <- sqrt(SE[rn[i]]^2+SE[rn[j]]^2-2*corrstats[rn[i],rn[j]]*SE[rn[i]]*SE[rn[j]])
    df <- min(N)-1
    t <- MD/SEd
    p <- 2*(1 - pt(abs(t),df))
    results[comp,] <- c(MD,SEd,t,df,p)
   	comp <- comp+1
  }
  }
  return(round(results,3))
}

nhstPairwise.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  rn <- rownames(sumstats)
  nr <- nrow(sumstats)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
    MD <- M[rn[i]]-M[rn[j]]
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

nhstPairwise.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstPairwise(sumstats,corrstats,conf.level=conf.level)
  return(results)
}

nhstPairwise.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstPairwise(sumstats,conf.level=conf.level)
  return(results)
}

### Wrappers for NHST Functions

testPairwise <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS\n\n")
  print(nhstPairwise(...)) 
  cat("\n")  
}

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
