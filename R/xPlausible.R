# Estimation Approach to Statistical Inference
## Plausibility Plots

### Plausibility Plot

.plausible <- function(results) {
  y <- density(0,from=-4.5,to=4.5,bw=1,kernel="gaussian")
  y$x <- (y$x*results[2])+results[1]
  return(y)
}

plotPlausible <- function(x,...) 
  UseMethod("plotPlausible")

plotPlausible.list <- function(results,conf.level=.95,add=TRUE,main="Plausibility Plots",ylab="Outcome",xlab="",slab="Difference",ylim=NULL,type="right",offset=0,scale=1,col="black") {
  if(length(results)==1) {
    results <- .unformatFrame(.deList(results))
    if(!add) .plotMain(results[,c(1,4,5)],main=main,ylab=ylab,xlab=xlab,ylim=ylim)
    z <- apply(results,1,FUN=.plausible)
    invisible(mapply(.density,z,loc=1:nrow(results),type=type,offset=offset,scale=1,col=col))
  }
  if(length(results)==2) {
    graph <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) .plotComp(graph,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab)
    results <- rbind(.unformatFrame(results[[1]][,c(1,2)]),.unformatFrame(results[[2]][,c(1,2)]))
    results[3,1] <- results[3,1]+results[1,1]
    z <- apply(results,1,FUN=.plausible)
    invisible(mapply(.density,z,loc=1:nrow(results),type=type,offset=offset,scale=1,col=col))
  }
}
