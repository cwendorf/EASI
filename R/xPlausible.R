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

plotPlausible.list <- function(results,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",slab="Difference",ylim=NULL,type="right",offset=0,scale=1,col="black",pch=16) {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results <- as.data.frame(.unformatFrame(.deList(results)))
    if(!add) {.plotMain(results[,c(1,4,5)],main=main,ylab=ylab,xlab=xlab,ylim=ylim,pch=pch)}
    z <- apply(results,1,FUN=.plausible)
    invisible(mapply(.plotCurve,z,loc=1:nrow(results),type=type,offset=offset,scale=1,col=col))
  }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    if(is.null(main)) main=names(results[2])
    graph <- .unformatFrame(.deList(results))[,c("Est","LL","UL")]
    graph[3,1] <- graph[3,1]+graph[1,1]
    if(!add) {
      .plotComp(graph,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab,pch=pch)
      arrows(1:2,graph[1:2,1],4.5,graph[1:2,1],code=3,length=0,lty=2,col=col)}
    results <- rbind(.unformatFrame(results[[1]][,c(1,2)]),.unformatFrame(results[[2]][,c(1,2)]))
    results[3,1] <- results[3,1]+results[1,1]
    z <- apply(results,1,FUN=.plausible)
    invisible(mapply(.plotCurve,z,loc=1:nrow(results),type=type,offset=offset,scale=1,col=col))
  }
}

plotPlausibleComparison <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black",type="right",offset=0,scale=1) {
  results <-estimateMeanComparison(...,main=main,conf.level=conf.level,digits=digits)
  plotIntervals(results,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,col=col)
  plotPlausible(results,add=TRUE,col=col,type=type,offset=offset,scale=scale)
}
