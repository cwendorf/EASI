# Estimation Approach to Statistical Inference
## Functions for Means Contrasts

### Confidence Interval Functions

#### CI Function for Mean Contrasts

estimateContrast <- function(x,...) 
  UseMethod("estimateContrast")

estimateContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- .cortocov(CorrStats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- data.matrix(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  estimateContrast(DescStats,CorrStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

estimateContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- data.matrix(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateContrast(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Mean Contrasts

testContrast <- function(x,...) 
  UseMethod("testContrast")
  
testContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,df,t,p)))
  colnames(results) <- c("Est","SE","df","t","p")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Hypothesis Test for the Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  covstats <- .cortocov(CorrStats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,df,t,p)))
  colnames(results) <- c("Est","SE","df","t","p")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Hypothesis Test for the Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- data.matrix(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  testContrast(DescStats,CorrStats,contrast,mu=mu,main=main,digits=digits)
}

testContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- data.matrix(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testContrast(DescStats,contrast,mu=mu,main=main,digits=digits)
}

### Standardized Mean Difference Functions

#### SMD Function for Mean Contrasts

standardizeContrast <- function(x,...) 
  UseMethod("standardizeContrast")

standardizeContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  R <- mean(CorrStats[upper.tri(CorrStats)])
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
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Standardized Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

standardizeContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
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
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Standardized Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

standardizeContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- data.matrix(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  standardizeContrast(DescStats,CorrStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

standardizeContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- data.matrix(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  standardizeContrast(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

### Plot Functions

#### Plot Function for Confidence Interval of a Mean Contrast

plotContrast <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  plotSubsetContrast(...,contrast=contrast,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Mean Contrast Functions

analyzeContrast <- function(...,main=NULL,digits=3) {
  eC <- estimateContrast(...,digits=digits)
  tC <- testContrast(...,digits=digits)
  sC <- standardizeContrast(...,digits=digits)
  results <- c(eC,tC,sC)
  plotContrast(...,main=main,digits=digits)
  return(results)
}

