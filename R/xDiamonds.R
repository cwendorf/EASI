# Estimation Approach to Statistical Inference
## Diamonds

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

plotDiamonds <- function(...,main=NULL,digits=3,ylab="Outcome",xlab="",mu=0,conf.level=.95,ylim=NULL,add=FALSE,hw=.2,col="black") {
  results <- estimateMeans(...,mu=mu,main=main,digits=digits)
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,4,5)])
  if(!add) .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)    
  z <- asplit(results,1)
  invisible(mapply(.diamond,z,loc=1:nrow(results),col=col,hw=hw))
}
