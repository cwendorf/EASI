
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# PLOTS OF CONFIDENCE INTERVALS

# Confidence Interval Plots

plotLevels <- function(...) 
  UseMethod("plotLevels")

plotLevels.default <- function(...,conf.level=.95,mu=NULL){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Variables"
  results=easiLevels(...,conf.level=conf.level)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

plotLevels.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results=easiLevels(formula,...)
  x=eval(formula[[3]])
  y=eval(formula[[2]])
  row.names(results)=levels(x)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results),row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}  
}

# Mean Difference Plots

plotDifference <- function(...) 
  UseMethod("plotDifference")

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars=easiLevels(...)[2:1,c(2,5,6)]
  Diff=easiDifference(...)[c(1,4,5)]
  results=rbind(Vars,Diff)
  Diff=Diff+Vars[1,1]  
  graph=rbind(Vars,Diff)
  rownames(graph)[3]="Diff"
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(graph))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"M"][i],graph[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"M"][3],results[,"M"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td=graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td=graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val=axTicks(4)-graph[1,1]+td
  loc=axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups=easiLevels(formula,...)
  Groups=Groups[2:1,c(2,5,6)]
  Diff=easiDifference(formula,...)[c(1,4,5)]
  results=rbind(Groups,Diff)
  Diff=Diff+Groups[1]
  graph=rbind(Groups,Diff)
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(results))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"M"][i],graph[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"M"][3],results[,"M"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1],4.5,graph[1],code=3,length=0,lty=2)  
  arrows(2,graph[2],4.5,graph[2],code=3,length=0,lty=2)
  if(graph[1]<graph[2]) {td=graph[1]-axTicks(4)[max(which(axTicks(4)<graph[1]))]}
  if(graph[1]>=graph[2]) {td=graph[1]-axTicks(4)[min(which(axTicks(4)>graph[1]))]}  
  val=axTicks(4)-graph[1]+td
  loc=axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

# Contrast Plots

plotContrasts <- function(...) 
  UseMethod("plotContrasts")

plotContrasts.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results=easiContrasts(...)[,c(1,3,4)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

plotContrasts.formula <- function(formula,mu=NULL,...) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results=easiContrasts(formula,...)[,c(1,3,4)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

# Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results=easiPairwise(...)[,c(1,4,5)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

plotPairwise.formula <- function(formula,conf.level=.95,mu=NA,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results=easiPairwise(formula,...)[,c(1,4,5)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}
