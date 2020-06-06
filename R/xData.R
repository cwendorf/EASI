# Estimation Approach to Statistical Inference
## General Data Functions

### Plot Functions

#### Plot Data

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=.15,method="jitter",jitter=.08,col="gray30",pch=16) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data-.4)),ceiling(max(data)+.4))))
  xlimrange <- c(.5,ncol(data)+.5)
  mx <- ncol(data)+offset
  mn <- 1+offset
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Variables"}
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=col,pch=pch,cex.lab=1.3)
} 

plotData.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",offset=.15,method="jitter",jitter=.08,col="gray30",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+offset
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y-.4)),ceiling(max(y)+.4))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Groups"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=jitter,col=col,pch=pch,cex.lab=1.3,...)
}

#### Add Data to Plot

addplotData <- function(x,...) 
  UseMethod("addplotData")

addplotData.default <- function(...,offset=.15,method="jitter",col="gray30",pch=16,jitter=.08) {
  data <- data.frame(...)
  mx <- ncol(data)+offset
  mn <- 1+offset
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=jitter,pch=pch,col=col)
}

addplotData.formula <- function(formula,offset=.15,method="jitter",col="gray30",pch=16,jitter=.08,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+offset
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=jitter,pch=pch,col=col,...)
}
