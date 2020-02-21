# Estimation Approach to Statistical Inference
## Extension for Relational Intervals

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASIFUNCTIONS INTO R

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
  results <- data.frame(results[,c(2,5,6)],rill,riul)
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
  results <- data.frame(results[,c(2,5,6)],rill,riul)
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

estimateRelational <- function(...,digits=3){
  cat("\nCONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS\n\n")
  print(formatFrame(ciRelational(...),digits=digits))
  cat("\n")
}

### Add Relational Intervals to Existing CI Plot

addRelational <- function(...) 
  UseMethod("addRelational")

addRelational.wss <- function(DescStats,CorrStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- ciRelational(DescStats,CorrStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.bss <- function(DescStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- ciRelational(DescStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.default <- function(...,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4)){
  results <- ciRelational(...,conf.level=conf.level)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.formula <- function(formula,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...){
  results <- ciRelational(formula,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

### Plot Confidence and Relational Intervals

plotRelational <- function(...) 
  UseMethod("plotRelational")

plotRelational.wss <- function(DescStats,CorrStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(DescStats,CorrStats,conf.level=conf.level,...)
}

plotRelational.bss <- function(DescStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(DescStats,conf.level=conf.level,...)
}

plotRelational.default <- function(...,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(...,conf.level=conf.level)
}

plotRelational.formula <- function(formula,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(formula,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(formula,conf.level=conf.level,...)
}
