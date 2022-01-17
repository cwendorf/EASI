# Estimation Approach to Statistical Inference
## Plausibility Plots

### Plausibility Plot

.plausible <- function(results) {
  out <- density(0,from=-4.5,to=4.5,bw=1,kernel="gaussian")
  out$x <- (out$x*results[2])+results[1]
  return(out)
}

plotPlausible <- function(x,...) 
  UseMethod("plotPlausible")

plotPlausible.default <- function(x,contrast=NULL,...) {
  howmany <- nrow(.describeMeans(x))
  if (!is.null(contrast)) {
    z <- estimateMeanSubsets(x,contrast=contrast,conf.level=.95)
    plotPlausible(z,...)}
  else if (howmany==2) {
    z <- estimateMeanComparison(x,conf.level=.95)
    plotPlausible(z,...)}
  else {
    z <- estimateMeans(x,...)
    plotPlausible(z,...)}
}

plotPlausible.list <- function(results,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,type="right",offset=0,scale=1,col="black",pch=16,...) {
  if(length(results)==1) {
    graph <- .unformatFrame(.deList(results))
    results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))] 
    if(!add) {
      if(is.null(main)) {main="Plausibility Plot"}
      .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim,pch=pch)}
    z <- apply(graph,1,FUN=.plausible)
    invisible(mapply(.plotCurve,z,loc=1:nrow(graph),type=type,offset=offset,scale=1,col=col))
  }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    results <- .collapseList(results)
    graph <- .unformatFrame(.deList(results))[,c(1,2)]
    if(!add) {
      if(is.null(main)) {main="Plausibility Plot"}      
      results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))]
      .plotComp(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab,pch=pch)}
    graph[3,1] <- graph[3,1]+graph[1,1]
    z <- apply(graph,1,FUN=.plausible)
    invisible(mapply(.plotCurve,z,loc=1:nrow(graph),type=type,offset=offset,scale=1,col=col))
  }
}
