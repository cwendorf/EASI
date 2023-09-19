# Estimation Approach to Statistical Inference
## Interval Plots

### Interval Plots

.intervalsMain <- function(results,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,line=NULL,rope=NULL,values=TRUE,digits=3,connect=FALSE,pos=2,pch=16,col="black",offset=0,intervals=TRUE,...) {
  results <- .unformatFrame(results[[1]])
  if(intervals) {
    arrows(1:nrow(results)+offset,results[,2],1:nrow(results)+offset,results[,3],col=col,lwd=2,length=0)}
    points(1:nrow(results)+offset,results[,1],pch=pch,cex=1.5,col=col,lwd=2,bg=.colorIntensity(col,.6))
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i+offset,results[i,1],i+1+offset,results[i+1,1],code=3,length=0,lty=1,col="black")}}
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
    arrows(1:3+offset,graph[,2],1:3+offset,graph[,3],col=col,lwd=2,length=0)
    arrows(c(1,2,4)+offset,graph[1:2,1],4,graph[1:2,1],code=3,length=0,lty=2,col=col)}
    points(1:3+offset,graph[,1],pch=pch,cex=1.5,col=col,lwd=2,bg=.colorIntensity(col,.6))
  if(connect) {arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1,col="black")}
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
    if(class(results)=="wss") lines(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,1],bty="l",col=tempcol)
    points(1:nrow(results[[i]])+(i-(length(results)+1)/2)*.15,results[[i]][,1],cex=1.5,pch=16,bty="l",col=tempcol,lwd=2)
  }
}

.intervalsDiffogram <- function(dm,emp,main=NULL,ylab="",xlab="",ylim=NULL,pch=17,col=NULL) {
  fm <- t(combn(dm[,"M"],2))
  colnames(fm) <- c('M1','M2')
  dif <- (emp[,5]-emp[,4])/4
  lox <- fm[,1]-dif
  hix <- fm[,1]+dif
  loy <- fm[,2]+dif
  hiy <- fm[,2]-dif
  if(is.null(main)) {if(nrow(emp)>1) {main <- "Confidence Intervals for the Pairwise Mean Comparisons"} else {main <- "Confidence Interval for the Pairwise Mean Comparison"}}  
  main <- paste(strwrap(main,width = 0.7 * getOption("width")),collapse="\n")
  if(is.null(ylim)) {
  mn <- min(lox,loy,hix,hiy)-2
  mx <- max(hix,hiy,lox,loy)+2
  ylim<- c(mn,mx)}
  pc <- cbind(emp[,4] <= 0 & emp[,5] >= 0 )
  if(is.null(col)) {col <- c("black","black")}
  if(length(col)==1) col = c(col,"black")  
  col <- ifelse(pc,col[2],col[1])
  par(mar=c(5,5,6,5))
  plot(NULL,bty="l",cex.lab=1.15,xlim=ylim,ylim=ylim,xlab=xlab,ylab=ylab)
  title(main,line=4)
  arrows(mn,mn,mx,mx,length=0,lty=2)
  abline(v=dm[,2],col="gray90")
  mtext(rownames(dm),side=3,at=dm[,2],las=2,line=-2)
  abline(h=dm[,2],col="gray90")
  mtext(rownames(dm),side=4,at=dm[,2],las=1,line=-2)
  arrows(lox,loy,hix,hiy,length=0,lwd=2,col=col)  
  points(fm[,1],fm[,2],pch=pch,col=col,lwd=2)
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
