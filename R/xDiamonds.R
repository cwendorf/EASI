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

plotDiamonds.list <- function(results,mu=0,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,offset=0,col="black",hw=.2) {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results <- .unformatFrame(.deList(results)[,c(1,4,5)])
    if(!add) .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
  }
  if(length(results)==2) {
    if(is.null(main)) main=names(results[2])
    graph <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) .plotComp(graph,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab)
    results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
    results[3,] <- results[3,]+results[1,1]
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
  }
}
