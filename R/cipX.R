# Estimation Approach to Statistical Inference
## Confidence Interval Plots

### Main Effect Plot

.cipMain <- function(results,main,ylab,xlab,mu,rope,values,ylim,digits,connect,pch=16,slab=NULL,add=FALSE,points=TRUE,col="black") {
  if(!add) {
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=c(.5,nrow(results)+.5),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,las=1,bty="l")
    axis(1,1:nrow(results),row.names(results))}
  if(points) {
    points(results[,1],pch=pch,cex=1.5,col=col)
    for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2,col=col)}
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1,col=col)}}
  if(!is.null(mu)) {abline(h=mu,lty=2,col=col)}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=.colorTransparent(col,15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    for (i in 1:nrow(results)) text(i,as.numeric(results[i,1]),results[i,1],cex=.8,pos=2,offset=.5,font=2,col=col)
    for (i in 1:nrow(results)) text(i,as.numeric(results[i,2]),results[i,2],cex=.8,pos=2,offset=.5,col=col)  
    for (i in 1:nrow(results)) text(i,as.numeric(results[i,3]),results[i,3],cex=.8,pos=2,offset=.5,col=col)}
}

### Comparison Plot

.cipComp <- function(results,main,ylab,xlab,rope,values,ylim,digits,connect,pch=c(16,16,17),slab=NULL,add=FALSE,points=TRUE,col="black") {
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  graphrope <- rope+as.vector(results[1,1])
  if(!add) {
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(graph[,2]-.4)),ceiling(max(graph[,3])+.4))))}
    par(mar=c(5,5,5,5))  
    plot(NULL,xaxt="n",yaxt="n",xaxs="i",yaxs="i",xlim=c(.4,3.6),ylim=ylim,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.15,bty="n")
    axis(1,.4:2.4,labels=FALSE,lwd.tick=0)
    axis(1,2.6:3.6,labels=FALSE,lwd.tick=0)
    axis(1,at=c(1,2),labels=rownames(graph)[1:2])
    axis(1,at=3,labels=rownames(graph)[3])
    axis(2)
    axis(2,at=ylim,labels=FALSE,lwd.tick=0)
    if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
    if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
    val <- axTicks(4)-graph[1,1]+td
    loc <- axTicks(4)+td
    axis(4,at=ylim,labels=FALSE,lwd.tick=0)
    axis(4,at=loc,labels=val,las=1)
    mtext(slab,side=4,las=3,cex=1.15,line=3)}
  if(points) {
    points(c(1,2,3),graph[,1],pch=pch,cex=1.5,col=col)
    for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2,col=col)
    arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2,col=col)  
    arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2,col=col)}
  if(connect) {arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1,col=col)}
  if(!is.null(rope)) {rect(2.6,graphrope[1],3.6,graphrope[2],col=.colorTransparent(col,15),border=NA)} 
  if(values) {
    results <- .formatFrame(results,digits=digits)
    for (i in 1:2) text(i,graph[i,1],results[i,1],cex=.8,pos=2,offset=.5,font=2,col=col)
    for (i in 1:2) text(i,graph[i,2],results[i,2],cex=.8,pos=2,offset=.5,col=col)  
    for (i in 1:2) text(i,graph[i,3],results[i,3],cex=.8,pos=2,offset=.5,col=col)
    text(3,graph[3,1],results[3,1],cex=.8,pos=4,offset=.5,font=2,col=col)
    text(3,graph[3,2],results[3,2],cex=.8,pos=4,offset=.5,col=col)  
    text(3,graph[3,3],results[3,3],cex=.8,pos=4,offset=.5,col=col)}
}

### Interaction Plot

.cipAll <- function(results,main,ylab,xlab,col) {
  ylimmin <- floor(min(unlist(lapply(results,FUN=function(x) min(x["LL"])))))-1
  ylimmax <- ceiling(max(unlist(lapply(results,FUN=function(x) max(x["UL"])))))+1
  ylimrange <- range(c(ylimmin,ylimmax))
  xlimrange <- c(.5,nrow(results[[1]])+.5)
  plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=xlimrange,ylim=ylimrange,ylab=ylab,xlab=xlab,cex.lab=1.15,main=main,bty="l")
  axis(1, 1:nrow(results[[1]]), row.names(results[[1]])) 
  for (i in 1:length(results)) {
    if(length(col)==1) {tempcol=col} else {tempcol=col[i]}
    for (j in 1:nrow(results[[i]])) {lines(x=c(j+(i-(length(results)+1)/2)*.15,j+(i-(length(results)+1)/2)*.15),y=c(results[[i]][,5][j],results[[i]][,6][j]),lwd=2,col=tempcol)}
    points(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],cex=1.5,pch=16,bty="l",col=tempcol)
    if(class(results)=="wss") lines(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,2],bty="l",col=tempcol)
  }
}
