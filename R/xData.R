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

plotData.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=.12,method="stack",jitter=.05,col="black",pch=16) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data)-.5),ceiling(max(data)+.5))))
  xlimrange <- c(.5,ncol(data)+.5)
  mx <- ncol(data)+offset
  mn <- 1+offset
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Variables"}
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=.colorTransparent(col,70),pch=pch,cex.lab=1.15)
} 

plotData.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",offset=.12,method="stack",jitter=.05,col="black",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+offset
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y)-.5),ceiling(max(y)+.5))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Groups"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=.colorTransparent(col,70),pch=pch,cex.lab=1.15,...)
}
