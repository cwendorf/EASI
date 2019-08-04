
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# ALL FUNCTIONS (DESCRIBE, ESTIMATE, PLOT, TEST, AND EFFECT)
# TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R 

### Describe Functions

#### Describe Function for Mutiple Groups and Variables

describeLevels <- function(...) 
  UseMethod("describeLevels")

describeLevels.default <- function(...){
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- round(cbind(N=N,M=M,SD=SD),3)
  results
}

describeLevels.formula <- function(formula,...){
  results <- aggregate(formula,FUN=describeLevels,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  results
}

#### Correlate/Covary Function for Mutiple Variables

correlateLevels <- function(...) 
  UseMethod("correlateLevels")

correlateLevels.default <- function(...){
  data <- data.frame(...)
  results <- cor(data)
  results
}

cor2cov <- function(corrstats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * corrstats
  covstats
}

### Confidence Interval Functions

#### EASI Function for Mutiple Groups and Variables

easiLevels <- function(...) 
  UseMethod("easiLevels")

easiLevels.wss <- easiLevels.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- round(cbind(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
  results
}

easiLevels.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- easiLevels(sumstats,conf.level=conf.level)
  results
}

easiLevels.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- easiLevels(sumstats,conf.level=conf.level)
  results
}

#### EASI Function for Group and Variable Differences 

easiDifference <- function(...) 
  UseMethod("easiDifference")
  
easiDifference.wss <- function(compstats,corrstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  results
}

easiDifference.bss <- function(compstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  results
}

easiDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- easiLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- easiDifference(compstats,corrstats,conf.level=conf.level)
  results
}

easiDifference.formula <- function(formula,conf.level=.95,...){
  compstats <- easiLevels(formula)
  class(compstats) <- "bss"
  results <- easiDifference(compstats,conf.level=conf.level)
  results
}

#### EASI Function for a Single Group and Variable Contrast

easiContrast <- function(...) 
  UseMethod("easiContrast")

easiContrast.wss <- function(sumstats,corrstats,contrast,conf.level=.95) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cor2cov(corrstats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  round(results,3)
}

easiContrast.bss <- function(sumstats,contrast,conf.level=.95,...) {
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  round(results,3)
}

easiContrast.default <- function(...,contrast,conf.level=.95){
  sumstats <- easiLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- easiContrast(sumstats,corrstats,contrast,conf.level=conf.level)
  results
}

easiContrast.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- easiLevels(formula)
  class(sumstats) <- "bss"
  results <- easiContrast(sumstats,contrast,conf.level=conf.level)
  results
}

### Wrappers for EASI Functions

estimateLevels <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS\n\n")
  print(easiLevels(...))
  cat("\n")
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(easiDifference(...)) 
  cat("\n")  
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(easiContrast(...)) 
  cat("\n")  
}


### Confidence Interval Plot Functions

#### Basic Plot Functions

cipLevels <- function(results,main,ylab,xlab,mu){
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

cipDifference <- function(results,main,ylab,xlab){
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,2])/2)*2,ceiling(max(graph[,3])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(graph))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2)
  for (i in 1:2) text(i,graph[,1][i],graph[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,2][i],graph[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,3][i],graph[,3][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,1][3],results[,1][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,2][3],results[,2][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,3][3],results[,3][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

#### Plot Function for Confidence Intervals for Multiple Groups and Levels

plotLevels <- function(...) 
  UseMethod("plotLevels")

plotLevels.default <- function(...,conf.level=.95,mu=NULL){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Variables"
  results <- easiLevels(...,conf.level=conf.level)[,c(2,5,6)]
  cipLevels(results,main,ylab,xlab,mu)
}

plotLevels.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- easiLevels(formula,...)[,c(2,5,6)]
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  cipLevels(results,main,ylab,xlab,mu)
}
 
plotLevels.wss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Variables"
  results <- easiLevels(sumstats,...)[,c(2,5,6)]
  cipLevels(results,main,ylab,xlab,mu)
}

plotLevels.bss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Groups"
  results <- easiLevels(sumstats,...)[,c(2,5,6)]
  cipLevels(results,main,ylab,xlab,mu)
}


