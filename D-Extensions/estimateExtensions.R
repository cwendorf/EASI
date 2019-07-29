
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS 
# CONFIDENCE INTERVAL FUNCTIONS

# EASI Function for Pairwise Group and Variable Comparisons

easiPairwise <- function(...) 
  UseMethod("easiPairwise")

easiPairwise.default <- function(...,conf.level=.95){
  data <- data.frame(...)
  nr <- dim(data)[2]
  rn <- colnames(data)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	varx <- get(rn[i])
	vary <- get(rn[j])
	model <- t.test(varx,vary,paired=TRUE,conf.level=conf.level)
	MD <- as.numeric(model$estimate)
	SE <- as.numeric(model$stderr)
	df <- as.numeric(model$parameter)
	LL <- model$conf.int[1]
	UL <- model$conf.int[2]
    results[comp,] <- c(MD,SE,df,LL,UL)
  	comp <-comp+1
  }
  }
  round(results,3)
}

easiPairwise.formula <- function(formula,...){
  varx <- eval(formula[[3]])
  vary <- eval(formula[[2]])
  nr <- nlevels(varx)
  rn <- levels(varx)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	Comparison <- factor(varx,c(rn[i],rn[j]))
	model <- t.test(vary~Comparison,...)
    MD <- as.numeric(model$estimate)[1]-as.numeric(model$estimate)[2]
    SE <- as.numeric(model$stderr)
    df <- as.numeric(model$parameter)
    LL <- model$conf.int[1]
    UL <- model$conf.int[2]
    results[comp,] <- c(MD,SE,df,LL,UL)
	comp <- comp+1
  }
  }
  round(results,3)
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
