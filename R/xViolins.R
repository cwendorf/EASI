# Estimation Approach to Statistical Inference
## Functions for Density and Violin Plots

### Plot Functions

.violin <- function(var,loc,type="fullvio",offset=0,scale=.8,border="gray80",col="gray80") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  if(type=="fullvio") polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
  if(type=="rightvio") polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y1))),c(y$x,rev(y$x)),border=border,col=col)
  if(type=="leftvio") polygon(c(y2,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

plotViolins <- function(x,...) 
  UseMethod("plotViolins")

plotViolins.default <- function(...,type="fullvio",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="gray80",col="gray80") {
  if(is.null(main)) {main="Violin Plots for the Variables"}
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
  for(i in 1:nvars) {.violin(data[,i],i,type=type,offset=offset,scale=scale,border=border,col=col)}
} 

plotViolins.formula <- function(formula,type="fullvio",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="gray80",col="gray80") {
  if(is.null(main)) {main="Violin Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  groups <- levels(group)
  ngroups <- nlevels(group)
  if(!add) {  
  if(is.null(ylim)) {
  z <- tapply(Outcome,Factor,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))[[1]]
  rm <- c(min(z[,1]),max(z[,1]))
  ylim <- range(pretty(rm))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:ngroups,groups)}
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.violin(outcome,i,type=type,offset=offset,scale=scale,border=border,col=col))}
}
