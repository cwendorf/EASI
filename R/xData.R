# Estimation Approach to Statistical Inference
## Data Plots

### Data Plot

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylim=NULL,ylab="Outcome",xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,lty="solid",connect=FALSE) {
  data <- data.frame(...)
  loc <- (1:ncol(data))+offset
  lesscol <- ncol(data)-1
  if(!add) {
    if(is.null(main)) {main="Data for the Variables"}
    main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(data)-.5),ceiling(max(data)+.5))))}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",bty="l",xlim=c(.4,ncol(data)+.6),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main)
    axis(1,1:ncol(data),colnames(data))
  }
  stripchart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  if(connect && method!="jitter") {for(i in 1:lesscol) {segments(loc[i],data[,i],loc[i+1],data[,i+1],col=.colorTransparent(col,70),lty=lty)}}
}

plotData.formula <- function(formula,add=FALSE,main=NULL,ylim=NULL,ylab=NULL,xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,...) {
  x <- eval(formula[[3]])
  loc <- (1:nlevels(x))+offset
  y <- eval(formula[[2]])
  if(!add) {
    if(is.null(main)) {main="Data for the Groups"}
    main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(y)-.5),ceiling(max(y)+.5))))}
    if(is.null(ylab)) {ylab <- all.vars(formula)[1]}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=c(.4,nlevels(x)+.6),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,bty="l")
    axis(1,1:nlevels(x),levels(x))
  }
  stripchart(formula,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
}
