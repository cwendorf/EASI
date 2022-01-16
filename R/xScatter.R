# Estimation Approach to Statistical Inference
## Bivariate Scatterplots

### Scatter Plots

plotScatter <- function(x,...) 
  UseMethod("plotScatter")

plotScatter.wss <- function(DescStats,CorrStats,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,ellipse=TRUE,conf.level=.95,cross=FALSE,col="black",...) {
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

plotScatter.default <- function(x,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,points=TRUE,ellipse=FALSE,conf.level=.95,cross=FALSE,col="black",...) {
  data <- data.frame(x)[,c(1:2)]
  sigma2 <- cov(data)
  mu <- sapply(data,mean,na.rm=TRUE)
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
  if(is.null(xlab)) xlab=colnames(data)[1]
  if(is.null(ylab)) ylab=colnames(data)[2]
  if(is.null(xlim)) {
    rmx=c(min(transM[,1],data[,1]),max(transM[,1],data[,1]))
    xlim <- range(pretty(rmx))}
  else {xlim=xlim}
  if(is.null(ylim)) {
    rmy=c(min(transM[,2],data[,2]),max(transM[,2],data[,2]))
    ylim <- range(pretty(rmy))} 
  else {ylim=ylim}  
  plot(NULL,bty="l",main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15,xlim=xlim,ylim=ylim,col=.colorTransparent(col,100))}
  if(cross) {
    abline(v=mu[1],col=.colorTransparent(col,50))
    abline(h=mu[2],col=.colorTransparent(col,50))}
  if(points) {points(data,pch=pch,col=.colorTransparent(col,100))}
  if(ellipse) {lines(transM,col=.colorTransparent(col,100))}
}
