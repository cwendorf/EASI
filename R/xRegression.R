# Estimation Approach to Statistical Inference
## Bivariate Regression

### Confidence Intervals

.eR <- function(dM,eR,dRO,value,conf.level) {
  N <- dM[1]
  M <- dM[2]
  SD <- dM[3]
  SSx <- (SD^2)*(N-1)
  intercept <- eR[1,1]
  slope <- eR[2,1]
  MSres <- dRO[2,3]
  tval <- qt((1-conf.level)/2, df=N-2)
  fit <- slope*value + intercept
  cill <- sqrt(MSres * (1/N + (value - M)^2/SSx)) * tval + fit
  ciul <- sqrt(MSres * (1/N + (value - M)^2/SSx)) * tval * (-1) + fit
  pill <- sqrt(MSres * (1 + 1/N + (value - M)^2/SSx)) * tval + fit
  piul <- sqrt(MSres * (1 + 1/N + (value - M)^2/SSx)) * tval * (-1) + fit
  intervals <- cbind(Est=fit,CI.LL=cill,CI.UL=ciul,PI.LL=pill,PI.UL=piul)
  rownames(intervals) <- value
  intervals
}

.estimateRegression <- function(x,...) 
  UseMethod(".estimateRegression")

.estimateRegression.default <- function(Predictor,Criterion,value,conf.level=.95) {
  dM <- .describeMeans(Predictor)
  eR <- .unformatFrame(estimateRegressionCoefficients(Predictor,Criterion)[[1]])
  dRO <- .unformatFrame(describeRegressionOmnibus(Predictor,Criterion)[[1]])
  .eR(dM,eR,dRO,value=value,conf.level=conf.level)
}

.estimateRegression.wss <- function(PredStats,CritStats,CorrStats,value,conf.level=.95) {
  dM <- PredStats
  eR <- .unformatFrame(estimateRegressionCoefficients(PredStats,CritStats,CorrStats)[[1]])
  dRO <- .unformatFrame(describeRegressionOmnibus(PredStats,CritStats,CorrStats)[[1]])
  .eR(dM,eR,dRO,value=value,conf.level=conf.level)
}

estimateRegression <- function(...,value=NULL,conf.level=.95,main=NULL,digits=3) {
  results <- .estimateRegression(...,value=value,conf.level=conf.level)
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence and Prediction Intervals for the Regression Line"} else {main="Confidence and Prediction Intervals for the Regression Value"}} 
  .formatList(list(results),main=main,digits=digits)  
}

### Confidence Interval Plots

.pR <- function(intervals,results=NULL,interval=FALSE,values=TRUE,conf.level=.95,digits=3,col="black") {
  newx <- as.numeric(rownames(intervals))
  if(interval=="prediction" || interval=="both") {  
    lines(newx,intervals$PI.LL,col=.colorTransparent(col,100),lty=2)
    lines(newx,intervals$PI.UL,col=.colorTransparent(col,100),lty=2)}
  if(interval=="confidence" || interval=="both") {
    lines(newx,intervals$CI.LL,col=.colorTransparent(col,200),lty=2)
    lines(newx,intervals$CI.UL,col=.colorTransparent(col,200),lty=2)}
  if(!is.null(results)) {
    value <- as.numeric(rownames(results))
    labels <- .formatFrame(results,digits=digits)
    if(interval=="confidence" || interval=="prediction" || interval=="both") {
      if(values) text(value,results[1],labels[1],cex=.8,pos=2,offset=.5,font=2,col=col)}
    if(interval=="confidence" || interval=="both") {
      lines(x=c(value,value),y=c(results[2],results[3]),lwd=2,col=col)
      if(values) {for (i in 2:3) text(value,results[i],labels[i],cex=.8,pos=2,offset=.5,font=2,col=col)}}
    if(interval=="prediction" || interval=="both") {
      lines(x=c(value,value),y=c(results[4],results[5]),lwd=1,col=col)
      if(values) {for (i in 4:5) text(value,results[i],labels[i],cex=.8,pos=2,offset=.5,font=2,col=col)}}}
}

