# Estimation Approach to Statistical Inference
## Frequencies

### Descriptives

.frequencies <- function(x) {
  Freq <- table(x)
  Perc <- prop.table(table(x))
  CumFreq <- cumsum(table(x))
  CumPerc <- cumsum(table(x))/summary(table(x))[[2]]
  results <- cbind(Freq,Perc,CumFreq,CumPerc)
  return(results)  
}

.describeFrequencies <- function(x,...) 
  UseMethod(".describeFrequencies")

.describeFrequencies.default <- function(...) {
  data <- data.frame(...)
  results <- lapply(data,FUN=.frequencies)
  return(results)
}

.describeFrequencies.formula <- function(formula) {
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  results <- tapply(outcome,group,FUN=.frequencies)
  return(results)
}

describeFrequencies <- function(...,main=NULL,digits=3) {
  results <- .describeFrequencies(...) 
  if(is.null(main)) {main <- "Frequency Distribution for the Data"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Plots

.histogram <- function(y,x,offset=0,col="black") {
  y <- as.integer(y)
  yhist <- hist(y,plot=FALSE,breaks=seq(min(y)-.5,max(y)+.5,1))
  rect(x+offset,yhist$mids-.5,x+offset+yhist$density,yhist$mids+.5,border=col)
}

plotFrequencies <- function(x,...)
  UseMethod("plotFrequencies")

plotFrequencies.default <- function(...,add=FALSE,ylim=NULL,main=NULL,ylab="Outcome",xlab="",offset=.1,col="black") {
  data <- data.frame(...)
  if(is.null(ylim)) {
    z <- apply(data,2,density)
    rm <- range(sapply(z,"[","x"))
    ylim <- range(pretty(rm))}
  if(!add) {
    if(is.null(main)) {main="Frequencies for the Variables"}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=c(.4,ncol(data)+.6),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,las=1,bty="l")
    axis(1,1:ncol(data),names(data))}
  invisible(mapply(.histogram,data,x=1:ncol(data),offset=offset,col=col))
}

plotFrequencies.formula <- function(formula,add=FALSE,ylim=NULL,main=NULL,ylab=NULL,xlab="",offset=.1,col="black",...) {
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  if(!add) {
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(y)-.5),ceiling(max(y)+.5))))}
    xlim <- c(.4,nlevels(x)+.6)
    if(is.null(main)) {main="Frequencies for the Groups"}
    if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=xlim,ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,las=1,bty="l")
    axis(1,1:nlevels(x),levels(x))}
  data <- unstack(model.frame(formula))
  invisible(mapply(.histogram,data,x=1:nlevels(x),offset=offset,col=col))
}
