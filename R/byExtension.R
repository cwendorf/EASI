# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### Data Functions

#### Describe Function for Mutiple Groups and Variables

descMeansBy <- function(...) 
  UseMethod("descMeansBy")

descMeansBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,descMeans)
  return(results)
}

descMeansBy.formula <- function(formula,by) {
  model <- model.frame(formula)
  FactorialData <- cbind(by,model[2],model[1])
  SplitData <- split(FactorialData[-1],by)
  results <- lapply(SplitData,descMeans.formula,formula=formula)
  return(results)
}

describeMeansBy <- function(...,main=NULL,digits=3) {
  results <- list(formatList(descMeansBy(...),digits=digits))
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}
  return(results)
}

#### Correlate/Covary Functions for Mutiple Variables

descCorrelationBy <- function(...) 
  UseMethod("descCorrelationBy")

descCorrelationBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,descCorrelation)
  return(results)
}

dscribeCorrelationBy <- function(...,main=NULL,digits=3) {
  results <- formatList(descCorrelationBy(...),digits=digits)
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) ciMeans(x,conf.level=conf.level))
  return(results)
}

estimateMeansBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(ciMeansBy(...,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Means"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciDifference(x,conf.level=conf.level))
  return(results)
}

estimateDifferenceBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(ciDifferenceBy(...,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Interval for the Difference"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) ciContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

estimateContrastBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(ciContrastBy(...,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Interval for the Contrast"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) nhstMeans(x,mu=mu))
  return(results)
}

testMeansBy <- function(...,mu=0,main=NULL,digits=3) {
  results <- list(formatList(nhstMeansBy(...,mu=mu),digits=digits))
  if(is.null(main)) {names(results) <- "Hypothesis Tests for the Means"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstDifference(x,mu=mu))
  return(results)
}

testDifferenceBy <- function(...,mu=0,main=NULL,digits=3) {
  results <- list(formatList(nhstDifferenceBy(...,mu=mu),digits=digits))
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Difference"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) nhstContrast(x,contrast=contrast,mu=mu))
  return(results)
}

testContrastBy <- function(...,mu=0,main=NULL,digits=3) {
  results <- list(formatList(nhstContrastBy(...,mu=mu),digits=digits))
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Contrast"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss"  
  results <- lapply(ListDescStats,FUN=function(x) smdMeans(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeMeansBy <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(smdMeansBy(...,mu=mu,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Standardized Means"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdDifference(x,mu=mu,conf.level=conf.level))
  return(results)
}

standardizeDifferenceBy <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(smdDifferenceBy(...,mu=mu,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Interval for the Standardized Difference"} else {names(results) <- main}
  return(results)
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
  ListDescStats <- descMeansBy(formula,by)
  for (i in 1:length(ListDescStats)) class(ListDescStats[[i]])="bss" 
  results <- lapply(ListDescStats,FUN=function(x) smdContrast(x,contrast=contrast,conf.level=conf.level))
  return(results)
}

standardizeContrastBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- list(formatList(smdContrastBy(...,conf.level=conf.level),digits=digits))
  if(is.null(main)) {names(results) <- "Confidence Interval for the Standardized Contrast"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Plot Functions

#### Plot Function for Confidence Intervals of the Means

plotMeansBy <- function(...) 
  UseMethod("plotMeansBy")

plotMeansBy.wss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    results <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
    cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    for (j in 1:(nrow(results)-1)) arrows(j,results[j,"M"],j+1,results[j+1,"M"],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotMeansBy.bss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    results <- ciMeans(ListDescStats[[i]],conf.level=conf.level)
    cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotMeansBy.default <- function(...,by,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    for (j in 1:(nrow(results)-1)) arrows(j,results[j,"M"],j+1,results[j+1,"M"],code=3,length=0,lty=1)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotMeansBy.formula <- function(formula,by,main=NULL,ylab=NULL,xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  for (i in 1:nlevels(by)) {
    results <- ciMeansBy(formula=formula,by=by,conf.level=conf.level)[[i]][,c(2,5,6)]
    cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotDifferenceBy <-  function(...) 
  UseMethod("plotDifferenceBy")

plotDifferenceBy.wss <- function(ListDescStats,ListCorrStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    Vars <- ciMeans(ListDescStats[[i]],conf.level=conf.level)[1:2,c(2,5,6)]
    colnames(Vars) <- c("Est","LL","UL")
    Diff <- ciDifference(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)[c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotDifferenceBy.bss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  for (i in 1:length(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    Groups <- ciMeans(ListDescStats[[i]],conf.level=conf.level)[1:2,c(2,5,6)]
    colnames(Groups) <- c("Est","LL","UL")
    Diff <- ciDifference(ListDescStats[[i]],conf.level=conf.level)[c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotDifferenceBy.default <- function(...,by,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  for (i in 1:nlevels(by)) {
    Vars <- ciMeansBy(...,by=by,conf.level=conf.level)[[i]][1:2,c(2,5,6)]
    colnames(Vars) <- c("Est","LL","UL")
    Diff <- ciDifferenceBy(...,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")    
    results <- rbind(Vars,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)
  }
  par(ask=FALSE)  
}

plotDifferenceBy.formula <- function(formula,by,main=NULL,ylab=NULL,xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3){
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  for (i in 1:nlevels(by)) {
    Groups <- ciMeansBy(formula,by=by,conf.level=conf.level)[[i]]
    Groups <- Groups[1:2,c(2,5,6)]
    colnames(Groups) <- c("Est","LL","UL")
    Diff <- ciDifferenceBy(formula,by=by,conf.level=conf.level)[[i]][c(1,4,5)]
    colnames(Diff) <- c("Est","LL","UL")
    results <- rbind(Groups,Diff)
    rownames(results)[3]="Comparison"
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)  
  }
  par(ask=FALSE)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrastBy <- function(...) 
  UseMethod("plotContrastBy")

plotContrastBy.wss <- function(ListDescStats,ListCorrStats,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,labels=NULL,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
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
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotContrastBy.bss <- function(ListDescStats,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,labels=NULL,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
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
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)    
  }
  par(ask=FALSE)
}

plotContrastBy.default <- function(...,by,contrast,main=NULL,ylab="Outcome",xlab="",rope=NULL,labels=NULL,values=TRUE,digits=3){
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
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
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
    par(ask=TRUE)     
  }
  par(ask=FALSE)  
}

plotContrastBy.formula <- function(formula,by,contrast,main=NULL,ylab=NULL,xlab="",rope=NULL,labels=NULL,values=TRUE,digits=3,...){
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
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
    cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
    par(ask=TRUE)     
  }
  par(ask=FALSE)
}

#### Plot for Entire Factorial/Mixed Design

cipMeansAll <- function(results,main,ylab,xlab,col) {
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

plotMeansAll <- function(...) 
  UseMethod("plotMeansAll")

plotMeansAll.wss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- ciMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "wss"  
  cipMeansAll(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansAll.bss <- function(ListDescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- ciMeansBy(ListDescStats,conf.level=conf.level)
  class(results) <- "bss"  
  cipMeansAll(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansAll.default <- function(...,by,main=NULL,ylab="Outcome",xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- ciMeansBy(...,by=by,conf.level=conf.level)
  class(results) <- "wss"
  cipMeansAll(results,main=main,ylab=ylab,xlab=xlab,col=col)
}

plotMeansAll.formula <- function(formula,by,main=NULL,ylab=NULL,xlab="",conf.level=.95,col="black") {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  results <- ciMeansBy(formula,by=by,conf.level=conf.level)
  class(results) <- "bss"
  cipMeansAll(results,main=main,ylab=ylab,xlab=xlab,col=col)
}
