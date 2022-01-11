# Estimation Approach to Statistical Inference
## Interval Plots

### Interval Plots

.intervalsMain <- function(results,main,ylab,xlab,line,rope,values,ylim,digits,connect,pos=2,pch=16,slab=NULL,add=FALSE,points=TRUE,col="black") {
  if(!add) .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)
  if(points) {
    points(results[,1],pch=pch,cex=1.5,col=col)
    arrows(1:nrow(results),results[,2],1:nrow(results),results[,3],col=col,lwd=2,length=0)}
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1,col=col)}}
  if(!is.null(line)) {abline(h=line,lty=2,col="black")}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=.colorTransparent("black",15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    text(1:nrow(results),as.numeric(results[,1]),results[,1],cex=.8,pos=pos,offset=.5,font=2,col=col)
    text(1:nrow(results),as.numeric(results[,2]),results[,2],cex=.8,pos=pos,offset=.5,col=col)    
    text(1:nrow(results),as.numeric(results[,3]),results[,3],cex=.8,pos=pos,offset=.5,col=col)}
}

.intervalsComp <- function(results,main,ylab,xlab,rope,values,ylim,digits,connect,pos=c(2,2,4),pch=c(16,16,17),slab=NULL,add=FALSE,points=TRUE,col="black") {
  if(!add) .plotComp(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim,slab=slab)
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  graphrope <- rope+as.vector(results[1,1])
  if(points) {
    points(c(1,2,3),graph[,1],pch=pch,cex=1.5,col=col)
    arrows(1:3,graph[,2],1:3,graph[,3],col=col,lwd=2,length=0)
    arrows(1:2,graph[1:2,1],4.5,graph[1:2,1],code=3,length=0,lty=2,col=col)}
  if(connect) {arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1,col=col)}
  if(!is.null(rope)) {rect(2.6,graphrope[1],3.6,graphrope[2],col=.colorTransparent("black",15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    text(1:3,graph[,1],results[,1],cex=.8,pos=pos,offset=.5,font=2,col=col)
    text(1:3,graph[,2],results[,2],cex=.8,pos=pos,offset=.5,col=col)  
    text(1:3,graph[,3],results[,3],cex=.8,pos=pos,offset=.5,col=col)}
}

.intervalsMulti <- function(results,main,ylab,xlab,col) {
  main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
  ylimmin <- floor(min(unlist(lapply(results,FUN=function(x) min(x["LL"])))))-.5
  ylimmax <- ceiling(max(unlist(lapply(results,FUN=function(x) max(x["UL"])))))+.5
  ylimrange <- range(c(ylimmin,ylimmax))
  xlimrange <- c(.5,nrow(results[[1]])+.5)
  plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=xlimrange,ylim=ylimrange,ylab=ylab,xlab=xlab,cex.lab=1.15,main=main,bty="l")
  axis(1, 1:nrow(results[[1]]), row.names(results[[1]])) 
  for (i in 1:length(results)) {
    if(length(col)==1) {tempcol=col} else {tempcol=col[i]}
    for (j in 1:nrow(results[[i]])) {lines(x=c(j+(i-(length(results)+1)/2)*.15,j+(i-(length(results)+1)/2)*.15),y=c(results[[i]][,4][j],results[[i]][,5][j]),lwd=2,col=tempcol)}
    points(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,1],cex=1.5,pch=16,bty="l",col=tempcol)
    if(class(results)=="wss") lines(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,1],bty="l",col=tempcol)
  }
}

### Confidence Interval Plot

plotIntervals <- function(x,...) 
  UseMethod("plotIntervals")

plotIntervals.list <- function(results,main=NULL,ylab="Outcome",xlab="",line=NULL,rope=NULL,values=TRUE,ylim=NULL,add=FALSE,digits=3,col="black") {
  if(length(results)==1) {
    if(is.null(main)) main=names(results[1])
    results <- .unformatFrame(.deList(results)[,c(1,4,5)])
    .intervalsMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=16,col=col)
    }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    if(is.null(main)) main=names(results[2])
    results <- .unformatFrame(.deList(results)[,c(1,4,5)])
    .intervalsComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,slab="Difference",col=col)
    }
}
