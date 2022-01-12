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

plotDiamonds.list <- function(results,add=FALSE,line=NULL,rope=NULL,col="black",hw=.2,offset=0,...) {
  if(length(results)==1) {
    results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))]
    if(!add) {
      .plotMain(results,...)
      if(!is.null(line)) {abline(h=line,lty=2,col="black")}
      if(!is.null(rope)) {rect(0,rope[1],nrow(results[[1]])+1,rope[2],col=.colorTransparent("black",15),border=NA)}}
    results <- .unformatFrame(.deList(results))
    z <- asplit(results,1)
    invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw,offset=offset))
  }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    results <- .collapseList(results)
    results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))] 
    graph <- .unformatFrame(.deList(results))    
    graph[3,] <- graph[3,]+graph[1,1]
    if(!add) {
      .plotComp(results,...)
      arrows(1:2,graph[1:2,1],4.5,graph[1:2,1],code=3,length=0,lty=2,col=col)
      if(!is.null(rope)) {
        graphrope <- rope+as.vector(graph[1,1])  
        rect(2.6,graphrope[1],3.6,graphrope[2],col=.colorTransparent("black",15),border=NA)}}

    z <- asplit(graph,1)
    invisible(mapply(.diamond,z,loc=1:nrow(graph),col=col,hw=hw,offset=offset))
  }
}
