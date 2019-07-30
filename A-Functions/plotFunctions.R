
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES 

### Confidence Interval Plot Functions

#### Plot Function for Confidence Intervals for Multiple Groups and Levels

plotLevels <- function(...) 
  UseMethod("plotLevels")

plotLevels.default <- function(...,conf.level=.95,mu=NULL){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Variables"
  results <- easiLevels(...,conf.level=conf.level)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

plotLevels.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- easiLevels(formula,...)
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results),row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}  
}

#### Plot Function for Confidence Intervals of a Mean Difference/Comparison of Groups and Variables

plotDifference <- function(...) 
  UseMethod("plotDifference")

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars <- easiLevels(...)[2:1,c(2,5,6)]
  Diff <- easiDifference(...)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  Diff <- Diff+Vars[1,1]  
  graph <- rbind(Vars,Diff)
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
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups <- easiLevels(formula,...)
  Groups <- Groups[2:1,c(2,5,6)]
  Diff <- easiDifference(formula,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  Diff <- Diff+Groups[1]
  graph <- rbind(Groups,Diff)
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
  if(graph[1]<graph[2]) {td <- graph[1]-axTicks(4)[max(which(axTicks(4)<graph[1]))]}
  if(graph[1]>=graph[2]) {td <- graph[1]-axTicks(4)[min(which(axTicks(4)>graph[1]))]}  
  val <- axTicks(4)-graph[1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Groups and Variables

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.default <- function(...,contrast){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Variables"
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- easiContrast(...,contrast=convar1)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- easiContrast(...,contrast=convar2)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- easiContrast(...,contrast=contrast)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  Diff <- Diff+Vars[1,1]  
  graph <- rbind(Vars,Diff)
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=c("Neg Weighted","Pos Weighted","Contrast"))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"Est"][i],graph[,"Est"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"Est"][3],results[,"Est"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1],4.5,graph[1],code=3,length=0,lty=2)  
  arrows(2,graph[2],4.5,graph[2],code=3,length=0,lty=2)
  if(graph[1]<graph[2]) {td <- graph[1]-axTicks(4)[max(which(axTicks(4)<graph[1]))]}
  if(graph[1]>=graph[2]) {td <- graph[1]-axTicks(4)[min(which(axTicks(4)>graph[1]))]}  
  val <- axTicks(4)-graph[1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)  
}

plotContrast.formula <- function(formula,contrast,...){
  main="Confidence Intervals for the Contrast"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- easiContrast(formula,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- easiContrast(formula,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- easiContrast(formula,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  Diff <- Diff+Groups[1]
  graph <- rbind(Groups,Diff)
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=c("Neg Weighted","Pos Weighted","Contrast"))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"Est"][i],graph[,"Est"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"Est"][3],results[,"Est"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1],4.5,graph[1],code=3,length=0,lty=2)  
  arrows(2,graph[2],4.5,graph[2],code=3,length=0,lty=2)
  if(graph[1]<graph[2]) {td <- graph[1]-axTicks(4)[max(which(axTicks(4)<graph[1]))]}
  if(graph[1]>=graph[2]) {td <- graph[1]-axTicks(4)[min(which(axTicks(4)>graph[1]))]}  
  val <- axTicks(4)-graph[1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}
