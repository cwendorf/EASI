# Estimation Approach to Statistical Inference
## Interval Plots

### Interval Plots

.intervalsMain <- function(results,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,line=NULL,rope=NULL,values=TRUE,digits=3,connect=FALSE,pos=2,pch=16,col="black",offset=0,intervals=TRUE,...) {
  results <- .unformatFrame(results[[1]])
  if(intervals) {
    points(1:nrow(results)+offset,results[,1],pch=pch,cex=1.5,col=col)
    arrows(1:nrow(results)+offset,results[,2],1:nrow(results)+offset,results[,3],col=col,lwd=2,length=0)}
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i+offset,results[i,1],i+1+offset,results[i+1,1],code=3,length=0,lty=1,col=col)}}
  if(!is.null(line)) {abline(h=line,lty=2,col="black")}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=.colorTransparent("black",15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    text(1:nrow(results)+offset,as.numeric(results[,1]),results[,1],cex=.8,pos=pos,offset=.5,font=2,col=col)
    text(1:nrow(results)+offset,as.numeric(results[,2]),results[,2],cex=.8,pos=pos,offset=.5,col=col)    
    text(1:nrow(results)+offset,as.numeric(results[,3]),results[,3],cex=.8,pos=pos,offset=.5,col=col)}
}

.intervalsComp <- function(results,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,slab=NULL,rope=NULL,values=TRUE,digits=3,connect=FALSE,pos=c(2,2,4),pch=c(15,15,17),col="black",intervals=TRUE,offset=0,...) {
  results <- .unformatFrame(results[[1]])
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  if(intervals) {
    points(1:3+offset,graph[,1],pch=pch,cex=1.5,col=col)
    arrows(1:3+offset,graph[,2],1:3+offset,graph[,3],col=col,lwd=2,length=0)
    arrows(c(1,2,4)+offset,graph[1:2,1],4,graph[1:2,1],code=3,length=0,lty=2,col=col)}
  if(connect) {arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1,col=col)}
  if(!is.null(rope)) {
    graphrope <- rope+as.vector(results[1,1])
    rect(2.6,graphrope[1],3.6,graphrope[2],col=.colorTransparent("black",15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    text(1:3+offset,graph[,1],results[,1],cex=.8,pos=pos,offset=.5,font=2,col=col)
    text(1:3+offset,graph[,2],results[,2],cex=.8,pos=pos,offset=.5,col=col)  
    text(1:3+offset,graph[,3],results[,3],cex=.8,pos=pos,offset=.5,col=col)}
}

.intervalsMulti <- function(results,main,ylab,xlab,col) {
  main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
  ylimmin <- floor(min(unlist(lapply(results,FUN=function(x) min(x["LL"])))))-.5
  ylimmax <- ceiling(max(unlist(lapply(results,FUN=function(x) max(x["UL"])))))+.5
  ylimrange <- range(c(ylimmin,ylimmax))
  xlimrange <- c(.4,nrow(results[[1]])+.6)
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

plotIntervals.default <- function(x,contrast=NULL,...) {
  howmany <- nrow(.estimateMeans(x))
  if (!is.null(contrast)) {
    plotMeanSubsets(x,contrast=contrast,...)}
  else if (howmany==2) {
    plotMeanComparison(x,...)}
  else {
    plotMeans(x,...)}
  invisible(eval(x)) 
}

plotIntervals.list <- function(results,add=FALSE,...) {
  out <- results
  if(length(results)==1) {
    results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))]
    if(!add) .plotMain(results,...)
    .intervalsMain(results,...)
    }
  if(length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    results <- .collapseList(results)
    results[[1]] <- results[[1]][,c(1,(ncol(results[[1]])-1):ncol(results[[1]]))]    
    if(!add) .plotComp(results,...)
    .intervalsComp(results,...)
    }
  invisible(out)
}
