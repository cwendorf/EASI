# Estimation Approach to Statistical Inference
## Diamond Plots

### Diamond Plots

.diamond <- function(results,loc,offset=0,hw=.2,col="black",...) {
  mn <- results[1]
  ll <- results[2]
  ul <- results[3]
  loc <- loc+offset
  arrows(loc-hw,mn,loc+hw,mn,length=0,col=col)
  x <- c(loc-hw,loc,loc+hw,loc,loc-hw)
  y <- c(mn,ul,mn,ll,mn)
  polygon(x,y,border=col,col=.colorTransparent(col,80),...)
}

plotDiamonds <- function(x,...) 
  UseMethod("plotDiamonds")

plotDiamonds.list <- function(results,mu=0,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,line=NULL,rope=NULL,col="black",hw=.2,offset=0) {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
    if(!add) {
      .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)
      if(!is.null(line)) {abline(h=line,lty=2,col="black")}
      if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=.colorTransparent("black",15),border=NA)}}
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw,offset=offset))
  }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    if(is.null(main)) main=names(results[2])
    graph <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) {
      .plotComp(graph,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab)
      arrows(1:2,graph[1:2,1],4.5,graph[1:2,1],code=3,length=0,lty=2,col=col)
      if(!is.null(rope)) {
        graphrope <- rope+as.vector(graph[1,1])  
        rect(2.6,graphrope[1],3.6,graphrope[2],col=.colorTransparent("black",15),border=NA)}}
    results <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]    
    results[3,] <- results[3,]+results[1,1]
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw,offset=offset))
  }
}
