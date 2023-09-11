# Estimation Approach to Statistical Inference
## Boxplots

### Descriptives

.describeBoxes <- function(x,...)
  UseMethod(".describeBoxes")

.describeBoxes.default <- function(frame,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  colnames(results) <- c("LW","LH","Mdn","UH","UW")
  return(results)
}

.describeBoxes.formula <- function(formula) {
  results <- aggregate(formula,FUN=.describeBoxes.default)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("LW","LH","Mdn","UH","UW")  
  return(results)
}

describeBoxes <- function(...,main=NULL,digits=3) {
  results <- .describeBoxes(...)
  if(is.null(main)) {main <- "Boxplot Statistics for the Data"}
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}

### Plots

.bp <- function(results,main,ylab,xlab,ylim,values,digits,pos,connect,add,col,offset,scale) {
  if(!add) {
    if(is.null(ylim)) {ylim <- range(pretty(c(floor(min(results)-.5),ceiling(max(results)+.5))))}
    plot(NULL,xaxs="i",yaxs="i",xaxt="n",xlim=c(.4,nrow(results)+.6),ylim=ylim,xlab=xlab,cex.lab=1.15,ylab=ylab,main=main,las=1,bty="l")
    axis(1,seq_len(nrow(results)),row.names(results))}
  width <- .03*scale
  rect(seq_len(nrow(results))+offset-width,results[,2],seq_len(nrow(results))+offset+width,results[,4],border=col,lwd=2,col=.colorTransparent(col,30))
  arrows(seq_len(nrow(results))+offset,results[,1],seq_len(nrow(results))+offset,results[,2],length=0,lwd=2,col=col)
  arrows(seq_len(nrow(results))+offset,results[,4],seq_len(nrow(results))+offset,results[,5],length=0,lwd=2,col=col)
  arrows(seq_len(nrow(results))+offset-width,results[,3],seq_len(nrow(results))+offset+width,results[,3],length=0,lwd=3,col=col)
  arrows(seq_len(nrow(results))+offset-width,results[,1],seq_len(nrow(results))+offset+width,results[,1],length=0,lwd=2,col=col)
  arrows(seq_len(nrow(results))+offset-width,results[,5],seq_len(nrow(results))+offset+width,results[,5],length=0,lwd=2,col=col)
  if(connect) {if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i+offset,results[i,3],i+1+offset,results[i+1,3],code=3,length=0,lty=1,col=col)}}
  if(values) {
    results <- .formatFrame(results,digits=digits)
    tweak <- .5+(scale-1)/4
    text(seq_len(nrow(results))+offset,as.numeric(results[,1]),results[,1],cex=.8,pos=pos,offset=tweak,col=col)
    text(seq_len(nrow(results))+offset,as.numeric(results[,2]),results[,2],cex=.8,pos=pos,offset=tweak,col=col)
    text(seq_len(nrow(results))+offset,as.numeric(results[,3]),results[,3],cex=.8,pos=pos,offset=tweak,font=2,col=col)
    text(seq_len(nrow(results))+offset,as.numeric(results[,4]),results[,4],cex=.8,pos=pos,offset=tweak,col=col)
    text(seq_len(nrow(results))+offset,as.numeric(results[,5]),results[,5],cex=.8,pos=pos,offset=tweak,col=col)}
}


plotBoxes <- function(x,...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(frame,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=1,col="black",values=TRUE,digits=3,pos=2) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  if(is.null(ylim)) {
    z <- apply(data,2,density)
    rm <- range(sapply(z,"[","x"))
    ylim <- range(pretty(rm))}
  results <- .unformatFrame(describeBoxes(data,main=main,digits=digits)[[1]])
  if(is.null(main)) {if(nrow(results)>1) {main="Boxplots for the Variables"} else {main="Boxplot for the Variable"}}
 .bp(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim,values=values,digits=digits,pos=pos,connect=FALSE,add=add,col=col,offset=offset,scale=scale)
  invisible(eval(frame))
}

plotBoxes.formula <- function(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=1,col="black",values=TRUE,digits=3,pos=2) {
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  if(is.null(ylim)) {
    z <- tapply(outcome,group,density)
    rm <- range(sapply(z,"[","x"))
    ylim <- range(pretty(rm))}
  results <- .unformatFrame(describeBoxes(formula=formula,main=main,digits=digits)[[1]])
  if(is.null(main)) {if(nrow(results)>1) {main="Boxplots for the Groups"} else {main="Boxplot for the Group"}}  
 .bp(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim,values=values,digits=digits,pos=pos,connect=FALSE,add=add,col=col,offset=offset,scale=scale)
  invisible(eval(formula))
}
