# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASIFUNCTIONS INTO R

### Data Functions

#### Describe Function for Mutiple Groups and Variables

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

describeDataBy <- function(...,digits=3) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE DATA\n\n")
  print(lapply(descDataBy(...),formatFrame,digits=digits))
}

#### Correlate/Covary Functions for Mutiple Variables

corrDataBy <- function(...) 
  UseMethod("corrDataBy")

corrDataBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,corrData)
  return(results)
}

correlateLevelsBy <- function(...,digits=3) {
  cat("\nCORRELATION MATRIX FOR THE LEVELS\n\n")
  print(corrDataBy(...))
  print(lapply(corrDataBy(...),formatFrame,digits=digits))
}

### Confidence Interval Functions

#### CI Function for Means

ciMeansBy <- function(...) 
  UseMethod("ciMeansBy")

ciMeansBy.wss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciMeansBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
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

estimateMeansBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
  print(lapply(ciMeansBy(...),formatFrame,digits=digits))
}

#### CI Function for Mean Differences/Comparisons

ciDifferenceBy <- function(...) 
  UseMethod("ciDifferenceBy")

ciDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciDifferenceBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciDifference(ListDescStats[[i]],conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

estimateDifferenceBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE COMPARISONS\n\n")
  print(lapply(ciDifferenceBy(...),formatFrame,digits=digits))
}

estimateComparisonBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE COMPARISONS\n\n")
  print(lapply(ciDifferenceBy(...),formatFrame,digits=digits))
}

#### CI Function for Mean Contrasts

ciContrastBy <- function(...) 
  UseMethod("ciContrastBy")

ciContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- ciContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

ciContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- ciContrast(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

estimateContrastBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  print(lapply(ciContrastBy(...),formatFrame,digits=digits))  
}

### Null Hypothesis Significance Test Functions 

#### NHST Function for Means

nhstMeansBy <- function(...) 
  UseMethod("nhstMeansBy")

nhstMeansBy.wss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstMeans(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstMeansBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
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

testMeansBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(lapply(nhstMeansBy(...),formatFrame,digits=digits))
}

##### NHST Function for Mean Differences/Comparisons

nhstDifferenceBy <- function(...) 
  UseMethod("nhstDifferenceBy")

