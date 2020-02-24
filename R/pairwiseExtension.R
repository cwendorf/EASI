# Estimation Approach to Statistical Inference
## Extension for Pairwise Comparisons

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASIFUNCTIONS INTO R

### Confidence Interval Functions

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

### Plots of Confidence Intervals

#### Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- plotPairwise.bss <- plotPairwise.wss <- function(...,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Pairwise Comparisons"}
  results <- ciPairwise(...,conf.level=conf.level)
  colnames(results)[1] <- "M"  
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits) 
}

plotPairwise.formula <- function(formula,main=NULL,ylab="Mean Difference",xlab="",conf.level=.95,mu=NA,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence Intervals for the Pairwise Comparisons"}
  results <- ciPairwise(formula,conf.level=conf.level)
  colnames(results)[1] <- "M"
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits) 
}

### Standardized Mean Difference Functions

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

### Null Hypothesis Significance Test Functions 

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
