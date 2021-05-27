# Estimation Approach to Statistical Inference
## Plausibility Plots

### Basic Function

.plausible <- function(results,loc,side="right",offset=0,scale=.6,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1)) {
  y <- density(0,from=-4.5,to=4.5,bw=1,kernel="gaussian")
  y$x <- (y$x*results[2])+results[1]  
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  if(side=="both") polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
  if(side=="right") polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y1))),c(y$x,rev(y$x)),border=border,col=col)
  if(side=="left") polygon(c(y2,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

### Plot Plausibility

plotPlausible<- function(results,conf.level=.95,element=3,side="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border=rgb(0,0,0,.2),col=rgb(0,0,0,.1),digits=3) {
  if(length(results)==1) {
    results <- .unformatFrame(results[[1]])
    if(!add) {  
      if(is.null(main)) {if(nrow(results)>1) {main="Plausibility for the Variables"} else {main="Plausibility for the Variable"}}
      if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
    plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
    axis(1,1:nrow(results))}
    for(i in 1:nrow(results)) {.plausible(results[i,c(1,2)],i,side=side,offset=offset,scale=scale,border=border,col=col)}
    }
  if(length(results)==2) {
    results <- rbind(.unformatFrame(results[[1]][,c(1,2)]),.unformatFrame(results[[2]][,c(1,2)]))
    results[3,1] <- results[3,1]+results[1,1]
    if(!add) {  
      if(is.null(main)) {main="Plausibility for the Variables"}
      if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))} 
    plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nrow(results)+.5),ylim=ylim,cex.lab=1.15)
    axis(1,1:nrow(results))}
    if(element==2 || element==3) {.plausible(results[3,c(1,2)],3,side=side,offset=offset,scale=scale,border=border,col=col)}
    if(element==1 || element==3) {
      .plausible(results[1,c(1,2)],1,side=side,offset=offset,scale=scale,border=border,col=col)
      .plausible(results[2,c(1,2)],2,side=side,offset=offset,scale=scale,border=border,col=col)
      }
    }
}

### Plot Intervals

plotIntervals <- function(results,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3) {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results=.unformatFrame(.deList(results)[,c(1,4,5)])
    .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=16)
    }
  if(length(results)==2) {
    if(is.null(main)) main=names(results[2])
    results=.unformatFrame(.deList(results)[,c(1,4,5)])
    .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Difference")
    }
}
