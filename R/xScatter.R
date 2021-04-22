# Estimation Approach to Statistical Inference
## Bivariate Scatter and Regression Line Plots

### Scatter Plots

plotScatter <- function(x,...) 
  UseMethod("plotScatter")

plotScatter.default <- function(x,y,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,points=TRUE,line=TRUE,col="black") {
  if(!add) {
  if(is.null(xlab)) xlab=deparse(substitute(x))
  if(is.null(ylab)) ylab=deparse(substitute(y))
  if(is.null(xlim)) {
  xmin = min(x)
  xmax = max(x)
  xlim = c(xmin,xmax)}
  else {xlim=xlim}
  if(is.null(ylim)) {
  ymin = min(y)
  ymax = max(y)
  ylim = c(ymin,ymax)} 
  else {ylim=ylim}  
  plot(NULL,bty="l",main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15,xlim=xlim,ylim=ylim,col=col)}
  if(points) {points(x,y,pch=pch,col=col)}
  if(line) {
  Est <- .unformatFrame(estimateRegression(x,y)[[1]])[,"Est"]
  abline(Est[1],Est[2],col=col)}
}

plotScatter.wss <- function(PredStats,CritStats,CorrStats,main="Scatter Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,xlim=NULL,ylim=NULL,add=FALSE,line=TRUE,col="black") {
  if(is.null(xlab)) xlab=rownames(PredStats)
  if(is.null(ylab)) ylab=rownames(CritStats)
  if(is.null(xlim)) {
  xmin = PredStats[,"M"]-2*PredStats[,"SD"]
  xmax = PredStats[,"M"]+2*PredStats[,"SD"]
  xlim = c(xmin,xmax)}
  else {xlim=xlim}
  if(is.null(ylim)) {
  ymin = CritStats[,"M"]-2*CritStats[,"SD"]
  ymax = CritStats[,"M"]+2*CritStats[,"SD"]
  ylim = c(ymin,ymax)} 
  else {ylim=ylim} 
  plot(NULL,bty="l",xlim=xlim,ylim=ylim,main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15)
  if(line) {  
  Est <- .unformatFrame(estimateRegression(PredStats,CritStats,CorrStats)[[1]])[,"Est"]
  abline(Est[1],Est[2],col=col)}
}
