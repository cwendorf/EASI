# Estimation Approach to Statistical Inference
## Cateye Plots

### Plots

.cateye <- function(results,loc,type="right",offset=0,scale=.6,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1)) {
  y <- density(0,from=-4.5,to=4.5,bw=1,kernel="gaussian")
  y$x <- (y$x*results[2])+results[1]  
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  if(type=="full") polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
  if(type=="right") polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y1))),c(y$x,rev(y$x)),border=border,col=col)
  if(type=="left") polygon(c(y2,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

plotCateyes <- function(x,...) 
  UseMethod("plotCateyes")

plotCateyes.wss <- function(DescStats,conf.level=.95,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1),digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]])
  if(!add) {
  if(is.null(main)) {if(nrow(results)>1) {main="Cateyes for the Variables"} else {main="Cateye for the Variable"}} 
  if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nrow(results))}  
  for(i in 1:nrow(results)) {.cateye(results[i,c(1,2)],i,type=type,offset=offset,scale=scale,border=border,col=col)}
}

plotCateyes.bss <- function(DescStats,conf.level=.95,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1),digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]])
  if(!add) {
  if(is.null(main)) {if(nrow(results)>1) {main="Cateyes for the Groups"} else {main="Cateye for the Group"}} 
  if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nrow(results))}  
  for(i in 1:nrow(results)) {.cateye(results[i,c(1,2)],i,type=type,offset=offset,scale=scale,border=border,col=col)}
}

plotCateyes.default <- function(...,conf.level=.95,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1),digits=3) {
  results <- .unformatFrame(estimateMeans(...,conf.level=conf.level,main=main,digits=digits)[[1]])
  if(!add) {  
  if(is.null(main)) {if(nrow(results)>1) {main="Cateyes for the Variables"} else {main="Cateye for the Variable"}}
  if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nrow(results))}
  for(i in 1:nrow(results)) {.cateye(results[i,c(1,2)],i,type=type,offset=offset,scale=scale,border=border,col=col)}
}

plotCateyes.formula <- function(formula,conf.level=.95,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1),digits=3) {
  results <- .unformatFrame(estimateMeans(formula=formula,conf.level=conf.level,main=main,digits=digits)[[1]])
  if(!add) {  
  if(is.null(main)) {if(nrow(results)>1) {main="Cateyes for the Groups"} else {main="Cateye for the Group"}}
  if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nrow(results))}  
  for(i in 1:nrow(results)) {.cateye(results[i,c(1,2)],i,type=type,offset=offset,scale=scale,border=border,col=col)}
}