plotRegression <- function(x,...) 
  UseMethod("plotRegression")

plotRegression.default <- function(Predictor,Criterion,line=TRUE,value=NULL,range=NULL,interval=FALSE,values=TRUE,conf.level=.95,xlim=NULL,ylim=NULL,main="Regression Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,points=FALSE,cross=FALSE,digits=3,col="black",add=FALSE) {
  if(is.null(xlab)) xlab=deparse(substitute(Predictor))
  if(is.null(ylab)) ylab=deparse(substitute(Criterion))
  if(is.null(xlim)) {
    xmin = min(Predictor)
    xmax = max(Predictor)
    xlim = c(xmin,xmax)}
  else {
    xlim=xlim
    xmin=xlim[1]
    xmax=xlim[2]}
  if(is.null(range)) {range <- seq(xmin-.25,xmax+.25,by=.05)} else {range <- seq(range[1],range[2],by=.05)}
  intervals <- as.data.frame(.estimateRegression(Predictor,Criterion,value=range,conf.level))
  if(is.null(ylim)) {ylim <- c(min(intervals),max(intervals))}
  if(!add) {plotScatter(Predictor,Criterion,xlim=xlim,ylim=ylim,main=main,xlab=xlab,ylab=ylab,points=points,pch=pch)}
  if(cross) {
    abline(v=mean(Predictor),col=.colorTransparent(col,50))
    abline(h=mean(Criterion),col=.colorTransparent(col,50))}
  if(line) {
    Est <- .unformatFrame(estimateRegressionCoefficients(Predictor,Criterion)[[1]])[,"Est"]
    abline(Est[1],Est[2],col=col)}  
  if(!is.null(value)) {results <- .estimateRegression(Predictor,Criterion,value=value,conf.level=conf.level)} else {results=NULL}
  .pR(intervals,results,interval=interval,values=values,conf.level=conf.level,digits=digits,col=col)
}

plotRegression.wss <- function(PredStats,CritStats,CorrStats,line=TRUE,value=NULL,range=NULL,interval="both",values=TRUE,conf.level=.95,xlim=NULL,ylim=NULL,main="Regression Plot for the Variables",ylab=NULL,xlab=NULL,pch=16,points=FALSE,cross=FALSE,digits=3,col="black",add=FALSE) {
  if(is.null(xlab)) xlab=rownames(PredStats)
  if(is.null(ylab)) ylab=rownames(CritStats)
  if(is.null(xlim)) {
    xmin = PredStats[,"M"]-2*PredStats[,"SD"]
    xmax = PredStats[,"M"]+2*PredStats[,"SD"]
    xlim = c(xmin,xmax)}
  else {
    xlim=xlim
    xmin=xlim[1]
    xmax=xlim[2]}    
  if(is.null(range)) {range <- seq(xmin-.25,xmax+.25,by=.05)} else {range <- seq(range[1],range[2],by=.05)}
  intervals <- as.data.frame(.estimateRegression(PredStats,CritStats,CorrStats,value=range,conf.level))
  if(is.null(ylim)) {ylim <- c(min(intervals),max(intervals))}
  if(!add) plot(NULL,bty="l",xlim=xlim,ylim=ylim,main=main,pch=pch,xlab=xlab,ylab=ylab,cex.lab=1.15)
  if(cross) {
    abline(v=PredStats[,"M"],col=.colorTransparent(col,50))
    abline(h=CritStats[,"M"],col=.colorTransparent(col,50))}
  if(line) {
    Est <- .unformatFrame(estimateRegressionCoefficients(PredStats,CritStats,CorrStats)[[1]])[,"Est"]
    abline(Est[1],Est[2],col=col)} 
  if(!is.null(value)) {results <- .estimateRegression(PredStats,CritStats,CorrStats,value=value,conf.level=conf.level)} else {results=NULL}
  .pR(intervals,results,interval=interval,values=values,conf.level=conf.level,digits=digits,col=col)
}
