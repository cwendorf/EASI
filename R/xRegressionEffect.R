# Estimation Approach to Statistical Inference
## R Squared

### Descriptives

.describeRegressionEffect <- function(x,...) 
  UseMethod(".describeRegressionEffect")

.describeRegressionEffect.wss <- function(PredStats,CritStats,CorrStats) {
  rn <- rownames(PredStats)
  PredCorr <- CorrStats[rn,rn]
  DescStats <- rbind(PredStats,CritStats)
  rn <- rownames(DescStats)
  CorrStats <- CorrStats[rn,rn]
  CorrStats <- CorrStats[,ncol(CorrStats)]
  CorrStats <- head(CorrStats,-1)
  R2 <- as.numeric(t(CorrStats)%*%solve(PredCorr)%*%CorrStats)
  R <- sqrt(R2)
  df1 <- nrow(PredStats)
  df2 <- (CritStats[,"N"]-df1-1)
  adjR2 <- 1-((1-R2)*(CritStats[,"N"]-1))/df2
  results <- cbind(R=R,RSq=R2,AdjRSq=adjR2)
  rownames(results) <- "Model"
  return(results)
}

.describeRegressionEffect.default <- function(Predictors,Criterion) {
  Predictors <- cbind(Predictors)
  if(ncol(Predictors)==1) {
    CorrStats <- cor(Predictors,Criterion)
    R2 <- as.numeric(CorrStats*CorrStats)
  }
  if(ncol(Predictors)>1) {
    PredCorr <- cor(Predictors)
    CorrStats <- cor(Predictors,Criterion)
    R2 <- as.numeric(t(CorrStats)%*%solve(PredCorr)%*%CorrStats)
  }
  df1 <- ncol(Predictors)
  df2 <- (nrow(Predictors)-df1-1)
  R <- sqrt(R2)
  adjR2 <- 1-((1-R2)*(nrow(Predictors)-1))/df2
  results <- cbind(R=R,RSq=R2,AdjRSq=adjR2)
  rownames(results) <- "Model"
  return(results)
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

.estimateRegressionEffect.wss <- function(PredStats,CritStats,CorrStats,conf.level=.90) {
  temptab <- .describeRegressionOmnibus.wss(PredStats,CritStats,CorrStats)
  df1 <- temptab["Model","df"]
  df2 <- temptab["Error","df"]
  F <- temptab["Model","MS"]/temptab["Error","MS"]
  R2 <- temptab["Model","SS"]/temptab["Total","SS"]
  results <- .ciR2(F=F,df1=df1,df2=df2,R2=R2,conf.level=conf.level)
  rownames(results) <- "Model"
  return(results)
}

.estimateRegressionEffect.default <- function(Predictors,Criterion,conf.level=.90) {
  PredStats <- .describeMeans(Predictors)
  CritStats <- .describeMeans(Criterion)
  CorrStats <- .describeCorrelations(Predictors,Criterion)
  .estimateRegressionEffect.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
}

estimateRegressionEffect <- function(...,main=NULL,digits=3) {
  results <- .estimateRegressionEffect(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}
