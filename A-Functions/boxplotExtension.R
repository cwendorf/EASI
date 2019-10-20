# Estimation Approach to Statistical Inference (EASI)
## Extended Functions for Boxplot and Data
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R
### ALL BASIC FUNCTIONS FOR EASI SHOULD BE INSTALLED TOO

#### Plot Functions for Boxes and Data

boxplotData <- function(...) 
  UseMethod("boxplotData")

boxplotData.default <- function(...,method="jitter",col="gray60") {
  main="Boxplots and Data for the Levels"
  ylab="Outcome"
  xlab="Variables"
  data=data.frame(...)
  par(bty="l")
  boxplot(data,boxwex=.15,xlab="",ylab=ylab,main=main)
  mx=ncol(data)+.25
  mn=1+.25
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}  

boxplotData.formula <- function(formula,method="jitter",col="gray60",...) {
  main="Boxplots and Data for the Levels"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  par(bty="l")
  boxplot(formula,boxwex=.15,xlab="",ylab=ylab,main=main)
  x=eval(formula[[3]])
  adjustX=as.numeric(x)+.25
  mn=min(adjustX,na.rm=TRUE)
  mx=max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}
