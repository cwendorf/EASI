# Estimation Approach to Statistical Inference
## Density Plots

### Density Plot

plotDensity <- function(x,...) 
  UseMethod("plotDensity")

plotDensity.default <- function(...,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.1,scale=1,col="black") {
  if(is.null(main)) {main="Density Plots for the Variables"}
  data <- data.frame(...)
  vars <- colnames(data)
  nvars <- length(data)
  z <- apply(data,2,density)
  if(!add) {
  if(is.null(ylim)) {
    rm <- range(sapply(z,"[","x"))
    ylim <- range(pretty(rm))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nvars,vars)}
  invisible(mapply(.plotCurve,z,loc=1:nvars,type=type,offset=offset,scale=scale,col=col))
} 

plotDensity.formula <- function(formula,type="right",add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=.1,scale=1,col="black") {
  if(is.null(main)) {main="Density Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  groups <- levels(group)
  ngroups <- nlevels(group)
  z <- tapply(outcome,group,density)
  if(!add) {  
  if(is.null(ylim)) {
    rm <- range(sapply(z,"[","x"))
    ylim <- range(pretty(rm))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:ngroups,groups)}
  invisible(mapply(.plotCurve,z,loc=1:ngroups,type=type,offset=offset,scale=scale,col=col))
}
