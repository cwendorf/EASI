# Estimation Approach to Statistical Inference
##  Mean Contrasts

### Confidence Intervals

estimateStandardizedMeanContrast <- function(x,...) 
  UseMethod("estimateStandardizedMeanContrast")

estimateStandardizedMeanContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
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
  if(is.null(main)) {main="Confidence Interval for the Standardized Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateStandardizedMeanContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
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
  if(is.null(main)) {main="Confidence Interval for the Standardized Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateStandardizedMeanContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateStandardizedMeanContrast(DescStats,CorrStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

estimateStandardizedMeanContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateStandardizedMeanContrast(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

### Confidence Interval Plots

plotStandardizedMeanContrast <- function(x,...) 
  UseMethod("plotStandardizedMeanContrast")

plotStandardizedMeanContrast.wss <- function(DescStats,CorrStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,line=NULL,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=24,col="black") {
  results <- .unformatFrame(estimateStandardizedMeanContrast(DescStats,CorrStats,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Standardized Mean Contrast"}
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanContrast.bss <- function(DescStats,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,line=NULL,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=24,col="black") {
  results <- .unformatFrame(estimateStandardizedMeanContrast(DescStats,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Standardized Mean Contrast"}
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

plotStandardizedMeanContrast.default <- function(...,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,line=NULL,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=24,col="black") {
  results <- .unformatFrame(estimateStandardizedMeanContrast(...,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Standardized Mean Contrast"}
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanContrast.formula <- function(formula,contrast,main=NULL,ylab="Standardized Mean Contrast",xlab="",conf.level=.95,line=NULL,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=24,col="black") {
  results <- .unformatFrame(estimateStandardizedMeanContrast(formula,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Standardized Mean Contrast"}
  .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}