#### Plot Function for Confidence Intervals of a Mean Difference/Comparison of Groups and Variables

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(compstats,corrstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Groups <- easiLevels(compstats,...)[2:1,c(2,5,6)]
  Diff <- easiDifference(compstats,corrstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.bss <- function(compstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Groups"
  Groups <- easiLevels(compstats,...)[2:1,c(2,5,6)]
  Diff <- easiDifference(compstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars <- easiLevels(...)[2:1,c(2,5,6)]
  Diff <- easiDifference(...)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups <- easiLevels(formula,...)
  Groups <- Groups[2:1,c(2,5,6)]
  Diff <- easiDifference(formula,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Groups and Variables

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.bss <- function(sumstats,contrast,...){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Groups"
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- easiContrast(sumstats,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- easiContrast(sumstats,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- easiContrast(sumstats,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")
  cipDifference(results,main,ylab,xlab)
}


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
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")
  cipDifference(results,main,ylab,xlab)  
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
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast") 
  cipDifference(results,main,ylab,xlab)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Mutiple Groups and Variables

nhstLevels <- function(...) 
  UseMethod("nhstLevels")
  
nhstLevels.wss <- nhstLevels.bss <- function(sumstats,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SE <- sumstats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  results
}

nhstLevels.default <- function(...,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- nhstLevels(sumstats,mu=mu)
  results
}

nhstLevels.formula <- function(formula,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstLevels(sumstats,mu=mu)
  results
}

##### NHST Function for Group and Variable Differences

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(compstats,corrstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)  
  rownames(results) <- c("Comparison")
  results
}

nhstDifference.bss <- function(compstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  results
}

nhstDifference.default <- function(x,y,mu=0){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- nhstDifference(compstats,corrstats,mu=mu)
  results
}

nhstDifference.formula <- function(formula,mu=0,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- nhstDifference(compstats,mu=mu)
  results
}

#### NHST Function for a Single Group and Variable Contrast

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(sumstats,contrast,mu=0,...) {
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  round(results,3)
}

nhstContrast.wss <- function(sumstats,corrstats,contrast,mu=0,...) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- (t(contrast)%*%M)
  covstats <- cor2cov(corrstats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  round(results,3)
}

nhstContrast.default <- function(...,contrast,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstContrast(sumstats,corrstats,contrast,mu=mu)
  results
}

nhstContrast.formula <- function(formula,contrast,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstContrast(sumstats,contrast,mu=mu)
  results
}

### Wrappers for NHST Functions

testLevels <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS\n\n")
  print(nhstLevels(...))
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(nhstDifference(...)) 
  cat("\n")
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(nhstContrast(...)) 
  cat("\n")  
}

### SMD Functions

#### SMD Function for Mutiple Groups and Variables

smdLevels <- function(...) 
  UseMethod("smdLevels")
  
smdLevels.wss <- smdLevels.bss <- function(sumstats,conf.level=.95,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  MD <- M-mu
  cohend <- MD/SD
  eta <- N-1
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(N)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results <- round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  results
}

smdLevels.default <- function(...,conf.level=.95,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- smdLevels(sumstats,conf.level=conf.level,mu=mu)
  results
}

smdLevels.formula <- function(formula,conf.level=.95,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdLevels(sumstats,conf.level=conf.level,mu=mu)
  results
}


#### SMD Function for Group and Variable Differences

smdDifference <- function(...) 
  UseMethod("smdDifference")
  
smdDifference.wss <- function(compstats,corrstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N  <- compstats[1:2,1]
  M <- compstats[1:2,2]
  SD <- compstats[1:2,3]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]  
  ntilde <- 1/mean(1/N) 
  MD <- M[1]-M[2]
  SDp <- sqrt((N[1]-1)*SD[1]^2+(N[2]-1)*SD[2]^2)/sqrt(N[1]+N[2]-2)
  cohend <- MD/SDp
  eta <- N[1]+N[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(ntilde/(2*(1-R)))
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  results
}

smdDifference.bss <- function(compstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[1:2,1]
  M <- compstats[1:2,2]
  SD <- compstats[1:2,3]
  ntilde <- 1/mean(1/N) 
  MD <- (M[1]-M[2])
  SDp <- sqrt((N[1]-1)*SD[1]^2+(N[2]-1)*SD[2]^2)/sqrt(N[1]+N[2]-2)
  cohend <- MD/SDp
  eta <- N[1]+N[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(ntilde/2)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  results
}

smdDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- smdDifference(compstats,corrstats,conf.level=conf.level)
  results
}

smdDifference.formula <- function(formula,conf.level=.95,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- smdDifference(compstats,conf.level=conf.level)
  results
}


### Wrappers for SMD Functions

effectLevels <- function(...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS\n\n")
  print(smdLevels(...))
  cat("\n")
}

effectDifference <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}
