# Estimation Approach to Statistical Inference
##  Mean Contrasts

### Confidence Intervals

.estimateStandardizedMeanContrast <- function(x,...) 
  UseMethod(".estimateStandardizedMeanContrast")

.estimateStandardizedMeanContrast.wss <- function(DescStats,CorrStats,contrast,conf.level=.95,labels=NULL) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.estimateStandardizedMeanContrast.bss <- function(DescStats,contrast,conf.level=.95,labels=NULL) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.estimateStandardizedMeanContrast.default <- function(...,contrast,conf.level=.95,labels=NULL) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateStandardizedMeanContrast.wss(DescStats,CorrStats,contrast,conf.level=conf.level,labels=labels)
}

.estimateStandardizedMeanContrast.formula <- function(formula,contrast,conf.level=.95,labels=NULL) {
  DescStats <- .describeMeans(formula)
  .estimateStandardizedMeanContrast.bss(DescStats,contrast,conf.level=conf.level,labels=labels)
}

estimateStandardizedMeanContrast <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeanContrast(...)
  if(is.null(main)) {main <- "Confidence Interval for the Standardized Mean Contrast"}
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanContrast <- function(...,main=NULL,digits=3,ylab="Standardized Mean Contrast",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,pch=24,col="black") {
  results <- estimateStandardizedMeanContrast(...,conf.level=conf.level,main=main,digits=digits)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,3,4)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
}
