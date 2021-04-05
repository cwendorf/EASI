# Estimation Approach to Statistical Inference
## Regression Omnibus Analyses (Analysis of Variance)

### Descriptives

describeRegressionOmnibus <- function(x,...) 
  UseMethod("describeRegressionOmnibus")

describeRegressionOmnibus.wss <- function(PredStats,CritStats,CorrStats,main=NULL,digits=3,...) {
  R2 <- .unformatFrame(describeRegressionEffect(PredStats,CritStats,CorrStats)[[1]]["RSq"])
  df1 <- nrow(PredStats)
  df2 <- (CritStats[,"N"]-df1-1)
  vt <- CritStats[,"SD"]^2
  dft <- df1+df2
  sst <- vt*dft
  ss1 <- sst*R2
  ss2 <- sst-ss1
  SS <- c(ss1,ss2,sst)
  df <- c(df1,df2,dft)
  MS <- SS/df
  results <- cbind(SS,df,MS)
  rownames(results)=c("Model","Error","Total")
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Source Table for the Regression Model"} else {names(results) <- main}  
  return(results)
}

describeRegressionOmnibus.default <- function(Predictors,Criterion,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  describeRegressionOmnibus(PredStats,CritStats,CorrStats,main=main,digits=digits)
}

### Null Hypothesis Significance Tests

testRegressionOmnibus <- function(x,...) 
  UseMethod("testRegressionOmnibus")

testRegressionOmnibus.wss <- function(PredStats,CritStats,CorrStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeRegressionOmnibus(PredStats,CritStats,CorrStats,main=main,digits=digits)[[1]])
  MSf <- temptab["Model","MS"]
  MSe <- temptab["Error","MS"]
  df1 <- temptab["Model","df"]
  df2 <- temptab["Error","df"]
  F <- MSf/MSe
  p <- 1-pf(F,df1,df2)
  results <- cbind(F,df1,df2,p)
  colnames(results) <- c("F","df1","df2","p")
  rownames(results) <- c("Model")
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Regression Model"} else {names(results) <- main}
  return(results)
}

testRegressionOmnibus.default <- function(Predictors,Criterion,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  testRegressionOmnibus(PredStats,CritStats,CorrStats,main=main,digits=digits)
}
