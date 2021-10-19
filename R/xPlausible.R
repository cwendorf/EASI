# Estimation Approach to Statistical Inference
## Plausibility Plots

### Basic Function

.plausible <- function(results,loc,side="right",offset=0,scale=.6,border="black",col="black") {
  y <- density(0,from=-4.5,to=4.5,bw=1,kernel="gaussian")
  y$x <- (y$x*results[2])+results[1]  
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  if(side=="both") polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
  if(side=="right") polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y1))),c(y$x,rev(y$x)),border=border,col=col)
  if(side=="left") polygon(c(y2,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

### Plot Plausibility

plotPlausible <- function(x,...) 
  UseMethod("plotPlausible")

plotPlausible.list <- function(results,conf.level=.95,element=3,side="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,offset=0,scale=.8,border="black",col="black",digits=3) {
  border <- .colorTransparent(col,50)
  col <- .colorTransparent(col,35)
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
    graph <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) {  
      if(is.null(main)) {main="Plausibility for the Variables"}
      if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(graph-.4)),ceiling(max(graph)+.4))))} 
      par(mar=c(5,5,5,5))  
      plot(NULL,xaxt="n",yaxt="n",xaxs="i",yaxs="i",xlim=c(.4,3.6),ylim=ylim,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.15,bty="n")
      axis(1,.4:2.4,labels=FALSE,lwd.tick=0)
      axis(1,2.6:3.6,labels=FALSE,lwd.tick=0)
      axis(1,at=c(1,2),labels=rownames(graph)[1:2])
      axis(1,at=3,labels=rownames(graph)[3])
      axis(2)
      axis(2,at=ylim,labels=FALSE,lwd.tick=0)
      td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]
      val <- axTicks(4)-graph[1,1]+td
      loc <- axTicks(4)+td
      axis(4,at=ylim,labels=FALSE,lwd.tick=0)
      axis(4,at=loc,labels=val,las=1)
      mtext(slab,side=4,las=3,cex=1.15,line=3)}
    results <- rbind(.unformatFrame(results[[1]][,c(1,2)]),.unformatFrame(results[[2]][,c(1,2)]))
    results[3,1] <- results[3,1]+results[1,1]    
    if(element==2 || element==3) {.plausible(results[3,c(1,2)],3,side=side,offset=offset,scale=scale,border=border,col=col)}
    if(element==1 || element==3) {
      .plausible(results[1,c(1,2)],1,side=side,offset=offset,scale=scale,border=border,col=col)
      .plausible(results[2,c(1,2)],2,side=side,offset=offset,scale=scale,border=border,col=col)
      }
    }
}

### Plot Intervals

plotIntervals <- function(x,...) 
  UseMethod("plotIntervals")

plotIntervals.list <- function(results,main=NULL,ylab="Outcome",xlab="",line=NULL,rope=NULL,values=TRUE,ylim=NULL,add=FALSE,digits=3,col="black") {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results=.unformatFrame(.deList(results)[,c(1,4,5)])
    .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=16,col=col)
    }
  if(length(results)==2) {
    if(is.null(main)) main=names(results[2])
    results=.unformatFrame(.deList(results)[,c(1,4,5)])
    .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,slab="Difference",col=col)
    }
}
