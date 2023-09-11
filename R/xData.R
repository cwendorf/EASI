# Estimation Approach to Statistical Inference
## Data Plots

### Data Plot

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(frame,add=FALSE,main=NULL,ylim=NULL,ylab="Outcome",xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,lty="solid",connect=FALSE,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  loc <- (seq_along(data))+offset
  if(!add) {
    if(is.null(main)) {main="Data for the Variables"}
    results <- describePercentiles(data)
    results[[1]] <- results[[1]][,c(1,5)]
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  stripchart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  if(connect && method!="jitter") {
    lesscol <- length(data)-1
    for(i in 1:lesscol) {segments(loc[i],data[,i],loc[i+1],data[,i+1],col=.colorTransparent(col,70),lty=lty)}}
  invisible(eval(frame))
}

plotData.formula <- function(formula,add=FALSE,main=NULL,ylim=NULL,ylab=NULL,xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,...) {
  data <- unstack(model.frame(formula))
  loc <- (seq_along(data))+offset
  if(!add) {
    if(is.null(ylab)) {ylab <- all.vars(formula)[1]}
    results <- describePercentiles(data)
    results[[1]] <- results[[1]][,c(1,5)]
    if(is.null(main)) {main="Data for the Groups"}
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  stripchart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  invisible(eval(formula))
}
