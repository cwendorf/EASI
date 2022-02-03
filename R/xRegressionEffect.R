# Estimation Approach to Statistical Inference
## R Squared

### Descriptives

.describeRegressionEffect <- function(x,...) 
  UseMethod(".describeRegressionEffect")

.describeRegressionEffect.wss <- function(DescStats,CorrStats,y=NULL,...) {
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
  R <- sqrt(R2)
  df1 <- nrow(DescStats)-1
  df2 <- DescStats[nrow(DescStats),"N"]-df1-1
  adjR2 <- 1-((1-R2)*(DescStats[nrow(DescStats),"N"]-1))/df2
  results <- cbind(R=R,RSq=R2,AdjRSq=adjR2)
  rownames(results) <- "Model"
  return(results)
}

.describeRegressionEffect.default <- function(frame,y=NULL,...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <-  c(cn[-ci],cn[ci])
    frame <- frame[,cn]}
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .describeRegressionEffect.wss(DescStats,CorrStats)
}

describeRegressionEffect <- function(...,main=NULL,digits=3) {
  results <- .describeRegressionEffect(...)
  if(is.null(main)) {main <- "Overall Fit of the Model"} 
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}

### Confidence Intervals

.estimateRegressionEffect <- function(x,...) 
  UseMethod(".estimateRegressionEffect")

.estimateRegressionEffect.wss <- function(DescStats,CorrStats,y=NULL,conf.level=.90,...) {
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

.estimateRegressionEffect.default <- function(frame,y=NULL,conf.level=.90,...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <-  c(cn[-ci],cn[ci])
    frame <- frame[,cn]} 
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .estimateRegressionEffect.wss(DescStats,CorrStats,conf.level=conf.level)
}

estimateRegressionEffect <- function(...,main=NULL,digits=3) {
  results <- .estimateRegressionEffect(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For by the Model"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}
