# Estimation Approach to Statistical Inference (EASI)
## Extended Functions for Comparisons and Contrasts

### Null Hypothesis Significance Test Functions 

#### NHST Function for Pairwise Comparisons

nhstPairwise <- function(...) 
  UseMethod("nhstPairwise")

nhstPairwise.wss <- function(sumstats,corrstats,mu=0,...){
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
    MD <- M[rn[i]]-M[rn[j]]-mu
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

nhstPairwise.bss <- function(sumstats,mu=0,...){
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
    MD <- M[rn[i]]-M[rn[j]]-mu
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
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstPairwise(sumstats,corrstats,mu=mu)
  return(results)
}

nhstPairwise.formula <- function(formula,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstPairwise(sumstats,mu=mu)
  return(results)
}

### Wrappers for NHST Functions

testPairwise <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS\n\n")
  print(nhstPairwise(...)) 
  cat("\n")  
}
