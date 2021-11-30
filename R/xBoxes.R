# Estimation Approach to Statistical Inference
## Boxplots

### Descriptives

.describeBoxes <- function(x,...)
  UseMethod(".describeBoxes")

.describeBoxes.default <- function(...) {
  data <- data.frame(...)
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  colnames(results) <- c("LW","LH","Mdn","UH","UW")
  return(results)
}

.describeBoxes.formula <- function(formula) {
  results <- aggregate(formula,FUN=describeBoxes)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  return(results)
}

describeBoxes <- function(...,main=NULL,digits=3) {
  results <- .describeBoxes(...)
  if(is.null(main)) {if(nrow(results)>1) {main="Boxplot Statistics for the Variables"} else {main="Boxplot Statistics for the Variable"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

### Plots

.bp <- function(results,main,ylab,xlab,values,ylim,digits,connect,add,border,col,offset,scale) {
  if(!add) {
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results-.4)),ceiling(max(results)+.4))))}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=c(.5,nrow(results)+.5),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,las=1,bty="l")
    axis(1,1:nrow(results),row.names(results))}
  for (i in 1:nrow(results)) {
    lines(x=c(i,i),y=c(results[i,1],results[i,2]),lwd=2,lty=2,col=border)
    lines(x=c(i,i),y=c(results[i,4],results[i,5]),lwd=2,lty=2,col=border)
    rect(i+offset-.03,results[i,2],i+offset+.03,results[i,4],border=border,col=col,lwd=2)
    arrows(i+offset-.03,results[i,3],i+offset+.03,results[i,3],length=0,lwd=3,col=border)
    arrows(i+offset-.02,results[i,1],i+offset+.02,results[i,1],length=0,lwd=2,col=border)
    arrows(i+offset-.02,results[i,5],i+offset+.02,results[i,5],length=0,lwd=2,col=border)}
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i+.03,results[i,3],i+1-.03,results[i+1,3],code=3,length=0,lty=1)}}
  if(values) {
    results <- .formatFrame(results,digits=digits)
    for (i in 1:nrow(results)) {
    text(i,as.numeric(results[i,1]),results[i,1],cex=.8,pos=2,offset=.9)
    text(i,as.numeric(results[i,2]),results[i,2],cex=.8,pos=2,offset=.9)  
    text(i,as.numeric(results[i,3]),results[i,3],cex=.8,pos=2,offset=.9)
    text(i,as.numeric(results[i,4]),results[i,4],cex=.8,pos=2,offset=.9)
    text(i,as.numeric(results[i,5]),results[i,5],cex=.8,pos=2,offset=.9)}}
}

plotBoxes <- function(x,...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="black",col=rgb(0,0,0,0),values=TRUE,digits=3) {
  data <- data.frame(...)
  if(is.null(ylim)) {
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))[[1]]
  rm <- c(min(z[,1]),max(z[,1]))
  ylim <- range(pretty(rm))}
  results <- .unformatFrame(describeBoxes(...,main=main,digits=digits)[[1]])
  if(is.null(main)) {if(nrow(results)>1) {main="Boxplots for the Variables"} else {main="Boxplot for the Variable"}}
 .bp(results,main=main,ylab=ylab,xlab=xlab,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add,border=border,col=col,offset=offset,scale=scale)
}

plotBoxes.formula <- function(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="black",col=rgb(0,0,0,0),values=TRUE,digits=3) {
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  if(is.null(ylim)) {
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))[[1]]
  rm <- c(min(z[,1]),max(z[,1]))
  ylim <- range(pretty(rm))}
  results <- .unformatFrame(describeBoxes(formula=formula,main=main,digits=digits)[[1]])
  if(is.null(main)) {if(nrow(results)>1) {main="Boxplots for the Groups"} else {main="Boxplot for the Group"}}  
 .bp(results,main=main,ylab=ylab,xlab=xlab,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,border=border,col=col,offset=offset,scale=scale)
}
