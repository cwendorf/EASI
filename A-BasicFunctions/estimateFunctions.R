
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# CONFIDENCE INTERVAL FUNCTIONS 
# BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES 

# Basic EASI Function

easi <- function(y,...){
  N <- length(y)
  M <- mean(y,na.rm=TRUE)
  SD <- sd(y,na.rm=TRUE)
  SE <- SD/sqrt(N)
  LL <- t.test(y,...)$conf.int[1]
  UL <- t.test(y,...)$conf.int[2]
  round(c(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
}

# EASI Function for Mutiple Groups and Variables

easiLevels <- function(...) 
  UseMethod("easiLevels")

easiLevels.default <- function(...,conf.level=.95){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- easi(data[,i],conf.level=conf.level)
  colnames(results) <- c("N","M","SD","SE","LL","UL")
  rownames(results) <- colnames(data)
  results
}

easiLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=easi,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  results
}

# EASI Function for Group and Variable Differences

easiDifference <- function(...) 
  UseMethod("easiDifference")

easiDifference.default <- function(x,y,...){
  model <- t.test(x,y,paired=TRUE,...)
  MD <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
}

easiDifference.formula <- function(formula,...){
  model <- t.test(formula,...)
  MD <- as.numeric(model$estimate[1]-model$estimate[2])
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
}

# EASI Function for a Single Group and Variable Contrast

easiContrast <- function(...) 
  UseMethod("easiContrast")

easiContrast.default <- function(...,contrast,conf.level=.95){
  data <- as.matrix(data.frame(...))
  model <- t.test(data %*% contrast,conf.level=conf.level)
  Est <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  results <- round(cbind(Est=Est,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Contrast")
  results
}

easiContrast.formula <- function(y,contrast,conf.level=.95,...) {
  sumstats=easiLevels(y)
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  round(results,3)
}

# Wrappers for EASI Functions
# These call the functions and print with titles

estimateLevels <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS\n\n")
  print(easiLevels(...))
  cat("\n")
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(easiDifference(...)) 
  cat("\n")  
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(easiContrast(...)) 
  cat("\n")  
}
