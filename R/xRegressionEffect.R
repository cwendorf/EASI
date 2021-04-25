# Estimation Approach to Statistical Inference
## R Squared

### Descriptives

describeRegressionEffect <- function(x,...) 
  UseMethod("describeRegressionEffect")

describeRegressionEffect.wss <- function(PredStats,CritStats,CorrStats,main=NULL,digits=3) {
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
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Overall Fit of the Model"} else {names(results) <- main}  
  return(results)
}

describeRegressionEffect.default <- function(Predictors,Criterion,main=NULL,digits=3) {
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
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Overall Fit of the Model"} else {names(results) <- main}  
  return(results)
}

### Confidence Intervals

estimateRegressionEffect <- function(x,...) 
  UseMethod("estimateRegressionEffect")

estimateRegressionEffect.wss <- function(PredStats,CritStats,CorrStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeRegressionOmnibus(PredStats,CritStats,CorrStats)[[1]])
  df1 <- temptab["Model","df"]
  df2 <- temptab["Error","df"]
  F <- temptab["Model","MS"]/temptab["Error","MS"]
  R2 <- temptab["Model","SS"]/temptab["Total","SS"]
  delta.lower <- delta.upper <- numeric(length(R2))
  delta.lower <- try(.ncpF(F,df1,df2,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(.ncpF(F,df1,df2,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  R2.lower <- delta.lower / (delta.lower + df1 + df2 + 1)
  R2.upper <- delta.upper / (delta.upper + df1 + df2 + 1)
  results <- cbind(Est=R2,LL=R2.lower,UL=R2.upper)
  rownames(results) <- "Model"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For by the Model"} else {names(results) <- main}  
  return(results)
}

estimateRegressionEffect.default <- function(Predictors,Criterion,conf.level=.90,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  estimateRegressionEffect(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}
