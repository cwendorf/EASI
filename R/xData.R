# Estimation Approach to Statistical Inference
## Data Plots

### Data Plot

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylim=NULL,ylab="Outcome",xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,lty="solid",connect=FALSE) {
  data <- data.frame(...)
  loc <- (1:length(data))+offset
  if(!add) {
    if(is.null(main)) {main="Data for the Variables"}
    results <- .describePercentiles(...)
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  stripchart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  if(connect && method!="jitter") {
    lesscol <- length(data)-1
    for(i in 1:lesscol) {segments(loc[i],data[,i],loc[i+1],data[,i+1],col=.colorTransparent(col,70),lty=lty)}}
}

plotData.formula <- function(formula,add=FALSE,main=NULL,ylim=NULL,ylab=NULL,xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,...) {
  data <- unstack(model.frame(formula))
  loc <- (1:length(data))+offset
  if(!add) {
    if(is.null(main)) {main="Data for the Groups"}
    if(is.null(ylab)) {ylab <- all.vars(formula)[1]}
    results <- .describePercentiles(formula)
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  stripchart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
}
