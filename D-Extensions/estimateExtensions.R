
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS 
# CONFIDENCE INTERVAL FUNCTIONS

# EASI Function for Pairwise Group and Variable Comparisons

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
  round(results,3)
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
  round(results,3)
}

easiPairwise.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- easiPairwise(sumstats,corrstats,conf.level=conf.level)
  results
}

easiPairwise.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- easiPairwise(sumstats,conf.level=conf.level)
  results
}

# EASI Function for Group and Variable Contrasts

easiContrasts <- function(...) 
  UseMethod("easiContrasts")

easiContrasts.default <- function(...,contrasts=contr.sum,conf.level=.95){
  data <- data.frame(...)
  columns <- dim(data)[2]
  dataLong <- reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects <- as.factor(dataLong$Subjects)
  dataLong$Variable <- as.factor(dataLong$Variable)
  vlevels <- nlevels(dataLong$Variable)
  contrasts(dataLong$Variable) <- contrasts
  contrasts(dataLong$Subjects) <- contr.sum
  model <- aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first <- summary(lm(model))[[4]][1:vlevels,1:2]
  second <- confint(lm(model),level=conf.level)[1:vlevels,1:2]
  results <- round(cbind(first,second),3)
  colnames(results) <- c("Est","SE","LL","UL")
  results
}

easiContrasts.formula <- function(formula,contrasts=contr.sum,conf.level=.95,...){
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  contrasts(x) <- contrasts
  model <- lm(y~x,...)
  results <- round(cbind(summary(model)[[4]][,1:2],confint(model,level=conf.level)),3)
  colnames(results) <- c("Est","SE","LL","UL")
  results
}

# Wrappers for EASI Functions
# These call the functions and print with titles
 
estimatePairwise <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS\n\n")
  print(easiPairwise(...)) 
  cat("\n")  
}
 
estimateContrasts <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  print(easiContrasts(...)) 
  cat("\n")  
}
