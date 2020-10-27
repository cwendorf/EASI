# Estimation Approach to Statistical Inference
## Functions for Density and Violin Plots

### Plot Functions

#### Violin Functions

.vio <- function(var,loc,offset=0,scale=.6,border="gray75",col="gray90") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
}

.halfvio <- function(var,loc,offset=0,scale=.6,border="gray75",col="gray90") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

plotViolins <- function(x,...) 
  UseMethod("plotViolins")

plotViolins.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90") {
  if(is.null(main)) {main="Violin Plots for the Variables"}
  data <- data.frame(...)
  vars <- colnames(data)
  nvars <- length(data)
  if(!add) {
  if(is.null(ylim)) {
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim,cex.lab=1.3)
  axis(1,1:nvars,vars)}
  for(i in 1:nvars) {.vio(data[,i],i,offset=offset,scale=scale,border=border,col=col)}
} 

plotViolins.formula <- function(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90") {
  if(is.null(main)) {main="Violin Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  groups <- levels(group)
  ngroups <- nlevels(group)
  if(!add) {  
  if(is.null(ylim)) {
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.3)
  axis(1,1:ngroups,groups)}
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.vio(outcome,i,offset=offset,scale=scale,border=border,col=col))}
}
