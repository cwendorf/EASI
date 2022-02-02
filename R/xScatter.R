# Estimation Approach to Statistical Inference
## Bivariate Scatterplots

### Scatter Plots

plotScatter <- function(x,...) 
  UseMethod("plotScatter")

plotScatter.wss <- function(DescStats,CorrStats,y=NULL,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,ellipse=TRUE,conf.level=.95,cross=FALSE,col="black",...) {
  if(!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn==deparse(substitute(y)))
    rn <- c(rn[-ri],rn[ri])
    DescStats <- DescStats[rn,]
    class(DescStats) <- "wss"}
  mu <- DescStats[1:2,2]
  P <- CorrStats
  evals <- eigen(P)$values
  evecs <- eigen(P)$vectors
  a <- seq(0, 2*pi, len=100)
  c2 <- qchisq(conf.level,2)
  c <- sqrt(c2)
  xT <- c * sqrt(evals[1]) * cos(a)
  yT <- c * sqrt(evals[2]) * sin(a)
  M <- cbind(xT, yT)
  transM <- evecs %*% t(M)
  transM <- t(transM)
  transM[,1] <- transM[,1]+mu[1]
  transM[,2] <- transM[,2]+mu[2]
  if(!add) {
  if(is.null(xlab)) xlab=rownames(DescStats)[1]
  if(is.null(ylab)) ylab=rownames(DescStats)[2]
  if(is.null(xlim)) {
    rmx=c(min(transM[,1]),max(transM[,1]))
    xlim <- range(pretty(rmx))}
  else {xlim=xlim}
  if(is.null(ylim)) {
    rmy=c(min(transM[,2]),max(transM[,2]))
    ylim <- range(pretty(rmy))} 
  else {ylim=ylim} 
  plot(NULL,bty="l",main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15,xlim=xlim,ylim=ylim,col=.colorTransparent(col,100))}
  if(cross) {
    abline(v=mu[1],col=.colorTransparent(col,50))
    abline(h=mu[2],col=.colorTransparent(col,50))}
  if(ellipse) {lines(transM,col=.colorTransparent(col,100))}  
}

plotScatter.default <- function(frame,y=NULL,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,points=TRUE,ellipse=FALSE,conf.level=.95,cross=FALSE,col="black",...) {
  frame <- data.frame(frame)
  if(!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci],cn[ci])
    frame <- frame[,cn]} 
  sigma2 <- cov(frame)
  mu <- sapply(frame,mean,na.rm=TRUE)
  P <- cov2cor(sigma2)
  evals <- eigen(P)$values
  evecs <- eigen(P)$vectors
  a <- seq(0, 2*pi, len=100)
  c2 <- qchisq(conf.level,2)
  c <- sqrt(c2)
  xT <- c * sqrt(evals[1]) * cos(a)
  yT <- c * sqrt(evals[2]) * sin(a)
  M <- cbind(xT, yT)
  transM <- evecs %*% t(M)
  transM <- t(transM)
  transM[,1] <- transM[,1]+mu[1]
  transM[,2] <- transM[,2]+mu[2]
  if(!add) {
  if(is.null(xlab)) xlab=colnames(frame)[1]
  if(is.null(ylab)) ylab=colnames(frame)[2]
  if(is.null(xlim)) {
    rmx=c(min(transM[,1],frame[,1]),max(transM[,1],frame[,1]))
    xlim <- range(pretty(rmx))}
  else {xlim=xlim}
  if(is.null(ylim)) {
    rmy=c(min(transM[,2],frame[,2]),max(transM[,2],frame[,2]))
    ylim <- range(pretty(rmy))} 
  else {ylim=ylim}  
  plot(NULL,bty="l",main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15,xlim=xlim,ylim=ylim,col=.colorTransparent(col,100))}
  if(cross) {
    abline(v=mu[1],col=.colorTransparent(col,50))
    abline(h=mu[2],col=.colorTransparent(col,50))}
  if(points) {points(frame,pch=pch,col=.colorTransparent(col,100))}
  if(ellipse) {lines(transM,col=.colorTransparent(col,100))}
  invisible(eval(frame))  
}
