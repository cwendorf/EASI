# Estimation Approach to Statistical Inference
## Extension for Arelational and Relational Intervals

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Relational Interval Function

ciRelational <- function(...) 
  UseMethod("ciRelational")

ciRelational.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  results <- ciMeans(DescStats,conf.level=conf.level,...)
  mymodel <- descOmnibus(DescStats,CorrStats)
  dfe <- mymodel[3,2]
  mse <- mymodel[3,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,2]-a1*a2/2
  riul <- results[,2]+a1*a2/2
  results <- round(cbind(results[,c(2,5,6)],rill,riul),3)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

ciRelational.bss <- function(DescStats,conf.level=.95,...) {
  results <- ciMeans(DescStats,conf.level=conf.level,...)
  mymodel <- descOmnibus(DescStats)
  dfe <- mymodel[2,2]
  mse <- mymodel[2,3]
  ntilde <- 1/mean(1/results[[1]]) 
  a2 <- sqrt(2*mse/ntilde)
  a1 <- qt(1/2-conf.level/2,dfe,lower.tail=FALSE)
  rill <- results[,2]-a1*a2/2
  riul <- results[,2]+a1*a2/2
  results <- round(cbind(results[,c(2,5,6)],rill,riul),3)
  colnames(results) <- c("M","CI.LL","CI.UL","RI.LL","RI.UL")
  return(results)
}

ciRelational.default <- function(...,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)  
  results <- ciRelational(DescStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciRelational.formula <- function(formula,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciRelational(DescStats,conf.level=conf.level)
  return(results)
}

estimateRelational <- function(...){
  cat("\nCONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS\n\n")
  print(ciRelational(...))
  cat("\n")
}

### Add Relational Intervals to Existing CI Plot

addRelational <- function(...) 
  UseMethod("addRelational")

addRelational.wss <- function(DescStats,CorrStats,conf.level=.95,mu=NA,...) {
  results <- ciRelational(DescStats,CorrStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=rgb(.5,.5,.5,.4),border=NA)
}

addRelational.bss <- function(DescStats,conf.level=.95,mu=NA,...) {
  results <- ciRelational(DescStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=rgb(.5,.5,.5,.4),border=NA)
}

addRelational.default <- function(...,conf.level=.95,mu=NA){
  results <- ciRelational(...,conf.level=conf.level)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=rgb(.5,.5,.5,.4),border=NA)
}

addRelational.formula <- function(formula,conf.level=.95,mu=NA,...){
  results <- ciRelational(formula,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=rgb(.5,.5,.5,.4),border=NA)
}

### Plot Confidence and Relational Intervals

plotRelational <- function(...) 
  UseMethod("plotRelational")

plotRelational.bss <- function(DescStats,conf.level=.95,mu=NULL,rope=NULL,...) {
  main="Confidence and Relational Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeans(DescStats,conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu,rope)
  addRelational(DescStats,conf.level,...)
}

plotRelational.default <- function(...,mu=NULL,rope=NULL,conf.level=.95) {
  main="Confidence and Relational Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu,rope)
  addRelational(...,conf.level=conf.level)
}

plotRelational.formula <- function(formula,conf.level=.95,mu=NULL,rope=NULL,...) {
  main="Confidence and Relational Intervals for the Means"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- ciMeans(formula,conf.level,...)[,c(2,5,6)]
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  cipMeans(results,main,ylab,xlab,mu,rope)
  addRelational(formula,conf.level,...)
}

### Add Data to Plot

addData <- function(...) 
  UseMethod("addData")

addData.default <- function(...,method="jitter",col="gray60") {
  data <- data.frame(...)
  mx <- ncol(data)+.15
  mn <- 1+.15
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}  

addData.formula <- function(formula,method="jitter",col="gray60",...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}
