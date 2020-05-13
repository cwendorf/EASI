# Estimation Approach to Statistical Inference
## General Data Functions

### Plot Functions

#### Plot Data

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data-2)),ceiling(max(data)+2))))
  xlimrange <- c(.5,ncol(data)+.5)
  mx <- ncol(data)+.15
  mn <- 1+.15
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Variables"}
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=0.08,col=col,pch=pch,cex.lab=1.3)
} 

plotData.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y-2)),ceiling(max(y)+2))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Groups"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=0.08,col=col,pch=pch,cex.lab=1.3,...)
}

#### Add Data to Plot

addData <- function(x,...) 
  UseMethod("addData")

addData.default <- function(...,method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  mx <- ncol(data)+.15
  mn <- 1+.15
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col)
}

addData.formula <- function(formula,method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col,...)
}
