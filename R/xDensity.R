# Estimation Approach to Statistical Inference
## Density Plots

### Density Plot

.density <- function(var,loc,type="right",offset=.07,scale=1.5,col="black") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  if(type=="full") polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=.colorTransparent(col,50),col=.colorTransparent(col,30))
  if(type=="right") polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y1))),c(y$x,rev(y$x)),border=.colorTransparent(col,50),col=.colorTransparent(col,30))
  if(type=="left") polygon(c(y2,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=.colorTransparent(col,50),col=.colorTransparent(col,30))
}

plotDensity <- function(x,...) 
  UseMethod("plotDensity")

plotDensity.default <- function(...,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.07,scale=1.5,col="black") {
  if(is.null(main)) {main="Density Plots for the Variables"}
  data <- data.frame(...)
  vars <- colnames(data)
  nvars <- length(data)
  if(!add) {
  if(is.null(ylim)) {
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))[[1]]
  rm <- c(min(z[,1]),max(z[,1]))
  ylim <- range(pretty(rm))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nvars,vars)}
  for(i in 1:nvars) {.density(data[,i],i,type=type,offset=offset,scale=scale,col=col)}
} 

plotDensity.formula <- function(formula,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.07,scale=1.5,col="black") {
  if(is.null(main)) {main="Density Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  groups <- levels(group)
  ngroups <- nlevels(group)
  if(!add) {  
  if(is.null(ylim)) {
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))[[1]]
  rm <- c(min(z[,1]),max(z[,1]))
  ylim <- range(pretty(rm))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:ngroups,groups)}
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.density(outcome,i,type=type,offset=offset,scale=scale,col=col))}
}
