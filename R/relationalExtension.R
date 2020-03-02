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

estimateRelational <- function(...,main=NULL,digits=3) {
  results <- formatList(list(ciRelational(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence and Relational Intervals for the Means"} else {names(results) <- main}
  return(results)
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

plotRelational.wss <- function(DescStats,CorrStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,"M"],i+1,results[i+1,"M"],code=3,length=0,lty=1)}  
  addRelational(DescStats,CorrStats,conf.level=conf.level,...)
}

plotRelational.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(DescStats,conf.level=conf.level,...)
}

plotRelational.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,"M"],i+1,results[i+1,"M"],code=3,length=0,lty=1)}   
  addRelational(...,conf.level=conf.level)
}

plotRelational.formula <- function(formula,main=NULL,ylab=NULL,xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence and Relational Intervals for the Means"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  results <- ciMeans(formula,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(formula,conf.level=conf.level,...)
}
