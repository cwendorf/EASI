# Estimation Approach to Statistical Inference
## Regression Omnibus (Analysis of Variance)

### Descriptives

.describeRegressionOmnibus <- function(x,...) 
  UseMethod(".describeRegressionOmnibus")

.describeRegressionOmnibus.wss <- function(DescStats,CorrStats,y=NULL,...) {
  if(!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn==deparse(substitute(y)))
    rn <- c(rn[-ri],rn[ri])
    DescStats <- DescStats[rn,]
    class(DescStats) <- "wss"
    CorrStats <- CorrStats[rn,rn]}
  rn <- rownames(DescStats)
  rn <- head(rn,-1)
  PredCorr <- CorrStats[rn,rn]
  CorrStats <- CorrStats[,ncol(CorrStats)]
  CorrStats <- head(CorrStats,-1) 
  R2 <- as.numeric(t(CorrStats)%*%solve(PredCorr)%*%CorrStats)
  df1 <- nrow(DescStats)-1
  df2 <- DescStats[nrow(DescStats),"N"]-df1-1
  vt <- DescStats[nrow(DescStats),"SD"]^2
  dft <- df1+df2
  sst <- vt*dft
  ss1 <- sst*R2
  ss2 <- sst-ss1
  SS <- c(ss1,ss2,sst)
  df <- c(df1,df2,dft)
  MS <- SS/df
  results <- cbind(SS,df,MS)
  rownames(results)=c("Model","Error","Total")
  return(results)
}

.describeRegressionOmnibus.default <- function(frame,y=NULL,...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <-  c(cn[-ci],cn[ci])
    frame <- frame[,cn]} 
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .describeRegressionOmnibus.wss(DescStats,CorrStats)
}

describeRegressionOmnibus <- function(...,main=NULL,digits=3) {
  results <- .describeRegressionOmnibus(...)
  if(is.null(main)) {main <- "Source Table for the Regression Model"}
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Intervals

.ciR2 <- function(F,df1,df2,R2,conf.level) {
  delta.lower <- delta.upper <- numeric(length(R2))
  delta.lower <- try(.ncpF(F,df1,df2,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(.ncpF(F,df1,df2,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  R2.lower <- delta.lower / (delta.lower + df1 + df2 + 1)
  R2.upper <- delta.upper / (delta.upper + df1 + df2 + 1)
  results <- cbind(Est=R2,LL=R2.lower,UL=R2.upper)
  results
}

.estimateRegressionOmnibus <- function(x,...) 
  UseMethod(".estimateRegressionOmnibus")

.estimateRegressionOmnibus.wss <- function(DescStats,CorrStats,y=NULL,conf.level=.90,...) {
  if(!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn==deparse(substitute(y)))
    rn <- c(rn[-ri],rn[ri])
    DescStats <- DescStats[rn,]
    class(DescStats) <- "wss"
    CorrStats <- CorrStats[rn,rn]}
  temptab <- .describeRegressionOmnibus.wss(DescStats,CorrStats)
  df1 <- temptab["Model","df"]
  df2 <- temptab["Error","df"]
  F <- temptab["Model","MS"]/temptab["Error","MS"]
  R2 <- temptab["Model","SS"]/temptab["Total","SS"]
  results <- .ciR2(F=F,df1=df1,df2=df2,R2=R2,conf.level=conf.level)
  rownames(results) <- "Model"
  return(results)
}

.estimateRegressionOmnibus.default <- function(frame,y=NULL,conf.level=.90,...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <-  c(cn[-ci],cn[ci])
    frame <- frame[,cn]} 
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .estimateRegressionOmnibus.wss(DescStats,CorrStats,conf.level=conf.level)
}

estimateRegressionOmnibus <- function(...,main=NULL,digits=3) {
  results <- .estimateRegressionOmnibus(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For by the Regression Model"} 
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Null Hypothesis Significance Tests

.testRegressionOmnibus <- function(x,...) 
  UseMethod(".testRegressionOmnibus")

.testRegressionOmnibus.wss <- function(DescStats,CorrStats,y=NULL,...) {
  if(!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn==deparse(substitute(y)))
    rn <- c(rn[-ri],rn[ri])
    DescStats <- DescStats[rn,]
    class(DescStats) <- "wss"
    CorrStats <- CorrStats[rn,rn]}
  temptab <- .describeRegressionOmnibus.wss(DescStats,CorrStats)
  MSf <- temptab["Model","MS"]
  MSe <- temptab["Error","MS"]
  df1 <- temptab["Model","df"]
  df2 <- temptab["Error","df"]
  F <- MSf/MSe
  p <- 1-pf(F,df1,df2)
  results <- cbind(F,df1,df2,p)
  colnames(results) <- c("F","df1","df2","p")
  rownames(results) <- c("Model")
  return(results)
}

.testRegressionOmnibus.default <- function(frame,y=NULL,...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <-  c(cn[-ci],cn[ci])
    frame <- frame[,cn]} 
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .testRegressionOmnibus.wss(DescStats,CorrStats)
}

testRegressionOmnibus <- function(...,main=NULL,digits=3) {
  results <- .testRegressionOmnibus(...)
  if(is.null(main)) {main <- "Hypothesis Test for the Regression Model"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}
