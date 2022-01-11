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
  if(!add) {
    if(is.null(main)) {main="Frequencies for the Variables"}
    z <- apply(data,2,density)
    a <- sapply(z,"[","x")
    b <- lapply(a,function(x) c(min(x),max(x)))
    results <- data.frame(matrix(unlist(b), nrow=length(b), byrow=TRUE))
    rownames(results) <- names(data)
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  invisible(mapply(.histogram,data,x=1:length(data),offset=offset,col=col))
}

plotFrequencies.formula <- function(formula,add=FALSE,ylim=NULL,main=NULL,ylab=NULL,xlab="",offset=.1,col="black",...) {
  data <- unstack(model.frame(formula))
  if(!add) {
    if(is.null(main)) {main="Frequencies for the Groups"}
    a <- sapply(z,"[","x")
    b <- lapply(a,function(x) c(min(x),max(x)))
    results <- data.frame(matrix(unlist(b), nrow=length(b), byrow=TRUE))
    rownames(results) <- names(data)
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  invisible(mapply(.histogram,data,x=1:length(data),offset=offset,col=col))
}
