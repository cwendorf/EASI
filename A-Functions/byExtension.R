# Estimation Approach to Statistical Inference (EASI)
## Extension for Analyzing Factorial Designs
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R
### ALL BASIC FUNCTIONS FOR EASI SHOULD BE INSTALLED TOO

### Describe Functions

descDataBy <- function(...) 
  UseMethod("descDataBy")

descDataBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,descData)
  return(results)
}

descDataBy.formula <- function(formula,by) {
  model <- model.frame(formula)
  FactorialData <- cbind(by,model[2],model[1])
  SplitData <- split(FactorialData[-1],by)
  results <- lapply(SplitData,descData.formula,formula=formula)
  return(results)
}

describeDataBy <- function(...) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE DATA\n\n")
   print(descDataBy(...))
  cat("\n")
}

corrDataBy <- function(...) 
  UseMethod("corrDataBy")

corrDataBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,corrData)
  return(results)
}

correlateLevelsBy <- function(...) {
  cat("\nCORRELATION MATRIX FOR THE LEVELS\n\n")
   print(corrDataBy(...))
  cat("\n")
}

### Confidence Interval Functions

ciMeansBy <- function(...) 
  UseMethod("ciMeansBy")

ciMeansBy.default <- function(...,by,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciMeans(x,conf.level=conf.level))
  return(results)
}

ciMeansBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) ciMeans(x,conf.level=conf.level))
  return(results)
}

estimateMeansBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
   print(ciMeansBy(...))
  cat("\n")
}

ciDifferenceBy <- function(...) 
  UseMethod("ciDifferenceBy")

ciDifferenceBy.default <- function(...,by,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciDifference(x,conf.level=conf.level))
  return(results)
}

ciDifferenceBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciDifference(x,conf.level=conf.level))
  return(results)
}

estimateDifferenceBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE COMPARISONS\n\n")
  print(ciDifferenceBy(...))
  cat("\n")  
}

ciContrastBy <- function(...) 
  UseMethod("ciContrastBy")

ciContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) ciContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

ciContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

estimateContrastBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  print(ciContrastBy(...))
  cat("\n")  
}

### Null Hypothesis Significance Test Functions 

nhstMeansBy <- function(...) 
  UseMethod("nhstMeansBy")

nhstMeansBy.default <- function(...,by,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstMeans(x,mu=mu))
  return(results)
}

nhstMeansBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) nhstMeans(x,mu=mu))
  return(results)
}

testMeansBy <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
   print(nhstMeansBy(...))
  cat("\n")
}

nhstDifferenceBy <- function(...) 
  UseMethod("nhstDifferenceBy")

nhstDifferenceBy.default <- function(...,by,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstDifference(x,mu=mu))
  return(results)
}

nhstDifferenceBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstDifference(x,mu=mu))
  return(results)
}

testDifferenceBy <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE COMPARISONS\n\n")
  print(nhstDifferenceBy(...))
  cat("\n")  
}

nhstContrastBy <- function(...) 
  UseMethod("nhstContrastBy")

nhstContrastBy.default <- function(...,by,contrast,mu=0) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) nhstContrast(x,contrast=contrast,mu=mu))
  return(results)
}

nhstContrastBy.formula <- function(formula,by,contrast,mu=0) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstContrast(x,contrast=contrast,mu=mu))
  return(results)
}

testContrastBy <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS\n\n")
  print(nhstContrastBy(...))
  cat("\n")  
}

### Standardized Mean Difference Functions

smdMeansBy <- function(...) 
  UseMethod("smdMeansBy")

smdMeansBy.default <- function(...,by,mu=0,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdMeans(x,mu=mu,conf.level=conf.level))
  return(results)
}

smdMeansBy.formula <- function(formula,by,mu=0,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) smdMeans(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeMeansBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
   print(smdMeansBy(...))
  cat("\n")
}

smdDifferenceBy <- function(...) 
  UseMethod("smdDifferenceBy")

smdDifferenceBy.default <- function(...,by,mu=0,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdDifference(x,mu=mu,conf.level=conf.level))
  return(results)
}

