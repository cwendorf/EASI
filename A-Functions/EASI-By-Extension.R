# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Data Functions

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

ciMeansBy.wss <- function(ListDescStats,conf.level=.95) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciMeansBy.bss <- function(ListDescStats,conf.level=.95) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

nhstMeansBy.wss <- function(ListDescStats,mu=0) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstMeans(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstMeansBy.bss <- function(ListDescStats,mu=0) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstMeans(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

smdMeansBy.wss <- function(ListDescStats,conf.level=.95,mu=0) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdMeans(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdMeansBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdMeans(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

plotMeansBy.default <- function(...,by,mu=NULL,rope=NULL,conf.level=.95,values=TRUE){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab,xlab,mu,rope,values)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotMeansBy.formula <- function(formula,by,mu=NULL,rope=NULL,conf.level=.95,values=TRUE){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(formula=formula,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab,xlab,mu,rope,values)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotDifferenceBy <- function(...) 
  UseMethod("plotDifferenceBy")

plotDifferenceBy.default <- function(...,by,mu=NULL,rope=NULL,conf.level=.95,values=TRUE) {
  main="Confidence Intervals for the Comparisons"
  ylab="Outcome"
  xlab="Variables"
  for (i in 1:nlevels(by)) {
    Vars <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][2:1,c(2,5,6)]
    Diff <- ciDifferenceBy(...,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab,xlab,rope,values)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotDifferenceBy.formula <- function(formula,by,mu=NULL,rope=NULL,conf.level=.95,values=TRUE){
  main="Confidence Intervals for the Comparisons"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  for (i in 1:nlevels(by)) {
    Groups <- ciMeansBy(formula,by=by,conf.level=conf.level)[[i]]
    Groups <- Groups[2:1,c(2,5,6)]
    Diff <- ciDifferenceBy(formula,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab,xlab,rope,values)
    par(ask=TRUE)  
  }
  par(ask=FALSE)
}

plotContrastBy <- function(...) 
  UseMethod("plotContrastBy")

plotContrastBy.default <- function(...,by,contrast,rope=NULL,labels=NULL,values=TRUE){
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
    cipDifference(results,main,ylab,xlab,rope,values)
    par(ask=TRUE)     
  }
  par(ask=FALSE)  
}

plotContrastBy.formula <- function(formula,by,contrast,rope=NULL,labels=NULL,values=TRUE,...){
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
    cipDifference(results,main,ylab,xlab,rope,values)
    par(ask=TRUE)     
  }
  par(ask=FALSE)
}

cipMeansMulti <- function(results,main,ylab,xlab) {
  ylimmin <- floor(min(unlist(lapply(results,FUN=function(x) min(x,x["LL"])))))-2
  ylimmax <- ceiling(max(unlist(lapply(results,FUN=function(x) max(x,x["UL"])))))+2
  ylimrange <- range(c(ylimmin,ylimmax))
  xlimrange=c(.5,nrow(results[[1]])+.5)
  plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=xlimrange,ylim=ylimrange,ylab=ylab,xlab="",main=main,bty="l")
  axis(1, 1:nrow(results[[1]]), row.names(results[[1]])) 
  for (i in 1:length(results)) {
    points(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],cex=1.5,pch=15,bty="l")
    for (j in 1:nrow(results[[i]])) {lines(x=c(j+(i-(length(results)+1)/2)*.15,j+(i-(length(results)+1)/2)*.15),y=c(results[[i]][,5][j],results[[i]][,6][j]),lwd=2)}
    if(class(results)=="wss") lines(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],bty="l")
  }
}

plotMeansMulti <- function(...) 
  UseMethod("plotMeansMulti")

plotMeansMulti.wss <- function(ListDescStats,...) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeansBy(ListDescStats,...)
  cipMeansMulti(results,main,ylab,xlab)
}

plotMeansMulti.default <- function(...,by,conf.level=.95) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeansBy(...,by=by,conf.level=conf.level)
  class(results) <- "wss"
  cipMeansMulti(results,main,ylab,xlab)
}

plotMeansMulti.bss <- function(ListDescStats,...) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeansBy(ListDescStats,...)
  cipMeansMulti(results,main,ylab,xlab)
}

plotMeansMulti.formula <- function(formula,by,...) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeansBy(formula,by=by,...)
  class(results) <- "bss"
  cipMeansMulti(results,main,ylab,xlab)
}