nhstDifferenceBy.wss <- function(ListDescStats,ListCorrStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstDifference(ListDescStats[[i]],ListCorrStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstDifferenceBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstDifference(ListDescStats[[i]],mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

testDifferenceBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE COMPARISONS\n\n")
  print(lapply(nhstDifferenceBy(...),formatFrame,digits=digits))
}

testComparisonBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE COMPARISONS\n\n")
  print(lapply(nhstDifferenceBy(...),formatFrame,digits=digits))
}

#### NHST Function for Mean Contrasts

nhstContrastBy <- function(...) 
  UseMethod("nhstContrastBy")

nhstContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- nhstContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

nhstContrastBy.bss <- function(ListDescStats,contrast,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- nhstContrast(ListDescStats[[i]],contrast=contrast,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

testContrastBy <- function(...,digits=3) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS\n\n")
  print(lapply(nhstContrastBy(...),formatFrame,digits=digits)) 
}

### Standardized Mean Difference Functions

#### SMD Function for Means

smdMeansBy <- function(...) 
  UseMethod("smdMeansBy")

smdMeansBy.wss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdMeans(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdMeansBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
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

standardizeMeansBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(lapply(smdMeansBy(...),formatFrame,digits=digits))
}

#### SMD Function for Mean Differences/Comparisons

smdDifferenceBy <- function(...) 
  UseMethod("smdDifferenceBy")

smdDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdDifferenceBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdDifference(ListDescStats[[i]],conf.level=conf.level,mu=mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

standardizeDifferenceBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS\n\n")
  print(lapply(smdDifferenceBy(...),formatFrame,digits=digits)) 
}

standardizeComparisonBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED COMPARISONS\n\n")
  print(lapply(smdDifferenceBy(...),formatFrame,digits=digits)) 
}

#### SMD Function for Mean Contrasts

smdContrastBy <- function(...) 
  UseMethod("smdContrastBy")

smdContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results[[i]] <- smdContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

smdContrastBy.bss <- function(ListDescStats,contrast,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results[[i]] <- smdContrast(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

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

standardizeContrastBy <- function(...,digits=3) {
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED CONTRASTS\n\n")
  print(lapply(smdContrastBy(...),formatFrame,digits=digits)) 
}

### Confidence Interval Plot Functions

#### Basic Confidence Interval Plot Functions



#### Plot Function for Confidence Intervals of the Means

plotMeansBy <- function(...) 
  UseMethod("plotMeansBy")

plotMeansBy.wss <- function(ListDescStats,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence Intervals for the Means"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
    cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    for (j in 1:(nrow(results)-1)) arrows(j,results[j,"M"],j+1,results[j+1,"M"],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotMeansBy.bss <- function(ListDescStats,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence Intervals for the Means"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
    cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotMeansBy.default <- function(...,by,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  main="Confidence Intervals for the Means"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    for (j in 1:(nrow(results)-1)) arrows(j,results[j,"M"],j+1,results[j+1,"M"],code=3,length=0,lty=1)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotMeansBy.formula <- function(formula,by,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  main="Confidence Intervals for the Means"
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(formula=formula,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotComparisonBy <- function(...) 
  UseMethod("plotDifferenceBy")

plotDifferenceBy <- function(...) 
  UseMethod("plotDifferenceBy")

plotDifferenceBy.wss <- function(ListDescStats,ListCorrStats,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence Intervals for the Comparison"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    Vars <- ciMeans(ListDescStats[[i]],conf.level=conf.level)[1:2,c(2,5,6)]
    colnames(Vars) <- c("Est","LL","UL")
    Diff <- ciDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)[c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotDifferenceBy.bss <- function(ListDescStats,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence Intervals for the Comparison"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    Groups <- ciMeans(ListDescStats[[i]],conf.level=conf.level)[1:2,c(2,5,6)]
    colnames(Groups) <- c("Est","LL","UL")
    Diff <- ciDifference(ListDescStats[[i]],conf.level=conf.level)[c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotDifferenceBy.default <- function(...,by,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence Intervals for the Comparisons"
  for (i in 1:nlevels(by)) {
    Vars <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][1:2,c(2,5,6)]
    colnames(Vars) <- c("Est","LL","UL")
    Diff <- ciDifferenceBy(...,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")    
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotDifferenceBy.formula <- function(formula,by,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  main="Confidence Intervals for the Comparisons"
  for (i in 1:nlevels(by)) {
    Groups <- ciMeansBy(formula,by=by,conf.level=conf.level)[[i]]
    Groups <- Groups[1:2,c(2,5,6)]
    colnames(Groups) <- c("Est","LL","UL")
    Diff <- ciDifferenceBy(formula,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)  
  }
  par(ask=FALSE)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrastBy <- function(...) 
  UseMethod("plotContrastBy")

plotContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,labels=NULL,values=TRUE,digits=3) {
  main="Confidence Intervals for the Contrast"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    congrp1 <- ifelse(contrast<0,0,contrast)
    resgrp1 <- ciContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=congrp1,conf.level=conf.level)
    congrp2 <- ifelse(contrast>0,0,abs(contrast))
    resgrp2 <- ciContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=congrp2,conf.level=conf.level)
    Groups <- rbind(resgrp1,resgrp2)
    Groups <- Groups[1:2,c(1,4,5)]
    Diff <- ciContrast(ListDescStats[[i]],ListCorrStats[[i]],contrast=contrast,conf.level=conf.level)[c(1,4,5)]
    results <- rbind(Groups,Diff)
    if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotContrastBy.bss <- function(ListDescStats,contrast,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,labels=NULL,values=TRUE,digits=3) {
  main="Confidence Intervals for the Contrast"
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    congrp1 <- ifelse(contrast<0,0,contrast)
    resgrp1 <- ciContrast(ListDescStats[[i]],contrast=congrp1,conf.level=conf.level)
    congrp2 <- ifelse(contrast>0,0,abs(contrast))
    resgrp2 <- ciContrast(ListDescStats[[i]],contrast=congrp2,conf.level=conf.level)
    Groups <- rbind(resgrp1,resgrp2)
    Groups <- Groups[1:2,c(1,4,5)]
    Diff <- ciContrast(ListDescStats[[i]],contrast=contrast,conf.level=conf.level)[c(1,4,5)]
    results <- rbind(Groups,Diff)
    if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotContrastBy.default <- function(...,by,contrast,ylab="Outcome",xlab="",rope=NULL,labels=NULL,values=TRUE,digits=3){
  main="Confidence Intervals for the Contrast"
  for (i in 1:nlevels(by)) {  
    convar1 <- ifelse(contrast<0,0,contrast)
    resvar1 <- ciContrastBy(...,by=by,contrast=convar1)[[i]]
    convar2 <- ifelse(contrast>0,0,abs(contrast))
    resvar2 <- ciContrastBy(...,by=by,contrast=convar2)[[i]]
    Vars <- rbind(resvar1,resvar2)
    Vars <- Vars[1:2,c(1,4,5)]  
    Diff <- ciContrastBy(...,by=by,contrast=contrast)[[i]][c(1,4,5)]
    results <- rbind(Vars,Diff)
    if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)     
  }
  par(ask=FALSE)  
}

plotContrastBy.formula <- function(formula,by,contrast,ylab="Outcome",xlab="",rope=NULL,labels=NULL,values=TRUE,digits=3,...){
  main="Confidence Intervals for the Contrast"
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
    cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)     
  }
  par(ask=FALSE)
}

### New Plot for Entire Factorial/Mixed Design

#### Basic Confidence Interval Plot Functions

cipMeansMulti <- function(results,main,ylab,xlab,col) {
  ylimmin <- floor(min(unlist(lapply(results,FUN=function(x) min(x["LL"])))))-1
  ylimmax <- ceiling(max(unlist(lapply(results,FUN=function(x) max(x["UL"])))))+1
  ylimrange <- range(c(ylimmin,ylimmax))
  xlimrange <- c(.5,nrow(results[[1]])+.5)
  plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=xlimrange,ylim=ylimrange,ylab=ylab,xlab=xlab,cex.lab=1.3,main=main,bty="l")
  axis(1, 1:nrow(results[[1]]), row.names(results[[1]])) 
  for (i in 1:length(results)) {
    if(length(col)==1) {tempcol=col} else {tempcol=col[i]}
    for (j in 1:nrow(results[[i]])) {lines(x=c(j+(i-(length(results)+1)/2)*.15,j+(i-(length(results)+1)/2)*.15),y=c(results[[i]][,5][j],results[[i]][,6][j]),lwd=2,col=tempcol)}
    points(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],cex=1.5,pch=15,bty="l",col=tempcol)
    if(class(results)=="wss") lines(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],bty="l",col=tempcol)
  }
}

#### Plot Function for Confidence Intervals of the Means

plotMeansMulti <- function(...) 
  UseMethod("plotMeansMulti")

plotMeansMulti.wss <- function(ListDescStats,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  main="Confidence Intervals for the Means"
  results <- ciMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "wss"  
  cipMeansMulti(results,main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansMulti.bss <- function(ListDescStats,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  main="Confidence Intervals for the Means"
  results <- ciMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "bss"  
  cipMeansMulti(results,main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansMulti.default <- function(...,by,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  main="Confidence Intervals for the Means"
  results <- ciMeansBy(...,by=by,conf.level=conf.level)
  class(results) <- "wss"
  cipMeansMulti(results,main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansMulti.formula <- function(formula,by,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  main="Confidence Intervals for the Means"
  results <- ciMeansBy(formula,by=by,conf.level=conf.level)
  class(results) <- "bss"
  cipMeansMulti(results,main,ylab=ylab,xlab=xlab,col=col)
}