smdDifferenceBy.formula <- function(formula,by,mu=0,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdDifference(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeDifferenceBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS\n\n")
  print(smdDifferenceBy(...))
  cat("\n")  
}

smdContrastBy <- function(...) 
  UseMethod("smdContrastBy")

smdContrastBy.default <- function(...,by,contrast,conf.level=.95) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,FUN=function(x) smdContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

smdContrastBy.formula <- function(formula,by,contrast,conf.level=.95) {
  ListDescStats <- descDataBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

standardizeContrastBy <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS\n\n")
  print(smdContrastBy(...))
  cat("\n")  
}

### Confidence Interval Plot Functions

plotMeansBy <- function(...) 
  UseMethod("plotMeansBy")

plotMeansBy.default <- function(...,by,mu=NULL,rope=NULL,conf.level=.95){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab,xlab,mu,rope)
    par(ask=TRUE)
  }
}

plotMeansBy.formula <- function(formula,by,mu=NULL,rope=NULL,conf.level=.95){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(formula=formula,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab,xlab,mu,rope)
    par(ask=TRUE)
  }
}

plotDifferenceBy <- function(...) 
  UseMethod("plotDifferenceBy")

plotDifferenceBy.default <- function(...,by,mu=NULL,rope=NULL,conf.level=.95) {
  main="Confidence Intervals for the Comparisons"
  ylab="Outcome"
  xlab="Variables"
  for (i in 1:nlevels(by)) {
    Vars <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][2:1,c(2,5,6)]
    Diff <- ciDifferenceBy(...,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab,xlab,rope)
    par(ask=TRUE)
  }
}

plotDifferenceBy.formula <- function(formula,by,mu=NULL,rope=NULL,conf.level=.95){
  main="Confidence Intervals for the Comparisons"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  for (i in 1:nlevels(by)) {
    Groups <- ciMeansBy(formula,by=by,conf.level=conf.level)[[i]]
    Groups <- Groups[2:1,c(2,5,6)]
    Diff <- ciDifferenceBy(formula,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab,xlab,rope)
    par(ask=TRUE)  
  }
}

plotContrastBy <- function(...) 
  UseMethod("plotContrastBy")

plotContrastBy.default <- function(...,by,contrast,rope=NULL,labels=NULL){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Variables"
  for (i in 1:nlevels(by)) {  
    convar1 <- ifelse(contrast<0,0,contrast)
    resvar1 <- ciContrastBy(...,by=by,contrast=convar1)[[i]]
    convar2 <- ifelse(contrast>0,0,abs(contrast))
    resvar2 <- ciContrastBy(...,by=by,contrast=convar2)[[i]]
    Vars <- rbind(resvar1,resvar2)
    Vars <- Vars[2:1,c(1,4,5)]  
    Diff <- ciContrastBy(...,by=by,contrast=contrast)[[i]][c(1,4,5)]
    results <- rbind(Vars,Diff)
    if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
    cipDifference(results,main,ylab,xlab,rope)
    par(ask=TRUE)     
  }
}

plotContrastBy.formula <- function(formula,by,contrast,rope=NULL,labels=NULL,...){
  main="Confidence Intervals for the Contrast"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  for (i in 1:nlevels(by)) {  
    congrp1 <- ifelse(contrast<0,0,contrast)
    resgrp1 <- ciContrastBy(formula,by=by,contrast=congrp1,...)[[i]]
    congrp2 <- ifelse(contrast>0,0,abs(contrast))
    resgrp2 <- ciContrastBy(formula,by=by,contrast=congrp2,...)[[i]]
    Groups <- rbind(resgrp1,resgrp2)
    Groups <- Groups[2:1,c(1,4,5)]
    Diff <- ciContrastBy(formula,by=by,contrast=contrast,...)[[i]][c(1,4,5)]
    results <- rbind(Groups,Diff)
    if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
    cipDifference(results,main,ylab,xlab,rope)
    par(ask=TRUE)     
  }
}
