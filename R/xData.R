# Estimation Approach to Statistical Inference
## Data Plots

### Data Plot

.dots <- function(var,loc,offset=0,jitter=0,col="black",pch=16) {
  newx <- NULL
  for(i in 1:length(var)) {newx[i] <- loc+runif(1,min=-(jitter/2),max=(jitter/2))+offset}
  points(newx,var,col=.colorTransparent(col,70),pch=pch)
}

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=.12,method="stack",jitter=.05,col="black",pch=16,lty="solid",connect=FALSE) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data)-.5),ceiling(max(data)+.5))))
  xlimrange <- c(.5,ncol(data)+.5)
  loc <- (1:ncol(data))+offset
  lesscol <- ncol(data)-1
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Variables"}
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=loc,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=.colorTransparent(col,70),pch=pch,cex.lab=1.15)
  if(connect && method!="jitter") {for(i in 1:lesscol) {segments(loc[i],data[,i],loc[i+1],data[,i+1],col=.colorTransparent(col,70),lty=lty)}}
} 

plotData.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",offset=.12,method="stack",jitter=.05,col="black",pch=16,...) {
  x <- eval(formula[[3]])
  loc <- (1:nlevels(x))+offset
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y)-.5),ceiling(max(y)+.5))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Groups"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=loc,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=.colorTransparent(col,70),pch=pch,cex.lab=1.15,...)
}
