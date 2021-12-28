# Estimation Approach to Statistical Inference
## Diamond Plots

### Diamond Plots

.diamond <- function(results,loc,hw=.2,col="black",...) {
  mn <- results[1]
  ll <- results[2]
  ul <- results[3]
  arrows(loc-hw,mn,loc+hw,mn,length=0,col=col)
  x <- c(loc-hw,loc,loc+hw,loc,loc-hw)
  y <- c(mn,ul,mn,ll,mn)
  polygon(x,y,border=col,col=.colorTransparent(col,80),...)
}

plotDiamonds <- function(x,...) 
  UseMethod("plotDiamonds")

plotDiamonds.default <- function(...,main=NULL,digits=3,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,ylim=NULL,add=FALSE,pch=16,col="black",hw=.2) {
  results <- estimateMeans(...,mu=mu,conf.level=conf.level,main=main,digits=digits)
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
  if(!add) .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)
  if(!is.null(line)) {abline(h=line,lty=2,col="black")}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=.colorTransparent("black",15),border=NA)} 
  z <- asplit(results,1)
  invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
}

plotDiamonds.list <- function(results,mu=0,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,offset=0,col="black",hw=.2) {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
    if(!add) .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
  }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    if(is.null(main)) main=names(results[2])
    graph <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) .plotComp(graph,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab)
    results <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]    
    results[3,] <- results[3,]+results[1,1]
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
  }
}
