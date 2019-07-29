
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES  
# NULL HYPOTHESIS SIGNIFICANCE TEST FUNCTIONS

# Basic NHST Function

nhst <- function(y,...){
  model <- t.test(y,...)
  mu <- as.numeric(model$null.value)
  MD <- as.numeric(model$estimate-mu)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
}

# NHST Function for Mutiple Groups and Variables

nhstLevels <- function(...) 
  UseMethod("nhstLevels")

nhstLevels.default <- function(...,mu=0){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=5,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- nhst(data[,i],mu=mu)
  colnames(results) <- c("Diff","SE","t","df","p")
  rownames(results) <- colnames(data)
  results
}

nhstLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=nhst,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  results
}

# NHST Function for Group and Variable Differences

nhstDifference <- function(...) 
  UseMethod("nhstDifference")

nhstDifference.default <- function(x,y,...){
  model <- t.test(x,y,paired=TRUE,...)
  mu <- as.numeric(model$null.value) 
  MD <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  results=round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  results
}

nhstDifference.formula <- function(formula,...){
  model <- t.test(formula,...)
  mu <- as.numeric(model$null.value)
  MD <- as.numeric(model$estimate[1]-model$estimate[2]-mu)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  results=round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  results
}

# NHST Function for a Single Group and Variable Contrast

nhstContrast <- function(...) 
  UseMethod("nhstContrast")

nhstContrast.default <- function(...,contrast,conf.level=.95,mu=0){
  data <- as.matrix(data.frame(...))
  model <- t.test(data %*% contrast,conf.level=conf.level,mu=mu)
  Est <- as.numeric(model$estimate)-mu
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  results <- round(cbind(Est=Est,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Contrast")
  results
}

nhstContrast.formula <- function(y,contrast,conf.level=.95,mu=0,...) {
  sumstats=easiLevels(y)
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  t <- Est/SE
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))  
  p <- 2*pt(-abs(t),df)
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  round(results,3)
}

# Wrappers for NHST Functions
# These call the functions and print with titles

testLevels <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS\n\n")
  print(nhstLevels(...))
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(nhstDifference(...)) 
  cat("\n")
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(nhstContrast(...)) 
  cat("\n")  
}
